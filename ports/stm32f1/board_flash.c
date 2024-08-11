#include "board_api.h"
#include "usart.h"
#include "board_flash.h"

#define FLASH_BASE_ADDR     0x08000000UL

// TinyUF2 by default resides in the first 8 flash pages on STM32F1s, therefore these are write protected
#if BOARD_FLASH_APP_START == 0x08010000
#define BOOTLOADER_PAGE_MASK (OB_WRP_PAGES0TO1 | OB_WRP_PAGES2TO3 | OB_WRP_PAGES4TO5 | OB_WRP_PAGES6TO7)
#endif

enum
{
    SECTOR_COUNT = (BOARD_FLASH_SIZE / BOARD_PAGE_SIZE),
    BOOTLOADER_SECTOR_COUNT = ((BOARD_FLASH_APP_START - FLASH_BASE_ADDR) / BOARD_PAGE_SIZE)
};

static uint8_t erased_sectors[SECTOR_COUNT] = {0};
static uint32_t flash_ptr = BOARD_FLASH_APP_START;

static uint32_t flash_write(uint32_t dst, const uint8_t *src, int len);

static inline uint32_t flash_sector_size(uint32_t sector)
{
    (void) sector;
    return BOARD_PAGE_SIZE;
}

static bool is_blank(uint32_t addr, uint32_t size)
{
    for (uint32_t i = 0; i < size; i += 4)
    {
        if ( *(uint32_t *) (addr + i) != 0xFFFFFFFF)
        {
            return false;
        }
    }

    return true;
}

static bool flash_erase_sector(uint32_t addr)
{
    // starting address from 0x08000000
    uint32_t sector_addr = FLASH_BASE_ADDR;
    bool erased = false;
    uint32_t size = 0;

    for ( uint32_t i = 0; i < SECTOR_COUNT; i++)
    {
        size = flash_sector_size(i);
        if (sector_addr + size > addr)
        {
            erased = erased_sectors[i];
            erased_sectors[i] = 1;
            break;
        }
        sector_addr += size;
    }

    if ( !erased && !is_blank(sector_addr, size))
    {
        printf("Erase : %08lX size = %lu KB ...", sector_addr, size / 1024);

        FLASH_EraseInitTypeDef EraseInit;
        EraseInit.TypeErase = FLASH_TYPEERASE_PAGES;
        EraseInit.PageAddress = sector_addr;
        EraseInit.NbPages = 1;

        uint32_t SectorError = 0;
        HAL_FLASHEx_Erase(&EraseInit, &SectorError);
        FLASH_WaitForLastOperation(HAL_MAX_DELAY);

        printf("ok\r\n");
    }

    return true;
}

static uint32_t flash_write(uint32_t dst, const uint8_t *src, int len)
{
    uint32_t ret = BOARD_FLASH_OK;
    flash_erase_sector(dst);

    printf("Write flash at address %08lX\r\n", dst);
    for (int i = 0; i < len; i += 4)
    {
        uint32_t data = *( (uint32_t *) ((void *) (src + i)) );

        if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_WORD, dst + i, (uint64_t) data) != HAL_OK)
        {
            printf("Failed to write flash at address %08lX\r\n", dst + i);
            ret = BOARD_FLASH_WRITE_FAILED;
            break;
        }

        if (FLASH_WaitForLastOperation(HAL_MAX_DELAY) != HAL_OK)
        {
            printf("Waiting on last operation failed\r\n");
            ret = BOARD_FLASH_WAIT_OPER_FAILED;
            break;
        }
    }

    // verify contents
    if (memcmp((void*)dst, src, len) != 0)
    {
        printf("Failed to write\r\n");
        ret = BOARD_FLASH_WRITE_INCONSISTENT;
    }
    return ret;
}

//--------------------------------------------------------------------+
// Board API
//--------------------------------------------------------------------+
void board_flash_init(void)
{

}

uint32_t board_flash_size(void)
{
    return BOARD_FLASH_SIZE;
}

void board_flash_read(uint32_t addr, void* buffer, uint32_t len)
{
    memcpy(buffer, (void*)addr, len);
}

uint32_t board_flash_flush(uint32_t logical)
{
    uint64_t data;
    uint32_t ret;
    uint32_t outLen = 0u;
    uint32_t status;
    uint32_t cntr = 0u;
    char msg[40] = {0x00};

    flash_ptr = logical;

    /* Unlock flash */
    HAL_FLASH_Unlock();

    /* Programming */
    do {
        data = 0xFFFFFFFFFFFFFFFF;
        ret = usart_read(&data, sizeof(data), &outLen);
        if (outLen) {
            if (!(flash_ptr <= (FLASH_BASE_ADDR + BOARD_FLASH_SIZE - 8)) || 
                (flash_ptr < logical)) {
                    HAL_FLASH_Lock();
                    return BOARD_FLASH_OUT_OR_RANGE;
                }
            status = flash_write(flash_ptr, (const uint8_t *)&data, outLen);
            if (status == BOARD_FLASH_OK) {
                cntr++;
                flash_ptr += outLen;
            } else {
                sprintf(msg, "Programming error at: %lu byte\n", (cntr * 8));
                printf(msg);
                return status;
            }
        }
        if (cntr % 256 == 0) {
            // LED LIGHT
        }
    } while ((ret == 0) && (outLen > 0));

    /* Lock flash */
    HAL_FLASH_Lock();

    printf("Programming finished. \n");
    sprintf(msg, "Flashed: %lu bytes.\n", (cntr * 8));
    printf(msg);

    /* Verify Flash Content */
    flash_ptr = logical;
    cntr = 0u;
    do {
        data = 0xFFFFFFFFFFFFFFFF;
        ret = usart_read(&data, sizeof(uint32_t), &outLen);
        if (outLen) {
            if (*(uint32_t *)flash_ptr == (uint32_t)data) {
                flash_ptr += 4;
                cntr++;
            } else {
                printf("Verification error at %lu byte.\n", (cntr * 4));
                return BOARD_FLASH_VERIFICATION;
            }
        }

        if (cntr % 256 == 0) {
            // LED LIGHT
        }
    } while ((ret == 0) && (outLen > 0));
    printf("Verification passed.\n");

    return BOARD_FLASH_OK;
}

void board_flash_write(uint32_t addr, void const *data, uint32_t len)
{
    HAL_FLASH_Unlock();
    (void)flash_write(addr, data, len);
    HAL_FLASH_Lock();
}

void board_flash_erase_app(void)
{

}

bool board_flash_protect_bootloader(bool protect)
{
    if (board_reset_by_option_bytes()) {
        return true;
    }

    bool ret = true;

    HAL_FLASH_Unlock();
    HAL_FLASH_OB_Unlock();

    FLASH_OBProgramInitTypeDef ob_current = {0};
    HAL_FLASHEx_OBGetConfig(&ob_current);

    bool const already_protected = (ob_current.WRPPage & BOOTLOADER_PAGE_MASK) == 0;

    printf("Protection: current = %u, request = %u\r\n", already_protected, protect);

    // request and current state mismatched --> require ob program

    if (protect != already_protected) {
        FLASH_OBProgramInitTypeDef ob_update = {0};
        ob_update.OptionType = OPTIONBYTE_WRP;
        ob_update.WRPPage = BOOTLOADER_PAGE_MASK;
        ob_update.WRPState = protect ? OB_WRPSTATE_ENABLE : OB_WRPSTATE_DISABLE;

        if (HAL_FLASHEx_OBProgram(&ob_update) == HAL_OK) {
            HAL_FLASH_OB_Launch();
        } else {
            ret = false;
        }
    }

    HAL_FLASH_OB_Lock();
    HAL_FLASH_Lock();

    return ret;
}
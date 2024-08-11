#include "board_api.h"
#include "usart.h"
#include "key.h"

#define DEV_JUMPTOAPP_CNT 20

uint32_t g_jumpRetryCnt = 0u;

int main(void)
{
    uint8_t key;
    uint8_t t = 0u;
    uint32_t ret;
    board_init();

    while (1) {
        uint32_t datalength = usart_recive_data_length();
        uint8_t datatemp[7];

        t++;
        HAL_Delay(100);
        if (t == 3) {
            LED0_TOGGLE();
            t = 0;
        }

        board_flash_read(BOARD_FLASH_TOP_SPACE, (void *)datatemp, 8);
        if ((strncmp((const char *)datatemp, "UPDATE", 6) == 0) || g_jumpRetryCnt > DEV_JUMPTOAPP_CNT) {
            key = key_scan(0);
            if (key == WKUP_PRES) {
                if (datalength) {
                    printf("Start Update firmare... \r\n");
                    ret = board_flash_flush(BOARD_FLASH_APP_START);
                    if (ret != 0) {
                        printf("update firmare failed %ld\r\n", ret);
                    } else {
                        printf("Firmware Update Finish!!!\r\n");
                        board_flash_write(BOARD_FLASH_TOP_SPACE, (void const *)"XXXXXX", 8);
                        board_app_jump();
                    }
                } else {
                    printf("No firmware to update!\r\n");
                }
            }
        } else {
            board_app_jump();
            g_jumpRetryCnt++;
        }

    }
}
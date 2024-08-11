#include "board_api.h"
#include "usart.h"
#include "rtc.h"

//--------------------------------------------------------------------+
// MACRO TYPEDEF CONSTANT ENUM DECLARATION
//--------------------------------------------------------------------+

#define STM32_UUID      ((volatile uint32_t *) UID_BASE)

typedef void (*pFunction)(void); /*!<Function pointer definition */

static bool reset_by_option_bytes = false;

static void board_gpio_init(void);

static void board_gpio_init(void)
{
    __HAL_RCC_GPIOA_CLK_ENABLE();
    __HAL_RCC_GPIOB_CLK_ENABLE();
    __HAL_RCC_GPIOE_CLK_ENABLE();
    __HAL_RCC_AFIO_CLK_ENABLE();

    GPIO_InitTypeDef GPIO_InitStruct = {0};

    /*Configure GPIO pin : LED0_Pin */
    GPIO_InitStruct.Pin = LED0_PIN;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_PULLUP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(LED0_GPIO_PORT, &GPIO_InitStruct);
    GPIO_InitStruct.Pin = LED1_PIN;
    HAL_GPIO_Init(LED1_GPIO_PORT, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = BEEP_PIN;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_PULLUP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(BEEP_GPIO_PORT, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = KEY0_PIN;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_PULLUP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(KEY0_GPIO_PORT, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = KEY1_PIN;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_PULLUP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(KEY1_GPIO_PORT, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = WKUP_PIN;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_PULLDOWN;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(WKUP_GPIO_PORT, &GPIO_InitStruct);

}

bool board_reset_by_option_bytes(void)
{
    return reset_by_option_bytes;
}

void board_init(void)
{
    // reset_by_option_bytes = !!(__HAL_RCC_GET_FLAG(RCC_FLAG_OBLRST));

    HAL_Init();
    clock_init();
    rtc_init();
    SystemCoreClockUpdate();

    // disable systick
    board_timer_stop();
    board_gpio_init();
    MX_USART1_UART_Init();
}

void board_reset(void)
{
  NVIC_SystemReset();
}

bool board_app_valid(void)
{
    // && ((*(uint32_t*)BOARD_FLASH_APP_START + 4) > BOARD_FLASH_APP_START) && ((*(uint32_t*)BOARD_FLASH_APP_START + 4) < BOARD_FLASH_APP_START + BOARD_FLASH_SIZE)
    if((((*(uint32_t*)BOARD_FLASH_APP_START) - BOARD_RAM_START) <= BOARD_RAM_SIZE)) 
    {
        return true;
    }
    return false;
}

void board_app_jump(void)
{
    volatile uint32_t const * app_vector = (volatile uint32_t const*) BOARD_FLASH_APP_START;
    uint32_t sp = app_vector[0];
    pFunction app_entry = (pFunction)app_vector[1];

    HAL_GPIO_DeInit(LED0_GPIO_PORT, LED0_PIN);
    HAL_GPIO_DeInit(LED1_GPIO_PORT, LED1_PIN);
    HAL_GPIO_DeInit(BEEP_GPIO_PORT, BEEP_PIN);
    HAL_GPIO_DeInit(KEY0_GPIO_PORT, KEY0_PIN);
    HAL_GPIO_DeInit(KEY1_GPIO_PORT, KEY1_PIN);
    HAL_GPIO_DeInit(WKUP_GPIO_PORT, WKUP_PIN);

    __HAL_RCC_GPIOA_CLK_DISABLE();
    __HAL_RCC_GPIOB_CLK_DISABLE();
    __HAL_RCC_GPIOE_CLK_DISABLE();
    __HAL_RCC_AFIO_CLK_DISABLE();

    HAL_RCC_DeInit();
    HAL_DeInit();

    SysTick->CTRL = 0;
    SysTick->LOAD = 0;
    SysTick->VAL = 0;

    // Disable all Interrupts

    NVIC->ICER[0] = 0xFFFFFFFF;
    NVIC->ICER[1] = 0xFFFFFFFF;
    NVIC->ICER[2] = 0xFFFFFFFF;
    NVIC->ICER[3] = 0xFFFFFFFF;

    /* switch exception handlers to the application */
    SCB->VTOR = (uint32_t) BOARD_FLASH_APP_START;

    // Set stack pointer
    __set_MSP(sp);

    // Jump to Application Entry
    // asm("bx %0" ::"r"(app_entry));
    app_entry();
}

void board_sysmem_jump(void)
{
    volatile uint32_t const *sysmem_vector = (volatile uint32_t const *)BOARD_FLASH_SYSMEM_START;
    uint32_t sp = sysmem_vector[0];
    pFunction sysmem_entry = (pFunction)sysmem_vector[1];

    HAL_GPIO_DeInit(LED0_GPIO_PORT, LED0_PIN);
    HAL_GPIO_DeInit(LED1_GPIO_PORT, LED1_PIN);
    HAL_GPIO_DeInit(BEEP_GPIO_PORT, BEEP_PIN);
    HAL_GPIO_DeInit(KEY0_GPIO_PORT, KEY0_PIN);
    HAL_GPIO_DeInit(KEY1_GPIO_PORT, KEY1_PIN);
    HAL_GPIO_DeInit(WKUP_GPIO_PORT, WKUP_PIN);

    __HAL_RCC_GPIOA_CLK_DISABLE();
    __HAL_RCC_GPIOB_CLK_DISABLE();
    __HAL_RCC_GPIOE_CLK_DISABLE();
    __HAL_RCC_AFIO_CLK_DISABLE();

    HAL_RCC_DeInit();
    HAL_DeInit();

    SysTick->CTRL = 0;
    SysTick->LOAD = 0;
    SysTick->VAL = 0;

    // Disable all Interrupts

    NVIC->ICER[0] = 0xFFFFFFFF;
    NVIC->ICER[1] = 0xFFFFFFFF;
    NVIC->ICER[2] = 0xFFFFFFFF;
    NVIC->ICER[3] = 0xFFFFFFFF;

    // Set stack pointer
    __set_MSP(sp);

    // Jump to System Memory Entry
    // asm("bx %0" ::"r"(sysmem_entry));
    sysmem_entry();
}

//--------------------------------------------------------------------+
// Timer
//--------------------------------------------------------------------+

void board_timer_start(uint32_t ms)
{
    SysTick_Config((SystemCoreClock/1000) * ms);
}

void board_timer_stop(void)
{
    SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;
}

// void SysTick_Handler (void)
// {
//     board_timer_handler();
// }
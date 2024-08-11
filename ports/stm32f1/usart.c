#include "usart.h"
#include "stm32f1xx_hal_uart.h"

#define LED0_TOGGLE() do { HAL_GPIO_TogglePin(LED0_GPIO_PORT, LED0_PIN);}while(0)

UART_HandleTypeDef huart1;

uint8_t g_usart_rx_buf[USART_REC_LEN];
uint8_t aRxBuffer[RXBUFFERSIZE];
uint16_t g_usart_rx_sta = 0;
uint32_t g_usart_rx_cnt = 0;
uint32_t g_usart_rx_offset = 0u;

// static void usart_recive_byte(void);
static void usart_recive_stream(void);

// #if 1

// #pragma import(__use_no_semihosting)

// struct __FILE
// {
//     int handle;
// };

// FILE __stdout;

// int __ttywrch(int ch)
// {
//     ch = ch;
//     return ch;
// }

// void __sys_exit(int x)
// {
//     x = x;
// }

// char *_sys_command_string(char *cmd, int len)
// {
//     return NULL;
// }

// #ifdef __GNUC__
// #define PUTCHAR_PROTOTYPE int __write(int fd, char *pBuffer, int size)
// #else
// #define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
// #endif
// PUTCHAR_PROTOTYPE
// {
//     for (int i = 0; i < size; i++) {
//         while((USART_UX->SR & 0x40) == 0);
//         USART_UX->DR = (uint8_t)pBuffer[i];
//     }
//     return size;
// }


// #endif

int _write (int fd, char *pBuffer, int size)
{
    for (int i = 0; i < size; i++) {
        while((USART_UX->SR & 0x40) == 0);
        USART_UX->DR = (uint8_t)pBuffer[i];
    }
    return size;
}

void UART_Send_Msg(void)
{
    uint8_t len;
    static uint16_t times = 0;
    if (g_usart_rx_sta & 0x8000) {
        len = g_usart_rx_sta & 0x3fff;
        printf("\r\n you send message:\r\n");
        HAL_UART_Transmit(&huart1, (uint8_t *)g_usart_rx_buf, len, 1000);

        while(__HAL_UART_GET_FLAG(&huart1, UART_FLAG_TC) != SET);

        printf("\r\n\r\n");
        g_usart_rx_sta = 0;
    } else {
        times++;
        if (times % 5000 == 0) {
        printf("\r\n usart test \r\n");
        printf("!!!!!!!!!!!\r\n");
        }

        if (times % 200 == 0) {
        printf("please input and enter \r\n");
        }

        if (times % 30 == 0) {
            LED0_TOGGLE();
        }

        HAL_Delay(10);
    }
}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
void MX_USART1_UART_Init(void)
{

    /* USER CODE BEGIN USART1_Init 0 */

    /* USER CODE END USART1_Init 0 */

    /* USER CODE BEGIN USART1_Init 1 */

    /* USER CODE END USART1_Init 1 */
    huart1.Instance = USART1;
    huart1.Init.BaudRate = 115200;
    huart1.Init.WordLength = UART_WORDLENGTH_8B;
    huart1.Init.StopBits = UART_STOPBITS_1;
    huart1.Init.Parity = UART_PARITY_NONE;
    huart1.Init.HwFlowCtl = UART_PARITY_NONE;
    huart1.Init.Mode = UART_MODE_TX_RX;
    huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
    HAL_UART_Init(&huart1);
    /* USER CODE BEGIN USART1_Init 2 */
    HAL_UART_Receive_IT(&huart1, (uint8_t *)aRxBuffer, RXBUFFERSIZE);
    /* USER CODE END USART1_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
void USART1_IRQHandler(void)
{
    /* USER CODE BEGIN USART1_IRQn 0 */

    /* USER CODE END USART1_IRQn 0 */
    HAL_UART_IRQHandler(&huart1);
    /* USER CODE BEGIN USART1_IRQn 1 */
    while (HAL_UART_Receive_IT(&huart1, (uint8_t *)aRxBuffer,
    RXBUFFERSIZE) != HAL_OK)
    {
        /* 如果出错就会卡死在这里 */ 
    }
    /* USER CODE END USART1_IRQn 1 */
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    if (huart->Instance == USART1) {
        usart_recive_stream();
    }
}

// static void usart_recive_byte(void)
// {
//     if ((g_usart_rx_sta & 0x8000) == 0) {
//         if (g_usart_rx_sta & 0x4000) {
//             if (aRxBuffer[0] != 0x0a) {
//             g_usart_rx_sta = 0;
//             } else {
//             g_usart_rx_sta |= 0x8000;
//             }
//         } else {
//             if (aRxBuffer[0] == 0x0d) {
//             g_usart_rx_sta |= 0x4000;
//             } else {
//             g_usart_rx_buf[g_usart_rx_sta & 0x3FFF] = aRxBuffer[0];
//             g_usart_rx_sta++;
//             if (g_usart_rx_sta > (USART_REC_LEN - 1)) {
//                 g_usart_rx_sta = 0;
//             }
//             }
//         }
//     }
// }

static void usart_recive_stream(void)
{
    if (g_usart_rx_cnt < USART_REC_LEN) {
        g_usart_rx_buf[g_usart_rx_cnt] = aRxBuffer[0];
        g_usart_rx_cnt++;
    }
}

uint32_t usart_recive_data_length(void)
{
    uint32_t oldcount = 0u;
    uint32_t applength = 0u;
    if (g_usart_rx_cnt) {
        if (oldcount == g_usart_rx_cnt) {
            applength = g_usart_rx_cnt;
            oldcount = 0u;
            g_usart_rx_cnt = 0u;
            printf("User Procedure Recive finish!");
            printf("Code Length: %ldBytes\r\n", applength);
        } else {
            oldcount = g_usart_rx_cnt;
        }
    }

    return applength;
}

uint32_t usart_read(void *buff, uint32_t btr, uint32_t *br)
{
    uint32_t ret = USART_OK;
    uint32_t dataLength = 0u;

    do {
        if ((buff == NULL) && (br == NULL)) {
            ret = USART_NULL_PTR;
            break;
        }
        
        dataLength = usart_recive_data_length();

        if (g_usart_rx_offset <= dataLength) {
            memcpy(buff, &g_usart_rx_buf[g_usart_rx_offset], btr);
            g_usart_rx_offset += btr;
            *br = btr;
        } else {
            g_usart_rx_offset = 0u;
            *br = 0;
            break;
        }

    } while (FALSE);

    return ret;
}
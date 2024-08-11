#ifndef __USART_H
#define __USART_H

#include "board_api.h"

#define USART_REC_LEN               55 * 1024
#define USART_EN_RX                 1
#define RXBUFFERSIZE                1



/* error code */
#define USART_OK                    0       /* OK */
#define USART_NULL_PTR              1       /* Null pointer */
#define USART_NO_RECIVE_DATA        2       /* No Data */

extern uint8_t g_usart_rx_buf[USART_REC_LEN];
extern uint8_t aRxBuffer[RXBUFFERSIZE];
extern uint16_t g_usart_rx_sta;
extern uint32_t g_usart_rx_cnt;

void MX_USART1_UART_Init(void);
void USART1_IRQHandler(void);
extern void UART_Send_Msg(void);
extern uint32_t usart_recive_data_length(void);
extern uint32_t usart_read(void *buff, uint32_t btr, uint32_t *br);
/* USER CODE BEGIN PFP */
// void usart_init(uint32_t pclk2, uint32_t bound);
#endif
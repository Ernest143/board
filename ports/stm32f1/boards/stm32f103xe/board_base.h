#ifndef BOARD_BASE_H
#define BOARD_BASE_H

#include "stm32f1xx_hal.h"

/* GPIO Init */
#define TX_PIN GPIO_PIN_9
#define TX_GPIO_PORT GPIOA
#define RX_PIN GPIO_PIN_10
#define RX_GPIO_PORT GPIOA

#define TX_PIN3 GPIO_PIN_10
#define TX_GPIO_PORT3 GPIOB
#define RX_PIN3 GPIO_PIN_11
#define RX_GPIO_PORT3 GPIOB

#define LED0_PIN GPIO_PIN_5
#define LED0_GPIO_PORT GPIOB

#define LED1_PIN GPIO_PIN_5
#define LED1_GPIO_PORT GPIOE

#define KEY0_PIN GPIO_PIN_4
#define KEY0_GPIO_PORT GPIOE

#define KEY1_PIN GPIO_PIN_3
#define KEY1_GPIO_PORT GPIOE

#define WKUP_PIN GPIO_PIN_0
#define WKUP_GPIO_PORT GPIOA

#define BEEP_PIN    GPIO_PIN_8
#define BEEP_GPIO_PORT GPIOB

/* IRQ_Init */

#define KEY0_IRQN EXTI4_IRQn
#define KEY0_IRQHANDLER EXTI4_IRQHandler

#define KEY1_IRQN EXTI3_IRQn
#define KEY1_IRQHANDLER EXTI3_IRQHandler

#define WKUP_IRQN EXTI0_IRQn
#define WKUP_IRQHANDLER EXTI0_IRQHandler

#define USART_UX                    USART1
#define USART_UX_IRQn               USART1_IRQn
#define USART_UX_IRQHandler         USART1_IRQHandler
#define USART_UX_CLK_ENABLE()       do { RCC->APB2ENR |= 1 << 14; }while(0)

/* TFT_LED */
#define LCD_WR_GPIO_PORT                GPIOD
#define LCD_WR_GPIO_PIN                 GPIO_PIN_5
#define LCD_WR_GPIO_CLK_ENABLE()        do{ __HAL_RCC_GPIOD_CLK_ENABLE(); }while(0)   /* ����IO��ʱ��ʹ�� */

#define LCD_RD_GPIO_PORT                GPIOD
#define LCD_RD_GPIO_PIN                 GPIO_PIN_4
#define LCD_RD_GPIO_CLK_ENABLE()        do{ __HAL_RCC_GPIOD_CLK_ENABLE(); }while(0)   /* ����IO��ʱ��ʹ�� */

#define LCD_BL_GPIO_PORT                GPIOB
#define LCD_BL_GPIO_PIN                 GPIO_PIN_0
#define LCD_BL_GPIO_CLK_ENABLE()        do{ __HAL_RCC_GPIOB_CLK_ENABLE(); }while(0)   /* ��������IO��ʱ��ʹ�� */

/* LCD_CS(��Ҫ����LCD_FSMC_NEX������ȷ��IO��) �� LCD_RS(��Ҫ����LCD_FSMC_AX������ȷ��IO��) ���� ���� */
#define LCD_CS_GPIO_PORT                GPIOG
#define LCD_CS_GPIO_PIN                 GPIO_PIN_12
#define LCD_CS_GPIO_CLK_ENABLE()        do{ __HAL_RCC_GPIOG_CLK_ENABLE(); }while(0)   /* ����IO��ʱ��ʹ�� */

#define LCD_RS_GPIO_PORT                GPIOG
#define LCD_RS_GPIO_PIN                 GPIO_PIN_0
#define LCD_RS_GPIO_CLK_ENABLE()        do{ __HAL_RCC_GPIOG_CLK_ENABLE(); }while(0)   /* ����IO��ʱ��ʹ�� */

/* FSMC��ز���? ���� 
 * ע��: ����Ĭ����ͨ��FSMC��1������LCD, ��1��4��Ƭѡ: FSMC_NE1~4
 *
 * �޸�LCD_FSMC_NEX, ��Ӧ��LCD_CS_GPIO�������Ҳ�ø�?
 * �޸�LCD_FSMC_AX , ��Ӧ��LCD_RS_GPIO�������Ҳ�ø�?
 */
#define LCD_FSMC_NEX         4              /* ʹ��FSMC_NE4��LCD_CS,ȡֵ��Χֻ����: 1~4 */
#define LCD_FSMC_AX          10             /* ʹ��FSMC_A10��LCD_RS,ȡֵ��Χ��: 0 ~ 25 */

#define TRUE  1
#define FALSE 0

#define LCD_FSMC_BCRX        FSMC_Bank1->BTCR[(LCD_FSMC_NEX - 1) * 2]       /* BCR�Ĵ���,����LCD_FSMC_NEX�Զ����� */
#define LCD_FSMC_BTRX        FSMC_Bank1->BTCR[(LCD_FSMC_NEX - 1) * 2 + 1]   /* BTR�Ĵ���,����LCD_FSMC_NEX�Զ����� */
#define LCD_FSMC_BWTRX       FSMC_Bank1E->BWTR[(LCD_FSMC_NEX - 1) * 2]      /* BWTR�Ĵ���,����LCD_FSMC_NEX�Զ����� */

#define BOARD_LIST_NUM(list)    (sizeof(list) / sizeof(list[0]))
//--------------------------------------------------------------------+
// Flash
//--------------------------------------------------------------------+

// Flash size of the board
#define BOARD_FLASH_SIZE  (512 * 1024)

#endif
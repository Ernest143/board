#ifndef BOARD_BASE_H
#define BOARD_BASE_H

#include "stm32f1xx_hal.h"

/* GPIO Init */
#define TX_PIN GPIO_PIN_9
#define TX_GPIO_PORT GPIOA
#define RX_PIN GPIO_PIN_10
#define RX_GPIO_PORT GPIOA

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

/* FSMC��ز��� ���� 
 * ע��: ����Ĭ����ͨ��FSMC��1������LCD, ��1��4��Ƭѡ: FSMC_NE1~4
 *
 * �޸�LCD_FSMC_NEX, ��Ӧ��LCD_CS_GPIO�������Ҳ�ø�
 * �޸�LCD_FSMC_AX , ��Ӧ��LCD_RS_GPIO�������Ҳ�ø�
 */
#define LCD_FSMC_NEX         4              /* ʹ��FSMC_NE4��LCD_CS,ȡֵ��Χֻ����: 1~4 */
#define LCD_FSMC_AX          10             /* ʹ��FSMC_A10��LCD_RS,ȡֵ��Χ��: 0 ~ 25 */

#define TRUE  1
#define FALSE 0

#define LCD_FSMC_BCRX        FSMC_Bank1->BTCR[(LCD_FSMC_NEX - 1) * 2]       /* BCR�Ĵ���,����LCD_FSMC_NEX�Զ����� */
#define LCD_FSMC_BTRX        FSMC_Bank1->BTCR[(LCD_FSMC_NEX - 1) * 2 + 1]   /* BTR�Ĵ���,����LCD_FSMC_NEX�Զ����� */
#define LCD_FSMC_BWTRX       FSMC_Bank1E->BWTR[(LCD_FSMC_NEX - 1) * 2]      /* BWTR�Ĵ���,����LCD_FSMC_NEX�Զ����� */

//--------------------------------------------------------------------+
// Flash
//--------------------------------------------------------------------+

// Flash size of the board
#define BOARD_FLASH_SIZE  (512 * 1024)
//--------------------------------------------------------------------+
// RCC Clock
//--------------------------------------------------------------------+
static inline void clock_init(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE|RCC_OSCILLATORTYPE_LSI;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.LSIState = RCC_LSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
  HAL_RCC_OscConfig(&RCC_OscInitStruct);
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2);

  /* Enable Power Clock */
  __HAL_RCC_PWR_CLK_ENABLE();
}

#endif
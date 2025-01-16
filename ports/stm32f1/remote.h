#ifndef __REMOTE_H
#define __REMOTE_H

#include "board_base.h"


#define REMOTE_IN_GPIO_PORT                         GPIOB
#define REMOTE_IN_GPIO_PIN                          GPIO_PIN_9
#define REMOTE_IN_GPIO_CLK_ENABLE()                 do { __HAL_RCC_GPIOB_CLK_ENABLE(); } while (0)

#define REMOTE_IN_TIMX                              TIM4
#define REMOTE_IN_TIMX_IRQn                         TIM4_IRQn
#define REMOTE_IN_TIMX_IRQHandler                   TIM4_IRQHandler
#define REMOTE_IN_TIMX_CHY                          TIM_CHANNEL_4
#define REMOTE_IN_TIMX_CCRY                         REMOTE_IN_TIMX->CCR4
#define REMOTE_IN_TIMX_CHY_CLK_ENABLE()             do { __HAL_RCC_TIM4_CLK_ENABLE(); } while (0)

#define REMOTE_KEY_LEFT     68      // LEFT
#define REMOTE_KEY_RIGHT    67      // RIGHT
#define REMOTE_KEY_UP       70      // UP
#define REMOTE_KEY_DOWN     21      // DOWN
#define REMOTE_KEY_PLAY     64      // PLAY
#define REMOTE_KEY_POWER    69      // POWER
#define REMOTE_KEY_VOL_RDC   7       // VOL-
#define REMOTE_KEY_VOL_ADD  9       // VOL+
#define REMOTE_KEY_1        22      // 1
#define REMOTE_KEY_2        25      // 2
#define REMOTE_KEY_3        13      // 3
#define REMOTE_KEY_4        12      // 4
#define REMOTE_KEY_5        24      // 5
#define REMOTE_KEY_6        94      // 6
#define REMOTE_KEY_7        8       // 7
#define REMOTE_KEY_8        28      // 8
#define REMOTE_KEY_9        90      // 9
#define REMOTE_KEY_0        66      // 0
#define REMOTE_KEY_DEL      74      // DEL
#define REMOTE_KEY_MARK     71      // MARK

#define RDATA           HAL_GPIO_ReadPin(REMOTE_IN_GPIO_PORT, REMOTE_IN_GPIO_PIN)

/* 红外遥控识别码 ID */
#define REMOTE_ID   0
extern uint8_t g_remote_cnt;

void remote_init(void);
uint8_t remote_scan(void);

#endif
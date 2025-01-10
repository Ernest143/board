#ifndef __MOTOR_TIM_H
#define __MOTOR_TIM_H

#include "board_base.h"

/* motor 1 related definitions */
#define PWM_TIM_0                    TIM1
#define PWM_TIM_0_GPIO_AF_ENABLE()   __HAL_AFIO_REMAP_TIM1_ENABLE();
#define PWM_TIM_0_CLK_ENABLE()       __HAL_RCC_TIM1_CLK_ENABLE();

#define PWM0_CHANNEL_1               TIM_CHANNEL_1
#define PWM0_CHANNEL_2               TIM_CHANNEL_2

#define PWM0_PERIOD_COUNT            (3600)

#define PWM0_PRESCALER_COUNT         (2)
#define PWM0_MAX_PERIOD_COUNT        (PWM0_PERIOD_COUNT - 100)

#define PWM0_TIM_CH1_GPIO_CLK()      __HAL_RCC_GPIOE_CLK_ENABLE();
#define PWM0_TIM_CH1_GPIO_PORT       GPIOE
#define PWM0_TIM_CH1_PIN             GPIO_PIN_9

#define PWM0_TIM_CH2_GPIO_CLK()      __HAL_RCC_GPIOE_CLK_ENABLE();
#define PWM0_TIM_CH2_GPIO_PORT       GPIOE
#define PWM0_TIM_CH2_PIN             GPIO_PIN_11

/* motor 2 related definitions */
#define PWM_TIM_1                    TIM3
#define PWM_TIM_1_GPIO_AF_ENABLE()   __HAL_AFIO_REMAP_TIM3_ENABLE();
#define PWM_TIM_1_CLK_ENABLE()       __HAL_RCC_TIM3_CLK_ENABLE();

#define PWM1_CHANNEL_1               TIM_CHANNEL_1
#define PWM1_CHANNEL_2               TIM_CHANNEL_2

#define PWM1_PERIOD_COUNT            (3600)

#define PWM1_PRESCALER_COUNT         (2)
#define PWM1_MAX_PERIOD_COUNT        (PWM1_PERIOD_COUNT - 100)

#define PWM1_TIM_CH1_GPIO_CLK()      __HAL_RCC_GPIOC_CLK_ENABLE();
#define PWM1_TIM_CH1_GPIO_PORT       GPIOC
#define PWM1_TIM_CH1_PIN             GPIO_PIN_6

#define PWM1_TIM_CH2_GPIO_CLK()      __HAL_RCC_GPIOC_CLK_ENABLE();
#define PWM1_TIM_CH2_GPIO_PORT       GPIOC
#define PWM1_TIM_CH2_PIN             GPIO_PIN_7


#define PWM_MOTOR_NUM   2
#define PWM_CHANNEL_NUM   2

#define PWM_TIM_CLK_ENABLE()     do {   \
    PWM_TIM_0_CLK_ENABLE();             \
    PWM_TIM_1_CLK_ENABLE();             \
} while (0)

#define PWM_TIM_GPIO_AF_ENABLE() do {   \
    PWM_TIM_0_GPIO_AF_ENABLE();         \
    PWM_TIM_1_GPIO_AF_ENABLE();         \
} while (0)

#define PWM_TIM_CH_GPIO_CLK()    do {   \
    PWM0_TIM_CH1_GPIO_CLK();            \
    PWM0_TIM_CH2_GPIO_CLK();            \
    PWM1_TIM_CH1_GPIO_CLK();            \
    PWM1_TIM_CH2_GPIO_CLK();            \
} while (0)

typedef struct {
    uint32_t    channel;                 // Motor tim channel
    GPIO_TypeDef *gpio;
    GPIO_InitTypeDef initSt;
} MotorChannelType;


typedef struct {
    TIM_HandleTypeDef   motorTim;         // Motor clock configuration
    TIM_OC_InitTypeDef  motorPwmMode;     // Motor PWM Mode
    MotorChannelType    motorChannels[PWM_CHANNEL_NUM];    // Motor IO
} MotorCfgType;

#define PWM_PERIOD_COUNT            (3600)

#define PWM_PRESCALER_COUNT         (2)
#define PWM_MAX_PERIOD_COUNT        (PWM_PERIOD_COUNT - 100)

extern MotorCfgType g_timx_pwm_handle_list[PWM_MOTOR_NUM];

void gtim_timx_pwm_chy_init(void);

#endif
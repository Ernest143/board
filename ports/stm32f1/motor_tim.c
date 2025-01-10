#include "motor_tim.h"


MotorCfgType g_timx_pwm_handle_list[PWM_MOTOR_NUM] = {
    /* motor 0 init */
    {
        .motorTim = {
            .Instance = PWM_TIM_0,
            .Init = {
                .Period = PWM0_PERIOD_COUNT - 1,
                .Prescaler = PWM0_PRESCALER_COUNT - 1,
                .CounterMode = TIM_COUNTERMODE_UP,
                .ClockDivision = TIM_CLOCKDIVISION_DIV1,
            },
        },
        .motorPwmMode = {
            .OCMode = TIM_OCMODE_PWM1,
            .Pulse = 0,
            .OCPolarity = TIM_OCPOLARITY_HIGH,
            .OCNPolarity = TIM_OCPOLARITY_HIGH,
            .OCIdleState = TIM_OCNIDLESTATE_RESET,
            .OCFastMode = TIM_OCFAST_DISABLE,
        },
        .motorChannels = {
            {
                .channel = PWM0_CHANNEL_1,
                .gpio = PWM0_TIM_CH1_GPIO_PORT,
                .initSt = {
                    .Pin = PWM0_TIM_CH1_PIN,
                    .Mode = GPIO_MODE_AF_PP,
                    .Speed = GPIO_SPEED_FREQ_HIGH,
                },
            },
            {
                .channel = PWM0_CHANNEL_2,
                .gpio = PWM0_TIM_CH2_GPIO_PORT,
                .initSt = {
                    .Pin = PWM0_TIM_CH2_PIN,
                    .Mode = GPIO_MODE_AF_PP,
                    .Speed = GPIO_SPEED_FREQ_HIGH,
                },
            },
        }
    },
    /* motor 1 init */
    {
        .motorTim = {
            .Instance = PWM_TIM_1,
            .Init = {
                .Period = PWM1_PERIOD_COUNT - 1,
                .Prescaler = PWM1_PRESCALER_COUNT - 1,
                .CounterMode = TIM_COUNTERMODE_UP,
                .ClockDivision = TIM_CLOCKDIVISION_DIV1,
            },
        },
        .motorPwmMode = {
            .OCMode = TIM_OCMODE_PWM1,
            .Pulse = 0,
            .OCPolarity = TIM_OCPOLARITY_HIGH,
            .OCNPolarity = TIM_OCPOLARITY_HIGH,
            .OCIdleState = TIM_OCNIDLESTATE_RESET,
            .OCFastMode = TIM_OCFAST_DISABLE,
        },
        .motorChannels = {
            {
                .channel = PWM1_CHANNEL_1,
                .gpio = PWM1_TIM_CH1_GPIO_PORT,
                .initSt = {
                    .Pin = PWM1_TIM_CH1_PIN,
                    .Mode = GPIO_MODE_AF_PP,
                    .Speed = GPIO_SPEED_FREQ_HIGH,
                },
            },
            {
                .channel = PWM1_CHANNEL_2,
                .gpio = PWM1_TIM_CH2_GPIO_PORT,
                .initSt = {
                    .Pin = PWM1_TIM_CH2_PIN,
                    .Mode = GPIO_MODE_AF_PP,
                    .Speed = GPIO_SPEED_FREQ_HIGH,
                },
            },
        },
    },
};

void gtim_timx_pwm_chy_init(void)
{
    uint32_t motorIdx;
    PWM_TIM_CLK_ENABLE();
    for (motorIdx = 0u; motorIdx < BOARD_LIST_NUM(g_timx_pwm_handle_list); motorIdx++)
    {
        uint32_t channelIdx;
        MotorCfgType *motorCfg = &g_timx_pwm_handle_list[motorIdx];
        HAL_TIM_PWM_Init(&motorCfg->motorTim);
        for (channelIdx = 0u; channelIdx < BOARD_LIST_NUM(motorCfg->motorChannels); channelIdx++)
        {
            HAL_TIM_PWM_ConfigChannel(&motorCfg->motorTim, &motorCfg->motorPwmMode, motorCfg->motorChannels[channelIdx].channel);
            HAL_TIM_PWM_Start(&motorCfg->motorTim, motorCfg->motorChannels[channelIdx].channel);
        }
    }
}

void HAL_TIM_PWM_MspInit(TIM_HandleTypeDef *htim)
{
    PWM_TIM_GPIO_AF_ENABLE();
    PWM_TIM_CH_GPIO_CLK();
    uint32_t motorIdx;
    for (motorIdx = 0u; motorIdx < BOARD_LIST_NUM(g_timx_pwm_handle_list); motorIdx++)
    {
        uint32_t channelIdx;
        MotorCfgType *motorCfg = &g_timx_pwm_handle_list[motorIdx];
        if (htim->Instance == motorCfg->motorTim.Instance)
        {
            for (channelIdx = 0u; channelIdx < BOARD_LIST_NUM(motorCfg->motorChannels); channelIdx++)
            {
                HAL_GPIO_Init(motorCfg->motorChannels[channelIdx].gpio, &motorCfg->motorChannels[channelIdx].initSt);
            }
        }
    }
}
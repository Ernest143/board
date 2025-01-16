#ifndef __MOTOR_CTL_H
#define __MOTOR_CTL_H

#include "board_base.h"
#include "motor_tim.h"

/* 电机使能脚 */
#define ENA_PIN                  GPIO_PIN_12
#define ENA_GPIO_PORT            GPIOB
#define ENA_GPIO_CLK_ENABLE()    __HAL_RCC_GPIOB_CLK_ENABLE()

#define ENB_PIN                  GPIO_PIN_13
#define ENB_GPIO_PORT            GPIOB
#define ENB_GPIO_CLK_ENABLE()    __HAL_RCC_GPIOB_CLK_ENABLE()

typedef enum
{
    MOTOR_FWD = 0,
    MOTOR_REV,
} motor_dir_t;

typedef struct
{
    uint8_t motorPosition;
    uint16_t dutyfactor;
    motor_dir_t direction;
} MotorCtlType;

/* 设置占空比 */
#define SET_FWD_COMPAER(MotorIdx, ChannelPulse)   __HAL_TIM_SET_COMPARE(&g_timx_pwm_handle_list[MotorIdx].motorTim, g_timx_pwm_handle_list[MotorIdx].motorChannels[0].channel, ChannelPulse)
#define SET_REV_COMPAER(MotorIdx, ChannelPulse)   __HAL_TIM_SET_COMPARE(&g_timx_pwm_handle_list[MotorIdx].motorTim, g_timx_pwm_handle_list[MotorIdx].motorChannels[1].channel, ChannelPulse)

/* 使能输出 */
#define MOTOR_FWD_ENABLE(MotorIdx)  HAL_TIM_PWM_Start(&g_timx_pwm_handle_list[MotorIdx].motorTim, g_timx_pwm_handle_list[MotorIdx].motorChannels[0].channel)
#define MOTOR_REV_ENABLE(MotorIdx)  HAL_TIM_PWM_Start(&g_timx_pwm_handle_list[MotorIdx].motorTim, g_timx_pwm_handle_list[MotorIdx].motorChannels[1].channel)

/* 禁用输出 */
#define MOTOR_FWD_DISABLE(MotorIdx) HAL_TIM_PWM_Stop(&g_timx_pwm_handle_list[MotorIdx].motorTim, g_timx_pwm_handle_list[MotorIdx].motorChannels[0].channel)
#define MOTOR_REV_DISABLE(MotorIdx) HAL_TIM_PWM_Stop(&g_timx_pwm_handle_list[MotorIdx].motorTim, g_timx_pwm_handle_list[MotorIdx].motorChannels[1].channel)

/* 电机使能脚 */
#define MOTOR_ENABLE_A()                     HAL_GPIO_WritePin(ENA_GPIO_PORT, ENA_PIN, GPIO_PIN_SET)
#define MOTOR_DISABLE_A()                    HAL_GPIO_WritePin(ENA_GPIO_PORT, ENA_PIN, GPIO_PIN_RESET)

/* 电机2使能脚 */
#define MOTOR_ENABLE_B()                     HAL_GPIO_WritePin(ENB_GPIO_PORT, ENB_PIN, GPIO_PIN_SET)
#define MOTOR_DISABLE_B()                    HAL_GPIO_WritePin(ENB_GPIO_PORT, ENB_PIN, GPIO_PIN_RESET)

void motor_init(void);
void set_motor_speed(MotorCtlType* motorCtl, uint16_t v);
void set_motor_direction(MotorCtlType* motorCtl, motor_dir_t dir);
void set_vehicle_speed(uint16_t v);
void set_vehicle_direction(motor_dir_t dir);
void set_motor_enable(void);
void set_motor_disable(void);
#endif
#include <stdio.h>
#include "motor_ctl.h"


MotorCtlType g_motorCtlList[] = {
  {
    .motorPosition = 0,
    .direction = MOTOR_FWD,
    .dutyfactor = 0u,
  },
  {
    .motorPosition = 1,
    .direction = MOTOR_FWD,
    .dutyfactor = 0u,
  }
};

void set_motor_speed(MotorCtlType* motorCtl, uint16_t v)
{
  motorCtl->dutyfactor = v;

  if (motorCtl->direction == MOTOR_FWD)
  {
    SET_FWD_COMPAER(motorCtl->motorPosition, motorCtl->dutyfactor);
  } else
  {
    SET_REV_COMPAER(motorCtl->motorPosition, motorCtl->dutyfactor);
  }
}

void set_motor_direction(MotorCtlType* motorCtl, motor_dir_t dir)
{
  printf("before motor %d, dir %d, dutyfactor %d\n", motorCtl->motorPosition, motorCtl->direction, motorCtl->dutyfactor);
  motorCtl->direction = dir;
  printf("after motor %d, dir %d, dutyfactor %d\n", motorCtl->motorPosition, motorCtl->direction, motorCtl->dutyfactor);

  if (motorCtl->direction == MOTOR_FWD)
  {
    SET_FWD_COMPAER(motorCtl->motorPosition, motorCtl->dutyfactor);
    SET_REV_COMPAER(motorCtl->motorPosition, 0);
  } else
  {
    SET_FWD_COMPAER(motorCtl->motorPosition, 0);
    SET_REV_COMPAER(motorCtl->motorPosition, motorCtl->dutyfactor);
  }
}

void set_vehicle_speed(uint16_t v)
{
  uint32_t idx;
  for (idx = 0u; idx < BOARD_LIST_NUM(g_motorCtlList); idx++)
  {
    set_motor_speed(&g_motorCtlList[idx], v);
  }
}

void set_vehicle_direction(motor_dir_t dir)
{
  uint32_t idx;
  for (idx = 0u; idx < BOARD_LIST_NUM(g_motorCtlList); idx++)
  {
    set_motor_direction(&g_motorCtlList[idx], dir);
  }
}

void sd_gpio_config(void)
{
   GPIO_InitTypeDef GPIO_InitStruct;
  
  /* 定时器通道功能引脚端口时钟使能 */
	
	ENA_GPIO_CLK_ENABLE();
	ENB_GPIO_CLK_ENABLE();
  
  /* 定时器通道1功能引脚IO初始化 */
	/*设置输出类型*/
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	/*设置引脚速率 */ 
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	
	/*选择要控制的GPIO引脚*/	
	GPIO_InitStruct.Pin = ENA_PIN;
	/*调用库函数，使用上面配置的GPIO_InitStructure初始化GPIO*/
  HAL_GPIO_Init(ENA_GPIO_PORT, &GPIO_InitStruct);

  GPIO_InitStruct.Pin = ENB_PIN;	
  HAL_GPIO_Init(ENB_GPIO_PORT, &GPIO_InitStruct);
}

void motor_init(void)
{
    gtim_timx_pwm_chy_init();
    sd_gpio_config();
}

void set_motor_enable(void)
{
  MOTOR_ENABLE_A();
  MOTOR_ENABLE_B();
  MOTOR_FWD_ENABLE(0);
  MOTOR_FWD_ENABLE(1);
  MOTOR_REV_ENABLE(0);
  MOTOR_REV_ENABLE(1);

}

void set_motor_disable(void)
{
  MOTOR_DISABLE_A();
  MOTOR_DISABLE_B();
  MOTOR_FWD_DISABLE(0);
  MOTOR_FWD_DISABLE(1);
  MOTOR_REV_DISABLE(0);
  MOTOR_REV_DISABLE(1);
}
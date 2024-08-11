#ifndef __USUAL_H
#define __USUAL_H

#include "board_base.h"

/* LED0 */
#define LED0(x) do { x ? \
    HAL_GPIO_WritePin(LED0_GPIO_PORT, LED0_PIN, GPIO_PIN_SET): \
    HAL_GPIO_WritePin(LED0_GPIO_PORT, LED0_PIN, GPIO_PIN_RESET); \
} while(0)

#define LED1(x) do { x ? \
    HAL_GPIO_WritePin(LED1_GPIO_PORT, LED1_PIN, GPIO_PIN_SET): \
    HAL_GPIO_WritePin(LED1_GPIO_PORT, LED1_PIN, GPIO_PIN_RESET); \
} while(0)

#define BEEP(x) do{ x ? \
  HAL_GPIO_WritePin(BEEP_GPIO_PORT, BEEP_PIN, GPIO_PIN_SET): \
  HAL_GPIO_WritePin(BEEP_GPIO_PORT, BEEP_PIN, GPIO_PIN_RESET); \
} while(0)

#define LED0_TOGGLE() do { HAL_GPIO_TogglePin(LED0_GPIO_PORT, LED0_PIN);}while(0)
#define LED1_TOGGLE() do { HAL_GPIO_TogglePin(LED1_GPIO_PORT, LED1_PIN);}while(0)
#define BEEP_TOGGLE() do{ HAL_GPIO_TogglePin(BEEP_GPIO_PORT, BEEP_PIN);}while(0) /* BEEP = !BEEP */


#define KEY0 HAL_GPIO_ReadPin(KEY0_GPIO_PORT, KEY0_PIN)
#define KEY1 HAL_GPIO_ReadPin(KEY1_GPIO_PORT, KEY1_PIN)
#define WKUP HAL_GPIO_ReadPin(WKUP_GPIO_PORT, WKUP_PIN)

#define KEY0_PRES 1
#define KEY1_PRES 2
#define WKUP_PRES 3

#endif
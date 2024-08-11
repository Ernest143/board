#include "key.h"

uint8_t key_scan(uint8_t mode)
{
    static uint8_t key_up = 1; /* 按键按松开标志 */ 
    uint8_t keyval = 0;
    if (mode) key_up = 1; /* 支持连按 */

    if (key_up && (KEY0 == 0 || KEY1 == 0 || WKUP == 1))
    {
        /* 按键松开标志为 1, 且有任意一个按键按下了 */
        /* 去抖动 */ 
        HAL_Delay(10);
        key_up = 0;
        if (KEY0 == 0) keyval = KEY0_PRES;
        if (KEY1 == 0) keyval = KEY1_PRES;
        if (WKUP == 1) keyval = WKUP_PRES;
    }
    else if (KEY0 == 1 && KEY1 == 1 && WKUP == 0)
    {
        /* 没有任何按键按下, 标记按键松开 */ 
        key_up = 1;
    }
    /* 返回键值 */ 
    return keyval; 
}

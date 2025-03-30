#ifndef KEY_PRESS_H
#define KEY_PRESS_H

#include "board_base.h"

/******************************************************************************************/
/* 通用定时器 定义 */

/* TIMX 中断定义 
 * 默认是针对TIM2~TIM5.
 * 注意: 通过修改这4个宏定义,可以支持TIM1~TIM17任意一个定时器.
 */
 
#define GTIM_TIMX_INT                       TIM5
#define GTIM_TIMX_INT_IRQn                  TIM5_IRQn
#define GTIM_TIMX_INT_IRQHandler            TIM5_IRQHandler
#define GTIM_TIMX_INT_CLK_ENABLE()          do{ __HAL_RCC_TIM5_CLK_ENABLE(); }while(0)  /* TIM3 时钟使能 */

/******************************************************************************************/
#define KEY_DEBOUNCE_TIME   10          // 消抖时间
#define KEY_LONG_PRESS_TIME 500         // 长按判定时间
#define KEY_QUICK_CLICK_TIME    100     // 连按时间间隔
#define KEY_DOUBLE_CLICK_TIME   200     // 双击判定时间
#define KEY_PRESSED_LEVEL   0           // 按键未被按下时的值

// 按键动作
typedef enum
{
    key_action_press,   // 按住
    key_action_release, // 松开
} key_action_typedef;

// 按键状态
typedef enum
{
    key_status_idle,            // 空闲
    key_status_debounce,        // 消抖
    key_status_confirm_press,   // 确认按下
    key_status_confirm_press_long,  // 确认长按
    key_status_wait_second_press,   // 等待再次按下
    key_status_second_debounce,     // 再次消抖
    key_status_second_press,        // 再次按下
} key_status_typedef;

// 按键事件
typedef enum
{
    key_event_null,             // 空事件
    key_event_single_click,     // 单击
    key_event_long_press,       // 长按
    key_event_quick_click,      // 连击
    key_event_double_click,     // 双击
} key_event_typedef;

// 按键模式使能选择
typedef enum
{
    key_mode_onlysinge = 0x00,  // 只有单击
    key_mode_long = 0x01,       // 单击长按
    key_mode_quick = 0x02,      // 单击连按
    key_mode_long_quick = 0x03, // 单击长按连按
    key_mode_double = 0x04,     // 单击双击
    key_mode_long_double = 0x05,    // 单击长按双击
    key_mode_quick_double = 0x06,   // 单击连按双击
    key_mode_long_quick_double = 0x07,  // 单击长按连按双击
} key_mode_typedef;

// 按键配置
typedef struct
{
    char *key_str;              // 按键字符
    uint8_t key_label;          // 按键标号，用于区分不同按键
    uint8_t key_index;          // 按键索引
    uint16_t key_count;         // 按键按下计时
    key_mode_typedef key_mode;  // 按键模式
    key_action_typedef key_action;  // 按键动作，按下或释放
    key_status_typedef key_status;  // 按键状态
    key_event_typedef key_event;    // 按键事件
} key_configure_typedef;

// 按键信息
typedef struct
{
    char *key_str;              // 按键字符
    uint8_t key_label;          // 按键标号
    uint8_t key_count;          // 按键索引
    key_event_typedef key_event;    // 按键事件
} key_info_typedef;



void key_pres_tim_init(void);
void key_read_state_machine(key_configure_typedef *key_cfg, uint16_t *tmpcnt, key_info_typedef *g_key_event, uint8_t key);

#endif
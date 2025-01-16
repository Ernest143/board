#include "key_cfg.h"
#include "remote.h"
#include <stdio.h>
#include <string.h>
#include "motor_ctl.h"
#include "rtc.h"

key_configure_typedef g_key_config[] = {
    {"LEFT", REMOTE_KEY_LEFT, 0, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"RIGHT", REMOTE_KEY_RIGHT, 1, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"UP", REMOTE_KEY_UP, 2, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"DOWN", REMOTE_KEY_DOWN, 3, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"PLAY", REMOTE_KEY_PLAY, 4, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"POWER", REMOTE_KEY_POWER, 5, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"VOL-", REMOTE_KEY_VOL_RDC, 6, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"VOL+", REMOTE_KEY_VOL_ADD, 7, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"1", REMOTE_KEY_1, 8, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"2", REMOTE_KEY_2, 9, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"3", REMOTE_KEY_3, 10, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"4", REMOTE_KEY_4, 11, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"5", REMOTE_KEY_5, 12, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"6", REMOTE_KEY_6, 13, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"7", REMOTE_KEY_7, 14, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"8", REMOTE_KEY_8, 15, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"9", REMOTE_KEY_9, 16, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"0", REMOTE_KEY_0, 17, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"DELETE", REMOTE_KEY_DEL, 18, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
    {"MARK", REMOTE_KEY_MARK, 19, 0, key_mode_onlysinge, key_action_release, key_status_idle, key_event_null},
};

TIM_HandleTypeDef g_timx_handle; /* 定时器x句柄 */
uint16_t tmpcnt[BOARD_LIST_NUM(g_key_config)];
key_info_typedef g_key_event[BOARD_LIST_NUM(g_key_config)];

key_cfg_list_typedef g_key_list = {
    .num = BOARD_LIST_NUM(g_key_config),
    .list = g_key_config,
};

void key_pres_tim_init(void)
{
    GTIM_TIMX_INT_CLK_ENABLE();                                 /* 使能TIMx时钟 */

    g_timx_handle.Instance = GTIM_TIMX_INT;                     /* 通用定时器x */
    g_timx_handle.Init.Prescaler = 7200 - 1;                         /* 预分频系数 */
    g_timx_handle.Init.CounterMode = TIM_COUNTERMODE_UP;        /* 递增计数模式 */
    g_timx_handle.Init.Period = 10 - 1;                            /* 自动装载值 */
    HAL_TIM_Base_Init(&g_timx_handle);

    HAL_NVIC_SetPriority(GTIM_TIMX_INT_IRQn, 1, 3);             /* 设置中断优先级，抢占优先级1，子优先级3 */
    HAL_NVIC_EnableIRQ(GTIM_TIMX_INT_IRQn);                     /* 开启ITMx中断 */

    HAL_TIM_Base_Start_IT(&g_timx_handle);                      /* 使能定时器x和定时器x更新中断 */
}

/**
 * @brief       定时器中断服务函数
 * @param       无
 * @retval      无
 */
void GTIM_TIMX_INT_IRQHandler(void)
{
    /* 以下代码没有使用定时器HAL库共用处理函数来处理，而是直接通过判断中断标志位的方式 */
    if(__HAL_TIM_GET_FLAG(&g_timx_handle, TIM_FLAG_UPDATE) != RESET)
    {
        uint32_t idx;
        uint8_t key = remote_scan();    // 连续输入
        // printf("key %d, time %d\n", key, calendar.sec);
        for (idx = 0; idx < g_key_list.num; idx++)
        {
            if ((key == g_key_list.list[idx].key_label) || (key == 0))
            {
                key_read_state_machine(&(g_key_list.list[idx]), tmpcnt, g_key_event, key);
            }
        }
        __HAL_TIM_CLEAR_IT(&g_timx_handle, TIM_IT_UPDATE);  /* 清除定时器溢出中断标志位 */
    }
}

uint16_t ChannelPulse = 0;

void key_process(void)
{
    uint32_t idx;
    for (idx = 0; idx < BOARD_LIST_NUM(g_key_event); idx++)
    {
        if (g_key_event[idx].key_event == key_event_single_click)
        {
            printf("%s, %d, %d\n", g_key_event[idx].key_str, g_key_event[idx].key_label, g_key_event[idx].key_count);
            if (g_key_event[idx].key_label == REMOTE_KEY_UP)
            {
                set_vehicle_direction(MOTOR_FWD);
                printf("up motor!!!");
            }
            if (g_key_event[idx].key_label == REMOTE_KEY_DOWN)
            {
                set_vehicle_direction(MOTOR_REV);
                printf("down motor!!!");
            }
            if (g_key_event[idx].key_label == REMOTE_KEY_VOL_ADD)
            {
                ChannelPulse += PWM_MAX_PERIOD_COUNT/10;
                if (ChannelPulse > PWM_MAX_PERIOD_COUNT)
                {
                    ChannelPulse = PWM_MAX_PERIOD_COUNT;
                }
                set_vehicle_speed(ChannelPulse);
                printf("+++ speed %d\n", ChannelPulse);
            }
            if (g_key_event[idx].key_label == REMOTE_KEY_VOL_RDC)
            {
            if (ChannelPulse < PWM_MAX_PERIOD_COUNT/10)
            {
                ChannelPulse = 0;
            }
            else
            {
                ChannelPulse -= PWM_MAX_PERIOD_COUNT/10;
            }
            set_vehicle_speed(ChannelPulse);
            printf("--- speed %d\n", ChannelPulse);

            }
            static uint8_t motorScnt = 0u;
            if (g_key_event[idx].key_label == REMOTE_KEY_PLAY)
            {
                if (motorScnt % 2)
                {
                    set_motor_disable();
                }
                else
                {
                    set_motor_enable();
                }
                motorScnt++;
            }
        }
    }
    memset(g_key_event, 0, sizeof(g_key_event));
}
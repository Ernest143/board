#include "key_press.h"
#include "key_cfg.h"

void key_read_state_machine(key_configure_typedef *key_cfg, uint16_t *tmpcnt, key_info_typedef *g_key_event, uint8_t key)
{
    if (key != KEY_PRESSED_LEVEL)       // 非零按下
    {
        key_cfg->key_action = key_action_press;
    }
    else
    {
        key_cfg->key_action = key_action_release;
    }

    // 状态机
    switch (key_cfg->key_status)
    {
        // 状态 空闲
        case key_status_idle:
        if (key_cfg->key_action == key_action_press)
        {
            key_cfg->key_status = key_status_debounce;
            key_cfg->key_event = key_event_null;
        }
        else
        {
            key_cfg->key_status = key_status_idle;
            key_cfg->key_event = key_event_null;
        }
        break;

        // 状态 消抖
        case key_status_debounce:
        if ((key_cfg->key_action == key_action_press) && (key_cfg->key_count >= KEY_DEBOUNCE_TIME))
        {
            key_cfg->key_count = 0;
            key_cfg->key_status = key_status_confirm_press;
            key_cfg->key_event = key_event_null;
        }
        else if ((key_cfg->key_action == key_action_press) && (key_cfg->key_count < KEY_DEBOUNCE_TIME))
        {
            key_cfg->key_count++;
            key_cfg->key_status = key_status_debounce;
            key_cfg->key_event = key_event_null;
        }
        else
        {
            key_cfg->key_count = 0;
            key_cfg->key_status = key_status_idle;
            key_cfg->key_event = key_event_null;
        }
        break;

        // 状态 确认按下
        case key_status_confirm_press:
        if ((key_cfg->key_action == key_action_press) && (key_cfg->key_count >= KEY_LONG_PRESS_TIME))
        {
            key_cfg->key_count = KEY_QUICK_CLICK_TIME;
            key_cfg->key_status = key_status_confirm_press_long;
            key_cfg->key_event = key_event_null;
        }
        else if ((key_cfg->key_action == key_action_press) && (key_cfg->key_count < KEY_LONG_PRESS_TIME))
        {
            key_cfg->key_count++;
            key_cfg->key_status = key_status_confirm_press;
            key_cfg->key_event = key_event_null;
        }
        else
        {
            if ((uint8_t)(key_cfg->key_mode) & key_mode_double)
            {
                key_cfg->key_count = 0;
                key_cfg->key_status = key_status_wait_second_press;
                key_cfg->key_event = key_event_null;
            }
            else
            {
                key_cfg->key_count = 0;
                key_cfg->key_status = key_status_idle;
                key_cfg->key_event = key_event_single_click;
            }
        }
        break;

        // 状态 确认长按
        case key_status_confirm_press_long:
        if (key_cfg->key_action == key_action_press)
        {
            if ((uint8_t)(key_cfg->key_mode) & key_mode_quick)
            {
                if (key_cfg->key_count >= KEY_QUICK_CLICK_TIME)
                {
                    key_cfg->key_count = 0;
                    key_cfg->key_status = key_status_confirm_press_long;
                    key_cfg->key_event = key_event_quick_click;
                }
                else
                {
                    key_cfg->key_count++;
                    key_cfg->key_status = key_status_confirm_press_long;
                    key_cfg->key_event = key_event_null;
                }
            }
            else
            {
                key_cfg->key_count = 0;
                key_cfg->key_status = key_status_confirm_press_long;
                key_cfg->key_event = key_event_null;
            }
        }
        else
        {
            if ((uint8_t)(key_cfg->key_mode) & key_mode_long)
            {
                key_cfg->key_count = 0;
                key_cfg->key_status = key_status_idle;
                key_cfg->key_event = key_event_long_press;
            }
            else
            {
                key_cfg->key_count = 0;
                key_cfg->key_status = key_status_idle;
                key_cfg->key_event = key_event_single_click;
            }
        }
        break;

        // 状态 等待是否再次按下
        case key_status_wait_second_press:
        if ((key_cfg->key_action != key_action_press) && (key_cfg->key_count >= KEY_DOUBLE_CLICK_TIME))
        {
            key_cfg->key_count = 0;
            key_cfg->key_status = key_status_idle;
            key_cfg->key_event = key_event_single_click;
        }
        else if ((key_cfg->key_action != key_action_press) && (key_cfg->key_count < KEY_DOUBLE_CLICK_TIME))
        {
            key_cfg->key_count++;
            key_cfg->key_status = key_status_wait_second_press;
            key_cfg->key_event = key_event_null;
        }
        else
        {
            tmpcnt[key_cfg->key_index] = key_cfg->key_count;
            key_cfg->key_count = 0;
            key_cfg->key_status = key_status_second_debounce;
            key_cfg->key_event = key_event_null;
        }
        break;

        // 状态 再次消抖
        case key_status_second_debounce:
        if ((key_cfg->key_action == key_action_press) && (key_cfg->key_count >= KEY_DEBOUNCE_TIME))
        {
            key_cfg->key_count = 0;
            key_cfg->key_status = key_status_second_press;
            key_cfg->key_event = key_event_null;
        }
        else if ((key_cfg->key_action == key_action_press) && (key_cfg->key_count < KEY_DEBOUNCE_TIME))
        {
            key_cfg->key_count++;
            key_cfg->key_status = key_status_second_debounce;
            key_cfg->key_event = key_event_null;
        }
        else
        {
            key_cfg->key_count = key_cfg->key_count + tmpcnt[key_cfg->key_index];
            key_cfg->key_status = key_status_wait_second_press;
            key_cfg->key_event = key_event_null;
        }
        break;

        // 状态 再次按下
        case key_status_second_press:
        if ((key_cfg->key_action == key_action_press) && (key_cfg->key_count >= KEY_LONG_PRESS_TIME))
        {
            key_cfg->key_count = 0;
            key_cfg->key_status = key_status_confirm_press_long;
            key_cfg->key_event = key_event_single_click;
        }
        else if ((key_cfg->key_action == key_action_press) && (key_cfg->key_count < KEY_LONG_PRESS_TIME))
        {
            key_cfg->key_count++;
            key_cfg->key_status = key_status_second_press;
            key_cfg->key_event = key_event_null;
        }
        else
        {
            key_cfg->key_count = 0;
            key_cfg->key_status = key_status_idle;
            key_cfg->key_event = key_event_double_click;
        }
        break;
    }

    if (key_cfg->key_event != key_event_null)
    {
        g_key_event[key_cfg->key_index].key_str = key_cfg->key_str;
        g_key_event[key_cfg->key_index].key_label = key_cfg->key_label;
        g_key_event[key_cfg->key_index].key_count = key_cfg->key_count;
        g_key_event[key_cfg->key_index].key_event = key_cfg->key_event;
    }
}
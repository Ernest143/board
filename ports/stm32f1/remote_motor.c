#include "remote_motor.h"
#include "remote.h"
#include "motor_ctl.h"
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "key_cfg.h"
#include "delay.h"

uint16_t ChannelPulse = 0;
void remote_motor(void)
{
  uint32_t idx;
  for (idx = 0; idx < g_key_list.num; idx++)
  {
      if (g_key_list.eventList[idx].key_event == key_event_single_click)
      {
          printf("%s, %d, %d\n", g_key_list.eventList[idx].key_str, g_key_list.eventList[idx].key_label, g_key_list.eventList[idx].key_count);
          if (g_key_list.eventList[idx].key_label == REMOTE_KEY_UP)
          {
              set_vehicle_direction(MOTOR_FWD);
              printf("up motor!!!");
          }
          if (g_key_list.eventList[idx].key_label == REMOTE_KEY_DOWN)
          {
              set_vehicle_direction(MOTOR_REV);
              printf("down motor!!!");
          }
          if (g_key_list.eventList[idx].key_label == REMOTE_KEY_VOL_ADD)
          {
              ChannelPulse += PWM_MAX_PERIOD_COUNT/10;
              if (ChannelPulse > PWM_MAX_PERIOD_COUNT)
              {
                  ChannelPulse = PWM_MAX_PERIOD_COUNT;
              }
              set_vehicle_speed(ChannelPulse);
              printf("+++ speed %d\n", ChannelPulse);
          }
          if (g_key_list.eventList[idx].key_label == REMOTE_KEY_VOL_RDC)
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
          if (g_key_list.eventList[idx].key_label == REMOTE_KEY_PLAY)
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
          static uint8_t motorCtl = 0u;
          if (g_key_list.eventList[idx].key_label == REMOTE_KEY_LEFT)
          {
            if (motorCtl % 2) {
                motor_ctl(0, false);
            } else {
                motor_ctl(0, true);
            }
            motorCtl++;
          }

          static uint8_t motorCtl1 = 0u;
          if (g_key_list.eventList[idx].key_label == REMOTE_KEY_RIGHT)
          {
            if (motorCtl1 % 2) {
                motor_ctl(1, false);
            } else {
                motor_ctl(1, true);
            }
            motorCtl1++;
          }
          if (g_key_list.eventList[idx].key_label == REMOTE_KEY_1)
          {
            set_vehicle_rotation(0);
          }
          if (g_key_list.eventList[idx].key_label == REMOTE_KEY_2)
          {
            set_vehicle_rotation(1);
          }

           memset(&g_key_list.eventList[idx], 0, sizeof(g_key_list.eventList[idx]));
      }
  }
}
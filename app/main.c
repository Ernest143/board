#include "board_api.h"

int main(void)
{
    board_init();
    uint16_t ChannelPulse = 0u;
    uint8_t i = 0;
    motor_init();

    set_motor_enable();

    while (1)
    {
        uint8_t key = key_scan(0);
        if (key == KEY0_PRES)
        {
            /* 增大占空比 */
            ChannelPulse += PWM_MAX_PERIOD_COUNT/10;
            if (ChannelPulse > PWM_MAX_PERIOD_COUNT)
            {
                ChannelPulse = PWM_MAX_PERIOD_COUNT;
            }
            set_vehicle_speed(ChannelPulse);
            printf("key %d, vehicle pulse %d\n", key, ChannelPulse);
        }

        if (key == KEY1_PRES)
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
            printf("key %d, vehicle pulse %d\n", key, ChannelPulse);
        }

        if (key == WKUP_PRES)
        {
            i++;
            if (i % 2 == 0)
            {
                set_vehicle_direction(MOTOR_REV);
            } else
            {
                set_vehicle_direction(MOTOR_FWD);
            }
            printf("dir %d\n", i);
        }
    }
}
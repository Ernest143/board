#ifndef __RTC_H
#define __RTC_H

#include "board_base.h"


typedef struct {
    uint8_t hour;
    uint8_t min;
    uint8_t sec;

    uint16_t year;
    uint8_t month;
    uint8_t date;
    uint8_t week;
} _calendar_obj;

extern _calendar_obj calendar;


uint8_t rtc_init(void);
void rtc_get_time(void);
uint16_t rtc_read_bkr(uint32_t bkrx);
void rtc_write_bkr(uint32_t bkrx, uint16_t data);
uint8_t rtc_get_week(uint16_t year, uint8_t month, uint8_t day);
uint8_t rtc_set_time(uint16_t syear, uint8_t smon, uint8_t sday, uint8_t hour, uint8_t min, uint8_t sec);
uint8_t rtc_set_alarm(uint16_t syear, uint8_t smon, uint8_t sday, uint8_t hour, uint8_t min, uint8_t sec);

#endif
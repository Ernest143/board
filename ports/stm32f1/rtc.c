#include "rtc.h"
#include "usual.h"
#include <stdio.h>

RTC_HandleTypeDef g_rtc_handle;
_calendar_obj calendar;

static uint8_t rtc_is_leap_year(uint16_t year);
static long rtc_date2sec(uint16_t syear, uint8_t smon, uint8_t sday, uint8_t hour, uint8_t min, uint8_t sec);

void rtc_write_bkr(uint32_t bkrx, uint16_t data)
{
    HAL_PWR_EnableBkUpAccess();
    HAL_RTCEx_BKUPWrite(&g_rtc_handle, bkrx + 1, data);
}

uint16_t rtc_read_bkr(uint32_t bkrx)
{
    uint32_t temp = 0;
    temp = HAL_RTCEx_BKUPRead(&g_rtc_handle, bkrx + 1);
    return (uint16_t)temp;
}

uint8_t rtc_init(void)
{
    uint16_t bkpflag = 0;

    __HAL_RCC_PWR_CLK_ENABLE();     /* Enable Power Timer */
    __HAL_RCC_BKP_CLK_ENABLE();     /* Enable Backup Timer */
    HAL_PWR_EnableBkUpAccess();

    bkpflag = rtc_read_bkr(0);

    g_rtc_handle.Instance = RTC;
    g_rtc_handle.Init.AsynchPrediv = 32767;
    g_rtc_handle.Init.OutPut = RTC_OUTPUTSOURCE_NONE;

    if (HAL_RTC_Init(&g_rtc_handle) != HAL_OK) {
        return 1;
    }

    if ((bkpflag != 0x5050) && (bkpflag != 0x5051)) {
        rtc_set_time(2024, 2, 25, 15, 3, 12);
    }

    __HAL_RTC_ALARM_ENABLE_IT(&g_rtc_handle, RTC_IT_SEC);

    HAL_NVIC_SetPriority(RTC_IRQn, 0x2, 0);
    HAL_NVIC_EnableIRQ(RTC_IRQn);

    rtc_get_time();

    return 0;
}

void HAL_RTC_MspInit(RTC_HandleTypeDef *hrtc)
{
    uint16_t retry = 200;

    __HAL_RCC_RTC_ENABLE();

    RCC_OscInitTypeDef rcc_oscinitstruct;
    RCC_PeriphCLKInitTypeDef rcc_periphclkinitstruct;

    RCC->BDCR |= 1 << 0;

    while (retry && ((RCC->BDCR & 0x02) == 0)) {
        retry--;
        HAL_Delay(5);
    }

    if (retry == 0) {
        rcc_oscinitstruct.OscillatorType = RCC_OSCILLATORTYPE_LSI;
        rcc_oscinitstruct.LSEState = RCC_LSI_ON;
        rcc_oscinitstruct.PLL.PLLState = RCC_PLL_NONE;
        HAL_RCC_OscConfig(&rcc_oscinitstruct);

        rcc_periphclkinitstruct.PeriphClockSelection = RCC_PERIPHCLK_RTC;
        rcc_periphclkinitstruct.RTCClockSelection = RCC_RTCCLKSOURCE_LSI;
        HAL_RCCEx_PeriphCLKConfig(&rcc_periphclkinitstruct);
        rtc_write_bkr(0, 0x5051);
    } else {
        rcc_oscinitstruct.OscillatorType = RCC_OSCILLATORTYPE_LSE;
        rcc_oscinitstruct.LSEState = RCC_LSE_ON;
        rcc_oscinitstruct.PLL.PLLState = RCC_PLL_NONE;
        HAL_RCC_OscConfig(&rcc_oscinitstruct);

        rcc_periphclkinitstruct.PeriphClockSelection = RCC_PERIPHCLK_RTC;
        rcc_periphclkinitstruct.RTCClockSelection = RCC_RTCCLKSOURCE_LSE;
        HAL_RCCEx_PeriphCLKConfig(&rcc_periphclkinitstruct);
        rtc_write_bkr(0, 0x5050);

    }
}

void RTC_IRQHandler(void)
{
    if (__HAL_RTC_ALARM_GET_FLAG(&g_rtc_handle, RTC_FLAG_SEC) != RESET) {
        rtc_get_time();
        __HAL_RTC_ALARM_CLEAR_FLAG(&g_rtc_handle, RTC_FLAG_SEC);
    }

    if (__HAL_RTC_ALARM_GET_FLAG(&g_rtc_handle, RTC_FLAG_ALRAF) != RESET) {
        __HAL_RTC_ALARM_CLEAR_FLAG(&g_rtc_handle, RTC_FLAG_ALRAF);
        printf("Alarm Time:%d-%d-%d %d:%d:%d\n", calendar.year, calendar.month, calendar.date, calendar.hour, calendar.min, calendar.sec);
        BEEP(1);
    }

    __HAL_RTC_ALARM_CLEAR_FLAG(&g_rtc_handle, RTC_FLAG_OW);
    while(!__HAL_RTC_ALARM_GET_FLAG(&g_rtc_handle, RTC_FLAG_RTOFF));
}

static uint8_t rtc_is_leap_year(uint16_t year)
{
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        return 1;
    } else {
        return 0;
    }
}

/**
 * @brief       设置时间, 包括年月日时分秒
 *   @note      以1970年1月1日为基准, 往后累加时间
 *              合法年份范围为: 1970 ~ 2105年
                HAL默认为年份起点为2000年
 * @param       syear : 年份
 * @param       smon  : 月份
 * @param       sday  : 日期
 * @param       hour  : 小时
 * @param       min   : 分钟
 * @param       sec   : 秒钟
 * @retval      0, 成功; 1, 失败;
 */
uint8_t rtc_set_time(uint16_t syear, uint8_t smon, uint8_t sday, uint8_t hour, uint8_t min, uint8_t sec)
{
    uint32_t seccount = 0;

    seccount = rtc_date2sec(syear, smon, sday, hour, min, sec); /* 将年月日时分秒转换成总秒钟数 */

    __HAL_RCC_PWR_CLK_ENABLE(); /* 使能电源时钟 */
    __HAL_RCC_BKP_CLK_ENABLE(); /* 使能备份域时钟 */
    HAL_PWR_EnableBkUpAccess(); /* 取消备份域写保护 */
    /* 上面三步是必须的! */
    
    RTC->CRL |= 1 << 4;         /* 允许配置 */
    
    RTC->CNTL = seccount & 0xffff;
    RTC->CNTH = seccount >> 16;
    
    RTC->CRL &= ~(1 << 4);      /* 配置更新 */

    while (!__HAL_RTC_ALARM_GET_FLAG(&g_rtc_handle, RTC_FLAG_RTOFF));       /* 等待RTC寄存器操作完成, 即等待RTOFF == 1 */

    return 0;
}

/**
 * @brief       设置闹钟, 具体到年月日时分秒
 *   @note      以1970年1月1日为基准, 往后累加时间
 *              合法年份范围为: 1970 ~ 2105年
 * @param       syear : 年份
 * @param       smon  : 月份
 * @param       sday  : 日期
 * @param       hour  : 小时
 * @param       min   : 分钟
 * @param       sec   : 秒钟
 * @retval      0, 成功; 1, 失败;
 */
uint8_t rtc_set_alarm(uint16_t syear, uint8_t smon, uint8_t sday, uint8_t hour, uint8_t min, uint8_t sec)
{
    uint32_t seccount = 0;

    seccount = rtc_date2sec(syear, smon, sday, hour, min, sec); /* 将年月日时分秒转换成总秒钟数 */

    __HAL_RCC_PWR_CLK_ENABLE(); /* 使能电源时钟 */
    __HAL_RCC_BKP_CLK_ENABLE(); /* 使能备份域时钟 */
    HAL_PWR_EnableBkUpAccess(); /* 取消备份域写保护 */
    /* 上面三步是必须的! */
    
    RTC->CRL |= 1 << 4;         /* 允许配置 */
    
    RTC->ALRL = seccount & 0xffff;
    RTC->ALRH = seccount >> 16;
    
    RTC->CRL &= ~(1 << 4);      /* 配置更新 */

    while (!__HAL_RTC_ALARM_GET_FLAG(&g_rtc_handle, RTC_FLAG_RTOFF));       /* 等待RTC寄存器操作完成, 即等待RTOFF == 1 */

    return 0;
}

/**
 * @brief       得到当前的时间
 *   @note      该函数不直接返回时间, 时间数据保存在calendar结构体里面
 * @param       无
 * @retval      无
 */
void rtc_get_time(void)
{
    static uint16_t daycnt = 0;
    uint32_t seccount = 0;
    uint32_t temp = 0;
    uint16_t temp1 = 0;
    const uint8_t month_table[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}; /* 平年的月份日期表 */

    seccount = RTC->CNTH;       /* 得到计数器中的值(秒钟数) */
    seccount <<= 16;
    seccount += RTC->CNTL;

    temp = seccount / 86400;    /* 得到天数(秒钟数对应的) */

    if (daycnt != temp)         /* 超过一天了 */
    {
        daycnt = temp;
        temp1 = 1970;           /* 从1970年开始 */

        while (temp >= 365)
        {
            if (rtc_is_leap_year(temp1)) /* 是闰年 */
            {
                if (temp >= 366)
                {
                    temp -= 366; /* 闰年的秒钟数 */
                }
                else
                {
                    break;
                }
            }
            else
            {
                temp -= 365;    /* 平年 */
            }

            temp1++;
        }

        calendar.year = temp1;  /* 得到年份 */
        temp1 = 0;

        while (temp >= 28)      /* 超过了一个月 */
        {
            if (rtc_is_leap_year(calendar.year) && temp1 == 1) /* 当年是不是闰年/2月份 */
            {
                if (temp >= 29)
                {
                    temp -= 29; /* 闰年的秒钟数 */
                }
                else
                {
                    break;
                }
            }
            else
            {
                if (temp >= month_table[temp1])
                {
                    temp -= month_table[temp1]; /* 平年 */
                }
                else
                {
                    break;
                }
            }

            temp1++;
        }

        calendar.month = temp1 + 1; /* 得到月份 */
        calendar.date = temp + 1;   /* 得到日期 */
    }

    temp = seccount % 86400;                                                    /* 得到秒钟数 */
    calendar.hour = temp / 3600;                                                /* 小时 */
    calendar.min = (temp % 3600) / 60;                                          /* 分钟 */
    calendar.sec = (temp % 3600) % 60;                                          /* 秒钟 */
    calendar.week = rtc_get_week(calendar.year, calendar.month, calendar.date); /* 获取星期 */
}

/**
 * @brief       将年月日时分秒转换成秒钟数
 *   @note      输入公历日期得到星期(起始时间为: 公元0年3月1日开始, 输入往后的任何日期, 都可以获取正确的星期)
 *              使用 基姆拉尔森计算公式 计算, 原理说明见此贴:
 *              https://www.cnblogs.com/fengbohello/p/3264300.html
 * @param       syear : 年份
 * @param       smon  : 月份
 * @param       sday  : 日期
 * @retval      0, 星期天; 1 ~ 6: 星期一 ~ 星期六
 */
uint8_t rtc_get_week(uint16_t year, uint8_t month, uint8_t day)
{
    uint8_t week = 0;

    if (month < 3)
    {
        month += 12;
        --year;
    }

    week = (day + 1 + 2 * month + 3 * (month + 1) / 5 + year + (year >> 2) - year / 100 + year / 400) % 7;
    return week;
}

/**
 * @brief       将年月日时分秒转换成秒钟数
 *   @note      以1970年1月1日为基准, 1970年1月1日, 0时0分0秒, 表示第0秒钟
 *              最大表示到2105年, 因为uint32_t最大表示136年的秒钟数(不包括闰年)!
 *              本代码参考只linux mktime函数, 原理说明见此贴:
 *              http://www.openedv.com/thread-63389-1-1.html
 * @param       syear : 年份
 * @param       smon  : 月份
 * @param       sday  : 日期
 * @param       hour  : 小时
 * @param       min   : 分钟
 * @param       sec   : 秒钟
 * @retval      转换后的秒钟数
 */
static long rtc_date2sec(uint16_t syear, uint8_t smon, uint8_t sday, uint8_t hour, uint8_t min, uint8_t sec)
{
    uint32_t Y, M, D, X, T;
    signed char monx = smon;    /* 将月份转换成带符号的值, 方便后面运算 */

    if (0 >= (monx -= 2))       /* 1..12 -> 11,12,1..10 */
    {
        monx += 12;             /* Puts Feb last since it has leap day */
        syear -= 1;
    }

    Y = (syear - 1) * 365 + syear / 4 - syear / 100 + syear / 400; /* 公元元年1到现在的闰年数 */
    M = 367 * monx / 12 - 30 + 59;
    D = sday - 1;
    X = Y + M + D - 719162;                      /* 减去公元元年到1970年的天数 */
    T = ((X * 24 + hour) * 60 + min) * 60 + sec; /* 总秒钟数 */
    return T;
}

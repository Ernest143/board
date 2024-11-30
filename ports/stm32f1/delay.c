#include "delay.h"

static uint16_t g_fac_us = 0;

void delay_init(uint16_t sysclk)
{
    SysTick->CTRL &= ~(1 << 2);
    g_fac_us = sysclk / 8;
}

void delay_us(uint32_t nus)
{
    uint32_t temp;
    SysTick->LOAD = nus * g_fac_us;
    SysTick->VAL = 0x00;
    SysTick->CTRL |= 1 << 0;

    do {
        temp = SysTick->CTRL;
    } while ((temp & 0x01) && !(temp & (1 << 16)));

    SysTick->CTRL &= ~(1 << 0);
    SysTick->VAL = 0x00;
}

void delay_ms(uint16_t nms)
{
    uint32_t repeat = nms / 1000;   /*  ������1000,�ǿ��ǵ������г�ƵӦ��,
                                     *  ����128Mhz��ʱ��, delay_us���ֻ����ʱ1048576us������
                                     */
    uint32_t remain = nms % 1000;

    while (repeat)
    {
        delay_us(1000 * 1000);      /* ����delay_us ʵ�� 1000ms ��ʱ */
        repeat--;
    }

    if (remain)
    {
        delay_us(remain * 1000);    /* ����delay_us, ��β����ʱ(remain ms)������ */
    }
}
#include "sys.h"
#include "boards.h"

void sys_nvic_set_vector_table(uint32_t baseaddr, uint32_t offset)
{
    SCB->VTOR = baseaddr | (offset & (uint32_t)0xFFFFFE00);
}

uint8_t sys_clock_set(uint32_t plln)
{
    uint32_t retry = 0;
    uint8_t retval = 0;
    RCC->CR |= 0x00010000;          /* �ⲿ����ʱ��ʹ��HSEON */

    while (retry < 0XFFF0)
    {
        // __nop();

        /* ע��, MDK5.29���Ժ�汾, ��ʹ��HSEON�Ժ�, �������һ������ʱ
         * �ٿ�ʼ��������, �ᵼ�·��������������, ��ʱ�������в������� bug
         * ��Ҫ����λ����, ��ʱ�Ż�����, �������һ������ʱ, ���Խ����� bug
         * ����, �������õ���ʱʱ��, ������ 0X8000 �� nopʱ��
         */
        if (RCC->CR & (1 << 17) && retry > 0X8000)
        {
            break;
        }

        retry++;        /* �ȴ�HSE RDY */
    }

    if (retry >= 0XFFF0)
    {
        retval = 1;     /* HSE�޷����� */
    }
    else
    {
        RCC->CFGR = 0X00000400;     /* PCLK1 = HCLK / 2; PCLK2 = HCLK; HCLK = SYSCLK; */
        plln -= 2;                  /* ����2����λ(��Ϊ�Ǵ�2��ʼ��, ����0����2) */
        RCC->CFGR |= plln << 18;    /* ����PLLֵ 2~16 */
        RCC->CFGR |= 1 << 16;       /* PLLSRC = 1, ѡ�� HSE ��Ϊ PLL ����ʱ�� */

        /* FLASH_ACR�Ĵ������������: <<STM32F10xx�������ֲ�>> */
        FLASH->ACR = 1 << 4;        /* PRFTBE = 1 ����Ԥȡ������ */
        FLASH->ACR |= 2 << 0;       /* LATENCY[2:0] = 2 FLASH�����ȴ����� */

        RCC->CR |= 1 << 24;         /* PLLON = 1, ʹ��PLL */

        while (!(RCC->CR >> 25));   /* �ȴ�PLL���� */

        RCC->CFGR |= 2 << 0;        /* SW[1:0] = 2, ѡ��PLL�����Ϊϵͳʱ�� */

        while (((RCC->CFGR >> 2) & 0X03) != 2); /* �ȴ�PLL��Ϊϵͳʱ�����óɹ� */
    }

    return retval;
}

void sys_clock_init(uint32_t plln)
{
    RCC->APB1RSTR = 0x00000000;
    RCC->APB2RSTR = 0x00000000;
    
    RCC->AHBENR = 0x00000014;
    RCC->APB2ENR = 0x00000000;
    RCC->APB1ENR = 0x00000000;
    
    RCC->CR |= 0x00000001;
    RCC->CFGR &= 0xF8FF0000;
    RCC->CR &= 0xFEF6FFFF;
    RCC->CR &= 0xFFFBFFFF;
    RCC->CFGR &= 0xFF80FFFF;
    RCC->CIR = 0x009F0000;

    sys_clock_set(plln);

    sys_nvic_set_vector_table(BOARD_FLASH_ADDR_ZERO, 0x10000);
}
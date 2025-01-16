#include "remote.h"

TIM_HandleTypeDef g_tim4_handle;

void remote_init(void)
{
    TIM_IC_InitTypeDef tim_ic_init_handle;

    g_tim4_handle.Instance = REMOTE_IN_TIMX;
    g_tim4_handle.Init.Prescaler = (72 -1);
    g_tim4_handle.Init.CounterMode = TIM_COUNTERMODE_UP;
    g_tim4_handle.Init.Period = 10000;
    g_tim4_handle.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
    HAL_TIM_IC_Init(&g_tim4_handle);

    tim_ic_init_handle.ICPolarity = TIM_ICPOLARITY_RISING;
    tim_ic_init_handle.ICSelection = TIM_ICSELECTION_DIRECTTI;
    tim_ic_init_handle.ICPrescaler = TIM_ICPSC_DIV1;
    tim_ic_init_handle.ICFilter = 0x03;
    HAL_TIM_IC_ConfigChannel(&g_tim4_handle, &tim_ic_init_handle, REMOTE_IN_TIMX_CHY);
    HAL_TIM_IC_Start_IT(&g_tim4_handle, REMOTE_IN_TIMX_CHY);
    __HAL_TIM_ENABLE_IT(&g_tim4_handle, TIM_IT_UPDATE);
}

void HAL_TIM_IC_MspInit(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == REMOTE_IN_TIMX)
    {
        GPIO_InitTypeDef gpio_init_struct;

        REMOTE_IN_GPIO_CLK_ENABLE();
        REMOTE_IN_TIMX_CHY_CLK_ENABLE();
        __HAL_AFIO_REMAP_TIM4_DISABLE();

        gpio_init_struct.Pin = REMOTE_IN_GPIO_PIN;
        gpio_init_struct.Mode = GPIO_MODE_AF_INPUT;
        gpio_init_struct.Pull = GPIO_PULLUP;
        gpio_init_struct.Speed = GPIO_SPEED_FREQ_HIGH;
        HAL_GPIO_Init(REMOTE_IN_GPIO_PORT, &gpio_init_struct);

        HAL_NVIC_SetPriority(REMOTE_IN_TIMX_IRQn, 1, 3);
        HAL_NVIC_EnableIRQ(REMOTE_IN_TIMX_IRQn);
    }
}

/* 遥控器接收状态
 * [7] : 收到了引导码标志
 * [6] : 得到了一个按键的所有信息
 * [5] : 保留
 * [4] : 标记上升沿是否已经被捕获
 * [3:0]: 溢出计时器
*/
uint8_t g_remote_sta = 0;
uint32_t g_remote_data = 0;
uint8_t g_remote_cnt = 0;


/**
 * @brief       定时器中断服务函数
 * @param       无
 * @retval      无
 */
void REMOTE_IN_TIMX_IRQHandler(void)
{
    HAL_TIM_IRQHandler(&g_tim4_handle);
}


/**
 * @brief       定时器更新中断回调函数
 * @param       htim:定时器句柄
 * @retval      无
 */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == REMOTE_IN_TIMX)
    {
        if (g_remote_sta & 0x80)        // 上次有数据被接收到了
        {
            g_remote_sta &= ~0x10;      // 取消上升沿已经捕获标记

            if ((g_remote_sta & 0x0f) == 0x00)
            {
                g_remote_sta |= 1 << 6;         // 标记已经完成了一次按键值信息采集
            }

            if ((g_remote_sta & 0x0f) < 14)
            {
                g_remote_sta++;
            }
            else
            {
                g_remote_sta &= ~(1 << 7);      // 清空引导标识
                g_remote_sta &= 0xf0;           // 清空计数器
            }
        }
    }
}

/**
 * @brief       定时器输入捕获中断回调函数
 * @param       htim:定时器句柄
 * @retval      无
 */
void HAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == REMOTE_IN_TIMX)
    {
        uint16_t dval;
        if (RDATA)      // 上升沿捕获
        {
            __HAL_TIM_SET_CAPTUREPOLARITY(&g_tim4_handle, REMOTE_IN_TIMX_CHY, TIM_INPUTCHANNELPOLARITY_FALLING);// CC4P=1 设置为下降沿捕获
            __HAL_TIM_SET_COUNTER(&g_tim4_handle, 0);   // 清空定时器值
            g_remote_sta |= 0x10;
        }
        else            // 下降沿捕获
        {
            dval = HAL_TIM_ReadCapturedValue(&g_tim4_handle, REMOTE_IN_TIMX_CHY);               // 读取CCR4也可以清CC4IF标志位
            __HAL_TIM_SET_CAPTUREPOLARITY(&g_tim4_handle, REMOTE_IN_TIMX_CHY, TIM_INPUTCHANNELPOLARITY_RISING); // 配置TIM4通道4上升沿捕获

            if (g_remote_sta & 0x10)    // 完成一次高电平捕获
            {
                if (g_remote_sta & 0x80)    // 接收到了引导码
                {
                    if (dval > 300 && dval < 800)   // 560us为标准值，接收到0
                    {
                        g_remote_data >>= 1;
                        g_remote_data &= ~(0x80000000);
                    }
                    else if (dval > 1400 && dval < 1800)    // 1680us为标准值，接收到1
                    {
                        g_remote_data >>= 1;
                        g_remote_data |= 0x80000000;
                    }
                    else if (dval > 2000 && dval < 3000)    // 得到按键值增加的信息 2500us为标准值，连按
                    {
                        g_remote_cnt++;             // 按键次数增加一次
                        g_remote_sta &= 0xf0;       // 清空计时器
                    }
                }
                else if (dval > 4200 && dval < 4700)        // 4500为标准值4.5ms
                {
                    g_remote_sta |= 1 << 7;     // 标记成功接收到了引导码
                    g_remote_cnt = 0;           // 清除案件次数计数器
                }
            }
            g_remote_sta &= ~(1<<4);
        }
    }
}

/**
 * @brief       处理红外按键(类似按键扫描)
 * @param       无
 * @retval      0   , 没有任何按键按下
 *              其他, 按下的按键键值
 */
uint8_t remote_scan(void)
{
    uint8_t sta = 0;
    uint8_t t1, t2;

    if (g_remote_sta & (1 << 6))        // 得到一个按键的所有信息了
    {
        t1 = g_remote_data & 0xFF;      // 得到地址码
        t2 = (g_remote_data >> 8) & 0xFF;   // 得到地址反码

        if ((t1 == (uint8_t)(~t2)) && (t1 == REMOTE_ID))
        {
            t1 = (g_remote_data >> 16) & 0xFF;
            t2 = (g_remote_data >> 24) & 0xFF;

            if (t1== (uint8_t)(~t2))
            {
                sta = t1;           // 键值正确
            }
        }

        if ((sta == 0) || ((g_remote_sta & 0x80) == 0))     // 按键数据错误/遥控器已经没有按下
        {
            g_remote_sta &= ~(1 << 6);  // 清除接收到有效按键标识
            g_remote_cnt = 0;           // 清除按键次数计数器
        }
    }

    return sta;
}
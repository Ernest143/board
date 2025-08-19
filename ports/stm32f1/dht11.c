#include "dht11.h"
#include "delay.h"

/*数据定义:
---以下变量均为全局变量--------
    //----温度高8位== U8T_data_H------
    //----温度低8位== U8T_data_L------
    //----湿度高8位== U8RH_data_H-----
    //----湿度低8位== U8RH_data_L-----
  //-----校验 8位 == U8checkdata-----
*/

uint8_t U8T_data_H,U8T_data_L,U8RH_data_H,U8RH_data_L,U8checkdata;
uint8_t U8T_data_H_temp,U8T_data_L_temp,U8RH_data_H_temp,U8RH_data_L_temp,U8checkdata_temp;
 

static uint8_t DHT11_read_byte(void);
static uint8_t DHT11_start_sampling(void);
static void DHT11_DataPin_Configure_Output(void);
static void DHT11_DataPin_Configure_Input(void);
 
static void DHT11_DataPin_Configure_Output(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;

  __HAL_RCC_GPIOA_CLK_ENABLE(); //使能PD端口时钟
  GPIO_InitStructure.Pin = DHT11_PIN; //PD.0 端口配置
  GPIO_InitStructure.Mode = GPIO_MODE_OUTPUT_PP; //推挽输出
  GPIO_InitStructure.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(DHT11_PORT, &GPIO_InitStructure);
}
 
static void DHT11_DataPin_Configure_Input(void)
{
	GPIO_InitTypeDef DataPin;
	DataPin.Pin = DHT11_PIN;
	DataPin.Mode = GPIO_MODE_AF_INPUT; //悬空 输入    
	DataPin.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(DHT11_PORT, &DataPin);
}

BOOL DHT11_get_databit(void)
{
	uint8_t val;
	val = HAL_GPIO_ReadPin(DHT11_PORT, DHT11_PIN);
	if(val == GPIO_PIN_RESET)
	{
		return FALSE;
	}
	else
	{
		return TRUE;
	}
}
 
void DHT11_set_databit(BOOL level)
{
	if(level == TRUE)
	{
		HAL_GPIO_WritePin(DHT11_PORT, DHT11_PIN, GPIO_PIN_SET);
	}
	else
	{
		HAL_GPIO_WritePin(DHT11_PORT, DHT11_PIN, GPIO_PIN_RESET);
	}
}
 
void mdelay(uint16_t ms)
{
	if(ms != 0)
	{
		delay_ms(ms);
	}
}
 
void udelay(uint16_t us)
{
	if(us != 0)
	{
		delay_us(us);
	}
}
static uint8_t DHT11_read_byte(void)
{
	uint8_t i;
	uint8_t data = 0;
	for(i = 0; i < 8; i++)
	{
		data <<= 1;
		while((!DHT11_get_databit()));
		udelay(10);
		udelay(10);
		udelay(10);
 
		if(DHT11_get_databit())
		{
			data |= 0x1;
			while(DHT11_get_databit());
		}
		else
		{
		} 
  } 
	return data;
}


static uint8_t DHT11_start_sampling(void)
{
	DHT11_DataPin_Configure_Output();
	//主机拉低18ms   
	DHT11_set_databit(FALSE);
	mdelay(18);
	DHT11_set_databit(TRUE);
	//总线由上拉电阻拉高 主机延时20us
	udelay(10);
	udelay(10);

	//主机设为输入 判断从机响应信号 
	DHT11_set_databit(TRUE);

	DHT11_DataPin_Configure_Input();

	//判断从机是否有低电平响应信号 如不响应则跳出，响应则向下运行      
	if(!DHT11_get_databit()) //T !      
	{
		//判断从机是否发出 80us 的低电平响应信号是否结束     
		while((!DHT11_get_databit()));
		// printf("DHT11 answers.\r\n");
		//判断从机是否发出 80us 的高电平，如发出则进入数据接收状态
		while((DHT11_get_databit()))
		{}
		
			return 1;
	}
 
	return 0;
}
 
void DHT11_get_data(uint32_t *buf)
{
	uint8_t temp;
	if(DHT11_start_sampling())
	{
		//printf("DHT11 is ready to transmit data\r\n");
		//数据接收状态         
		U8RH_data_H_temp = DHT11_read_byte();
		U8RH_data_L_temp = DHT11_read_byte();
		U8T_data_H_temp  = DHT11_read_byte();
		U8T_data_L_temp  = DHT11_read_byte();
		U8checkdata_temp = DHT11_read_byte();
	 
		/* Data transmission finishes, pull the bus high */
		DHT11_DataPin_Configure_Output();
		DHT11_set_databit(TRUE);
		//数据校验 
	 
		temp=(U8T_data_H_temp+U8T_data_L_temp+U8RH_data_H_temp+U8RH_data_L_temp);
		if(temp==U8checkdata_temp)
		{
			U8RH_data_H=U8RH_data_H_temp; //湿度
			U8RH_data_L=U8RH_data_L_temp;
			U8T_data_H=U8T_data_H_temp;  //温湿
			U8T_data_L=U8T_data_L_temp;
			U8checkdata=U8checkdata_temp;
		
			
			buf[0] = U8T_data_H; //温度的高低
			buf[1] = U8T_data_L;
			
			buf[2] = U8RH_data_H; //湿度高低
			buf[3] = U8RH_data_L;
	 
		}
	}
}


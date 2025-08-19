#ifndef __DHT11_H
#define __DHT11_H	 

#include "board_base.h"

#define BOOL unsigned char
 
#ifndef TRUE
#define TRUE 1
#endif
 
#ifndef FALSE
#define FALSE 0
#endif


//定义DHT11 GPIOD 0
#define DHT11_PIN  			GPIO_PIN_0
#define DHT11_PORT 			GPIOA

BOOL DHT11_get_databit(void);
void DHT11_set_databit(BOOL level);
void mdelay(uint16_t ms);
void udelay(uint16_t us);
void DHT11_get_data(uint32_t *buf);

	 				    
#endif



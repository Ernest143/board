#ifndef SYS_H
#define SYS_H

#include "board_base.h"
// #include "stm32f1xx.h"

void sys_nvic_set_vector_table(uint32_t baseaddr, uint32_t offset);
uint8_t sys_clock_set(uint32_t plln);
void sys_clock_init(uint32_t plln);

#endif
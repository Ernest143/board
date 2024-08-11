#ifndef BOARDS_H
#define BOARDS_H

#ifdef __cplusplus
 extern "C" {
#endif


#include "board_base.h"
#include "stm32f1xx.h"
#include "stm32f1xx_hal_conf.h"

#define BOARD_FLASH_ADDR_ZERO   0x08000000

// Flash Start Address of Application
#ifndef BOARD_FLASH_APP_START
#define BOARD_FLASH_APP_START   0x08010000
#endif

/* Address of System Memory (ST Bootloader) */
#define BOARD_FLASH_SYSMEM_START    0x1FFF0000

#define BOARD_PAGE_SIZE 0x800

#define BOARD_RAM_START 0x20000000
#define BOARD_RAM_SIZE 0x9FFF

#define BOARD_FLASH_TOP_SPACE   0x807FFF8
//--------------------------------------------------------------------+
// Port specific APIs
// Only used with port source
//--------------------------------------------------------------------+

// check if we just reset by option bytes load i.e protection changes
bool board_reset_by_option_bytes(void);

#ifdef __cplusplus
 }
#endif

#endif /* BOARDS_H_ */
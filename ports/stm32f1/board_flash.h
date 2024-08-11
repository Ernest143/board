#ifndef BOARD_FLASH_H
#define BOARD_FLASH_H

#ifdef __cplusplus
 extern "C" {
#endif


/* error code */
#define BOARD_FLASH_OK                  0
#define BOARD_FLASH_WRITE_FAILED        1       /* write flash failed */
#define BOARD_FLASH_WAIT_OPER_FAILED    2       /* wait operation failed */
#define BOARD_FLASH_WRITE_INCONSISTENT  3       /* Inconsistent write data */
#define BOARD_FLASH_OUT_OR_RANGE        4       /* address out of range */
#define BOARD_FLASH_VERIFICATION        5       /* Verification error */

#ifdef __cplusplus
 }
#endif

#endif
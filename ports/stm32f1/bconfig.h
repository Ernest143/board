#ifndef BOARD_CONFIG_H__
#define BOARD_CONFIG_H__

/* Automatically generated file; DO NOT EDIT. */
/* BOARD-Thread Configuration */

/* BOARD-Thread Kernel */

#define BOARD_NAME_MAX 8
#define BOARD_CPUS_NR 1
#define BOARD_ALIGN_SIZE 8
#define BOARD_THREAD_PRIORITY_32
#define BOARD_THREAD_PRIORITY_MAX 32
#define BOARD_TICK_PER_SECOND 100
#define BOARD_USING_OVERFLOW_CHECK
#define BOARD_USING_HOOK
#define BOARD_HOOK_USING_FUNC_PTR
#define BOARD_USING_IDLE_HOOK
#define BOARD_IDLE_HOOK_LIST_SIZE 4
#define IDLE_THREAD_STACK_SIZE 256

/* kservice optimization */

#define BOARD_USING_DEBUG
#define BOARD_DEBUGING_COLOR
#define BOARD_DEBUGING_CONTEXT

/* Inter-Thread communication */

#define BOARD_USING_SEMAPHORE
#define BOARD_USING_MUTEX
#define BOARD_USING_EVENT
#define BOARD_USING_MAILBOX
#define BOARD_USING_MESSAGEQUEUE

/* Memory Management */

#define BOARD_USING_MEMPOOL
#define BOARD_USING_SMALL_MEM
#define BOARD_USING_MEMHEAP
#define BOARD_MEMHEAP_FAST_MODE
#define BOARD_USING_SMALL_MEM_AS_HEAP
#define BOARD_USING_HEAP
#define BOARD_USING_DEVICE
#define BOARD_USING_CONSOLE
#define BOARD_CONSOLEBUF_SIZE 128
#define BOARD_CONSOLE_DEVICE_NAME "uart1"
#define BOARD_VER_NUM 0x50100
#define BOARD_BACKTRACE_LEVEL_MAX_NR 32

/* BOARD-Thread Components */

#define BOARD_USING_COMPONENTS_INIT
#define BOARD_USING_USER_MAIN
#define BOARD_MAIN_THREAD_STACK_SIZE 1024
#define BOARD_MAIN_THREAD_PRIORITY 10
#define BOARD_USING_MSH
#define BOARD_USING_FINSH
#define FINSH_USING_MSH
#define FINSH_THREAD_NAME "tshell"
#define FINSH_THREAD_PRIORITY 20
#define FINSH_THREAD_STACK_SIZE 1024
#define FINSH_USING_HISTORY
#define FINSH_HISTORY_LINES 5
#define FINSH_USING_SYMTAB
#define FINSH_CMD_SIZE 80
#define MSH_USING_BUILT_IN_COMMANDS
#define FINSH_USING_DESCRIPTION
#define FINSH_ARG_MAX 10
#define FINSH_USING_OPTION_COMPLETION

/* DFS: device virtual file system */


/* Device Drivers */

#define BOARD_USING_DEVICE_IPC
#define BOARD_UNAMED_PIPE_NUMBER 64
#define BOARD_USING_SERIAL
#define BOARD_USING_SERIAL_V1
#define BOARD_SERIAL_RB_BUFSZ 64
#define BOARD_USING_PIN

/* Using USB */


/* C/C++ and POSIX layer */

/* ISO-ANSI C layer */

/* Timezone and Daylight Saving Time */

#define BOARD_LIBC_USING_LIGHT_TZ_DST
#define BOARD_LIBC_TZ_DEFAULT_HOUR 8
#define BOARD_LIBC_TZ_DEFAULT_MIN 0
#define BOARD_LIBC_TZ_DEFAULT_SEC 0

/* POSIX (Portable Operating System Interface) layer */


/* Interprocess Communication (IPC) */


/* Socket is in the 'Network' category */


/* Network */


/* Memory protection */


/* Utilities */


/* BOARD-Thread Utestcases */


/* BOARD-Thread online packages */

/* IoT - internet of things */


/* Wi-Fi */

/* Marvell WiFi */


/* Wiced WiFi */


/* CYW43012 WiFi */


/* BL808 WiFi */


/* CYW43439 WiFi */


/* IoT Cloud */


/* security packages */


/* language packages */

/* JSON: JavaScript Object Notation, a lightweight data-interchange format */


/* XML: Extensible Markup Language */


/* multimedia packages */

/* LVGL: powerful and easy-to-use embedded GUI library */


/* u8g2: a monochrome graphic library */


/* tools packages */


/* system packages */

/* enhanced kernel services */


/* acceleration: Assembly language or algorithmic acceleration packages */


/* CMSIS: ARM Cortex-M Microcontroller Software Interface Standard */


/* Micrium: Micrium software products porting for BOARD-Thread */


/* peripheral libraries and drivers */

/* HAL & SDK Drivers */

/* STM32 HAL & SDK Drivers */


/* Kendryte SDK */


/* sensors drivers */


/* touch drivers */


/* AI packages */


/* Signal Processing and Control Algorithm Packages */


/* miscellaneous packages */

/* project laboratory */

/* samples: kernel and components samples */


/* entertainment: terminal games and other interesting software packages */


/* Arduino libraries */


/* Projects and Demos */


/* Sensors */


/* Display */


/* Timing */


/* Data Processing */


/* Data Storage */

/* Communication */


/* Device Control */


/* Other */


/* Signal IO */


/* Uncategorized */

/* Hardware Drivers Config */

/* On-chip Peripheral Drivers */

/* GPIO Drivers */

#define BSP_USING_GPIO

/* UABOARD Drivers */

#define BSP_USING_UABOARD1
#define SOC_MM32L373

#endif

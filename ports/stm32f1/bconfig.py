# BSP Note: For TI EK-TM4C1294XL Tiva C Series Connected LancuhPad	(REV D)

import os
import sys
# toolchains options
CROSS_TOOL = 'gcc'

# if os.getenv('RTT_CC'):
#     CROSS_TOOL = os.getenv('RTT_CC')
# device options
ARCH = 'arm'
CPU = 'cortex-m3'

ST_HAL_DRIVER = 'st/stm32f1xx_hal_driver'
ST_CMSIS = 'st/cmsis_device_f1'
CMSIS_5 = 'CMSIS_5'

BOARD_BASE = 'stm32f103xe'


# cross_tool provides the cross compiler
# EXEC_PATH is the compiler execute path, for example, CodeSourcery, Keil MDK, IAR
if CROSS_TOOL == 'gcc':
    PLATFORM = 'gcc'
    EXEC_PATH = '/opt/gcc-arm-none-eabi-10.3-2021.10/bin'
# elif CROSS_TOOL == 'keil':
#     PLATFORM = 'armcc'
#     EXEC_PATH = 'C:/Keil_v5'
# elif CROSS_TOOL == 'iar':
#     PLATFORM = 'iccarm'
#     EXEC_PATH = 'C:/Program Files (x86)/IAR Systems/Embedded Workbench 7.2'

# if os.getenv('RTT_EXEC_PATH'):
#     EXEC_PATH = os.getenv('RTT_EXEC_PATH')

BUILD = 'debug'
#BUILD = 'release'

if PLATFORM == 'gcc':
    PREFIX = 'arm-none-eabi-'
    CC = PREFIX + 'gcc'
    CXX = PREFIX + 'g++'
    AS = PREFIX + 'gcc'
    AR = PREFIX + 'ar'
    LINK = PREFIX + 'gcc'
    TARGET_EXT = 'elf'
    SIZE = PREFIX + 'size'
    OBJDUMP = PREFIX + 'objdump'
    OBJCPY = PREFIX + 'objcopy'

    DEVICE = ' -mcpu=cortex-m3 -mthumb -ffunction-sections -fdata-sections -Wall'
    CFLAGS = DEVICE + ' -std=c99 ' + '-DUSE_HAL_DRIVER -DSTM32F103xE'
    AFLAGS = ' -c' + DEVICE + ' -x assembler-with-cpp -Wa,-mimplicit-it=thumb '
    LFLAGS = DEVICE + ' -Wl,--gc-sections,-Map=board.map,-cref,-u,Reset_Handler -lc -lm -lnosys -specs=nano.specs -specs=nosys.specs -T linker/stm32f1_app.ld'

    CPATH = ''
    LPATH = ''

    if BUILD == 'debug':
        CFLAGS += ' -gdwarf-2 -g'
        AFLAGS += ' -gdwarf-2'
    else:
        CFLAGS += ' -O2'

    POST_ACTION = OBJCPY + ' -O binary $TARGET board.bin\n' + SIZE + ' $TARGET \n'

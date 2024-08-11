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
    LFLAGS = DEVICE + ' -Wl,--gc-sections,-Map=board.map,-cref,-u,Reset_Handler -lc -lm -lnosys -specs=nano.specs -specs=nosys.specs -T linker/stm32f1_boot.ld'

    CPATH = ''
    LPATH = ''

    if BUILD == 'debug':
        CFLAGS += ' -gdwarf-2 -g'
        AFLAGS += ' -gdwarf-2'
    else:
        CFLAGS += ' -O2'

    POST_ACTION = OBJCPY + ' -O binary $TARGET board.bin\n' + SIZE + ' $TARGET \n'
# elif PLATFORM == 'armcc':
#     # toolchains
#     CC = 'armcc'
#     AS = 'armasm'
#     AR = 'armar'
#     LINK = 'armlink'
#     TARGET_EXT = 'axf'

#     DEVICE = ' --cpu ' + CPU 
#     CFLAGS = '-c ' + DEVICE + ' --apcs=interwork --c99'
#     AFLAGS = DEVICE + ' --apcs=interwork '
#     LFLAGS = DEVICE + ' --scatter "drivers/linker_scripts/link.sct" --info sizes --info totals --info unused --info veneers --list rtthread.map --strict'

#     CFLAGS += ' -I' + EXEC_PATH + '/ARM/ARMCC/INC'
#     LFLAGS += ' --libpath ' + EXEC_PATH + '/ARM/ARMCC/LIB'

#     CFLAGS += ' -D__MICROLIB '
#     AFLAGS += ' --pd "__MICROLIB SETA 1" '
#     LFLAGS += ' --library_type=microlib '
#     EXEC_PATH += '/arm/armcc/bin/'

#     if BUILD == 'debug':
#         CFLAGS += ' -g -O0'
#         AFLAGS += ' -g'
#     else:
#         CFLAGS += ' -O2'

#     POST_ACTION = 'fromelf --bin $TARGET --output rtthread.bin \nfromelf -z $TARGET'

# elif PLATFORM == 'iccarm':
#     # toolchains
#     CC = 'iccarm'
#     AS = 'iasmarm'
#     AR = 'iarchive'
#     LINK = 'ilinkarm'
#     TARGET_EXT = 'out'

#     DEVICE = '-Dewarm' # + ' -D' + PART_TYPE

#     CFLAGS = DEVICE
#     CFLAGS += ' --diag_suppress Pa050'
#     CFLAGS += ' --no_cse' 
#     CFLAGS += ' --no_unroll' 
#     CFLAGS += ' --no_inline' 
#     CFLAGS += ' --no_code_motion' 
#     CFLAGS += ' --no_tbaa' 
#     CFLAGS += ' --no_clustering' 
#     CFLAGS += ' --no_scheduling' 

#     CFLAGS += ' --endian=little' 
#     CFLAGS += ' --cpu=Cortex-M3' 
#     CFLAGS += ' -e' 

#     CFLAGS += ' --dlib_config "' + EXEC_PATH + '/arm/INC/c/DLib_Config_Normal.h"'    
#     CFLAGS += ' --silent'
        
#     AFLAGS = DEVICE
#     AFLAGS += ' -s+' 
#     AFLAGS += ' -w+' 
#     AFLAGS += ' -r' 
#     AFLAGS += ' --cpu ' + CPU

#     AFLAGS += ' -S'

#     if BUILD == 'debug':
#         CFLAGS += ' --debug'
#         CFLAGS += ' -On'
#     else:
#         CFLAGS += ' -Oh'

#     LFLAGS = ' --config "drivers/linker_scripts/link.icf"'
#     LFLAGS += ' --entry __iar_program_start'    
#     #LFLAGS += ' --silent'

#     EXEC_PATH = EXEC_PATH + '/arm/bin/'
#     POST_ACTION = ''
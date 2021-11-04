CC=arm-none-eabi-gcc
PP=arm-none-eabi-g++
AS=arm-none-eabi-as
AR=arm-none-eabi-ar
LD=arm-none-eabi-ld
CP=arm-none-eabi-objcopy

PLATFORM_ARCH          = MCU_STM_32
PLATFORM_ARCH_ESP32    = MCU_ESP_32
PLATFORM_ARCH_ESP8266  = MCU_ESP_8266
PLATFORM_ARCH_STM32    = MCU_STM_32

# ** 项目配置区 **

#    输出文件名称
TARGET_NAME         = stm
TARGET_NAME_EXT_ELF = elf
TARGET_NAME_EXT_BIN = bin
TARGET_NAME_EXT_HEX = hex
#    安装位置
INSTALL_PATH = /home/sparrow/zMCU/boot
PROJECT_ROOT = ./
PROJECT_DIR_BESIDES  = \(
PROJECT_DIR_BESIDES += -path ./.git
PROJECT_DIR_BESIDES += -o -path ./obj
PROJECT_DIR_BESIDES += -o -path ./elf
PROJECT_DIR_BESIDES += -o -path ./bin
PROJECT_DIR_BESIDES += -o -path ./hex
PROJECT_DIR_BESIDES += -o -path ./libhal/STM32F1xx_HAL_Driver/Src/template
PROJECT_DIR_BESIDES += -o -path ./libhal/STM32F1xx_HAL_Driver/Src/Legacy
PROJECT_DIR_BESIDES += -o -path ./libsystem/delay
PROJECT_DIR_BESIDES += -o -path ./libsystem/usart
PROJECT_DIR_BESIDES += -o -path ./libsystem/sys
PROJECT_DIR_BESIDES += \)
PROJECT_DIRS = $(shell find $(PROJECT_ROOT) $(PROJECT_DIR_BESIDES) -prune -o -type d -print)

TARGET_OBJ_DIR := ./obj
TARGET_ELF_DIR := ./elf
TARGET_BIN_DIR := ./bin
TARGET_HEX_DIR := ./hex

TARGET_STARTUP_ASM  = ./libcore/startup_stm32f103xe.s
TARGET_STARTUP_OBJ  = ./libcore/startup_stm32f103xe.o
TARGET_SOURCES_CC  += $(foreach dir,$(PROJECT_DIRS),$(wildcard $(dir)/*.c))
TARGET_OBJECTS_CC  += $(patsubst %.c,%.o,$(TARGET_SOURCES_CC))                       # $(patsubst %.cpp,${TARGET_OBJECTS_DIR}/%.o,$(notdir ${TARGET_SOURCES}))
TARGET_OBJECTS_PP  += $(foreach dir,$(PROJECT_DIRS),$(wildcard $(dir)/*.cpp))
TARGET_OBJECTS_PP  += $(patsubst %.cpp,%.o,$(TARGET_SOURCES_PP))
TARGET_HEADER_DIRS += $(foreach dir,$(PROJECT_DIRS),-I$(dir))                         # $(wildcard $(TARGET_HEADERS_DIR)/*.h)

TARGET_LIBS        = -lc_nano -lg -lm -lrdimon
TARGET_LIB_INCLUDE =
TARGET_LIB_PATH    = -L /usr/lib/arm-none-eabi/newlib
TARGET_LD_FLAGS    = -specs=nano.specs -T main/STM32F100XE_FLASH.ld $(TARGET_LIB_PATH) $(TARGET_LIBS)

ASFLAGS = -Wall -mcpu=cortex-m3 -mthumb
CCFLAGS = -Wall -mcpu=cortex-m3 -mthumb -c -mfloat-abi=soft -march=armv7-m -I${TARGET_HEADER_DIRS}
PPFLAGS = -Wall -mcpu=cortex-m3 -mthumb -c -mfloat-abi=soft -march=armv7-m -I${TARGET_HEADER_DIRS} 

# 平台检测 -- ESP32
ifeq (${PLATFORM_ARCH},${PLATFORM_ARCH_ESP32})
endif
# 平台检测 -- ESP8266
ifeq (${PLATFORM_ARCH},${PLATFORM_ARCH_ESP8266})
endif
# 平台检测 -- STM32
ifeq (${PLATFORM_ARCH},${PLATFORM_ARCH_STM32})
endif

${TARGET_ELF_DIR}/${TARGET_NAME}.elf:$(TARGET_OBJECTS_PP) $(TARGET_OBJECTS_CC) $(TARGET_STARTUP_OBJ)
	$(PP) ${TARGET_LD_FLAGS} ${TARGET_LIB_PIC} ${TARGET_LIB_FLAG} -o $@ $^
# 静态模式
$(TARGET_OBJECTS_CC):%.o : %.c
	$(CC) ${CCFLAGS} $< -o $@
$(TARGET_OBJECTS_PP):%.o : %.cpp
	$(PP) ${PPFLAGS} $< -o $@
$(TARGET_STARTUP_OBJ):
	$(AS) ./libcore/startup_stm32f103xe.s ${ASFLAGS} -o ./libcore/startup_stm32f103xe.o
bin:${TARGET_ELF_DIR}/${TARGET_NAME}.elf
	arm-none-eabi-objcopy -O binary ${TARGET_ELF_DIR}/${TARGET_NAME}.elf ${TARGET_BIN_DIR}/${TARGET_NAME}.bin
hex:${TARGET_ELF_DIR}/${TARGET_NAME}.elf
	arm-none-eabi-objcopy -O ihex   ${TARGET_ELF_DIR}/${TARGET_NAME}.elf ${TARGET_HEX_DIR}/${TARGET_NAME}.hex
clean   :
	rm -f $(TARGET_OBJECTS_CC)
	rm -f $(TARGET_OBJECTS_PP)
	rm -f ${TARGET_ELF_DIR}/*
	rm -f ${TARGET_BIN_DIR}/*
	rm -f ${TARGET_HEX_DIR}/*
install :
	cp bin/*.bin ${INSTALL_PATH}/
	cp hex/*.hex ${INSTALL_PATH}/
uninstall :
push:
publish:

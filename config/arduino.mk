PROJECT_NAME = blink.elf
BINARY_NAME  = blink.hex

CLOCK = 16000000
DEVICE	= atmega328p
PORT   ?= /dev/ttyACM*
BAUD   ?= 115200
PROGRAMMER = arduino

CFLAGS  = -Wall -Os -DF_CPU=${CLOCK} -mmcu=${DEVICE}

TOOLCHAIN_PREFIX = avr-

CC              := $(TOOLCHAIN_PREFIX)gcc
AR              := $(TOOLCHAIN_PREFIX)ar
OBJCPY          := $(TOOLCHAIN_PREFIX)objcopy
OBJDUMP         := $(TOOLCHAIN_PREFIX)objdump
STRIP           := $(TOOLCHAIN_PREFIX)strip
NM              := $(TOOLCHAIN_PREFIX)nm
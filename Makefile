GCC_BIN =

PROJECT = libmsgpackc

OBJECTS += objectc.o unpack.o version.o vrefbuffer.o zone.o
INCLUDE_PATHS += -I.


###############################################################################
AS      = $(GCC_BIN)arm-none-eabi-as
CC      = $(GCC_BIN)arm-none-eabi-gcc
CPP     = $(GCC_BIN)arm-none-eabi-g++
LD      = $(GCC_BIN)arm-none-eabi-gcc
OBJCOPY = $(GCC_BIN)arm-none-eabi-objcopy

CPU = -mcpu=cortex-m0 -mthumb
CC_FLAGS = $(CPU) -c -g -fno-common -fmessage-length=0 -Wall -fno-exceptions -ffunction-sections -fdata-sections
CC_FLAGS += -D__MBED__

all: $(PROJECT).a

clean:
	rm -f $(PROJECT).a $(OBJECTS)

%.o: %.c
	$(CC) $(CC_FLAGS) -std=gnu99   $(INCLUDE_PATHS) -o $@ $<

$(PROJECT).a: $(OBJECTS)
	$(AR) ruv $(LIBRARY_PATHS) -o $@ $^

# -include config/${PLATFORM}.mk

# includes 
# -include cpu/${CPU}.mk
# -include src_path/${MODE}.mk 
# -include mode/${MODE}.mk

-include config/${PLATFORM}.mk

WORKSPACE	 = ${shell pwd}
# PROJECT_NAME = blink_pc

# alias definition
MD				:= mkdir -p 
RM				:= rm -rf 

# define output directories
BUILD_DIR		:= build
BUILD_LIB_DIR	:= lib
BUILD_BIN_DIR   := bin
INSTALL_DIR		:= ${BUILD_BIN_DIR}
CPU_DIR			:= ${CPU}

# project name definition
PROJECT			:= ${PROJECT_NAME}

# toolchain definition
CC              ?= $(TOOLCHAIN_PREFIX)gcc
AR              ?= $(TOOLCHAIN_PREFIX)ar
OBJCPY          ?= $(TOOLCHAIN_PREFIX)objcpy
OBJDUMP         ?= $(TOOLCHAIN_PREFIX)objdump
STRIP           ?= $(TOOLCHAIN_PREFIX)strip
NM              ?= $(TOOLCHAIN_PREFIX)nm

# CFLAGS                 := -std=c99 

SOURCE_DIR		:= ${WORKSPACE}
HEADER_DIR		:= ${WORKSPACE}

SOURCES			:= ${wildcard ${SOURCE_DIR}/business/*.c} \
				   ${wildcard ${SOURCE_DIR}/platform/${PLATFORM}/*.c} \

OBJECTS			:= $(patsubst $(SOURCE_DIR)/%,$(BUILD_DIR)/%,$(addsuffix .o,$(basename $(SOURCES))))
LIBRARIES		:= ${LIBS}

HEADERS			:= -I${HEADER_DIR}/business				   

INCLUDE			:= ${HEADERS}
TARGET			:= ${BUILD_DIR}/${INSTALL_DIR}/${PLATFORM}/${PROJECT}

.PHONY: clean dirs print-vars upload

all: dirs ${TARGET}

dirs:	
	${MD} ${BUILD_DIR}/${BUILD_BIN_DIR}/${CPU_DIR}
	${MD} ${BUILD_DIR}/${BUILD_LIB_DIR}


${TARGET}: ${OBJECTS}	
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)


$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.c	
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@ $(LIBRARIES)

-include config/${PLATFORM}/upload.mk

clean:
	${RM} -rf ${BUILD_DIR}

print-vars:
	@echo "sources-----------------------------------------------------------------------------------"
	@echo ${SOURCES}
	@echo "headers-----------------------------------------------------------------------------------"
	@echo ${HEADERS}
	@echo "objects-----------------------------------------------------------------------------------"
	@echo ${OBJECTS}
	@echo "libraries-----------------------------------------------------------------------------------"
	@echo ${LIBRARIES}
	@echo "target-----------------------------------------------------------------------------------"
	@echo ${TARGET}
	@echo "include-----------------------------------------------------------------------------------"
	@echo ${INCLUDE}
	@echo "toolchain-----------------------------------------------------------------------------------"
	@echo ${TOOLCHAIN_PREFIX}
	@echo "compiler-----------------------------------------------------------------------------------"	
	@echo ${CC}	
	@echo "workspace-----------------------------------------------------------------------------------"
	@echo ${WORKSPACE}
	@echo ${COMPILE}
	@echo ${SRC_PATH}
	
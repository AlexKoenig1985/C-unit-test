# Tool defintion
CC ?= gcc
CXX ?= g++

#Settings
SRC_DIR = ./src
TEST_DIR = ./test
BUILD_DIR = .
NAME = app.elf

# Search path for header files
CFLAGS += -I$(SRC_DIR)/average

# List of module soruce files

CSOURCES = $(SRC_DIR)/main.c
CSOURCES += $(wildcard $(SRC_DIR)/average/*.c)

#Complier Flags
CFLAGS += -Wall

# Linker Flags
LDFLAGS += 

#Generate names for output files (*.o)

COBJECTS = $(patsubst %.c, %.o, $(CSOURCES))

#Default Rules: Build appllication
.PHONY: all
all: $(NAME)

#Building components
$(COBJECTS): %.o : %.c
%.o: %.c
    $(CC) $(CFLAGS) -c $< -o $@

# Build the target application
.PHONY: $(NAME)
$(NAME):$(COBJECTS)
    $(CC) $(COBJECTS) -o $(BUILD_DIR)/$ (NAME) $(LDFLAGS)

# Remove complied object files
.PHONY: clean
clean:
    rm -f $(COBJECTS)


# Compiler and flags

CC = clang
CFLAGS = -Wall -Wextra -Iinclude -Igen -g

# CC = gcc
# CFLAGS = -Wall -Wextra -Iinclude -Igen -g

# Directories
SRC_DIR := src
GEN_DIR := gen
INC_DIR := include
BUILD_DIR := build
BIN_DIR := bin

# Target
PROG_NAME := hw
TARGET := $(BIN_DIR)/$(PROG_NAME)

# Source and object files
SRCS := $(wildcard $(SRC_DIR)/*.c) $(wildcard $(GEN_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(filter $(SRC_DIR)/%.c,$(SRCS))) \
        $(patsubst $(GEN_DIR)/%.c,$(BUILD_DIR)/%.gen.o,$(filter $(GEN_DIR)/%.c,$(SRCS)))

# Default target
all: $(TARGET)

# Link
$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $^

# Compile .c files from src/
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

# Compile .c files from gen/
$(BUILD_DIR)/%.gen.o: $(GEN_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

# Create output directories if they don't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Clean up build artifacts
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

.PHONY: all clean

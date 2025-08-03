CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -pedantic
TARGET = inheritance
SOURCE = inheritance.c

# Default target
all: $(TARGET)

# Compile the program
$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)

# Run the program
run: $(TARGET)
	./$(TARGET)

# Clean build artifacts
clean:
	rm -f $(TARGET)

# Debug build with additional flags
debug: CFLAGS += -g -DDEBUG
debug: $(TARGET)

# Optimized build
release: CFLAGS += -O2
release: $(TARGET)

# Check for memory leaks (requires valgrind)
memcheck: $(TARGET)
	valgrind --leak-check=full --show-leak-kinds=all ./$(TARGET)

# Style check (if style50 is available)
style:
	style50 $(SOURCE)

# Help target
help:
	@echo "Available targets:"
	@echo "  all      - Build the program (default)"
	@echo "  run      - Build and run the program"
	@echo "  clean    - Remove build artifacts"
	@echo "  debug    - Build with debug symbols"
	@echo "  release  - Build with optimizations"
	@echo "  memcheck - Run with memory leak detection"
	@echo "  style    - Check code style"
	@echo "  help     - Show this help message"

.PHONY: all run clean debug release memcheck style help 
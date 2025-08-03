#!/bin/bash

# Test script for inheritance program

echo "=== Blood Type Inheritance Simulator Test ==="
echo

# Test compilation
echo "1. Testing compilation..."
if make clean && make; then
    echo "✓ Compilation successful"
else
    echo "✗ Compilation failed"
    exit 1
fi
echo

# Test basic execution
echo "2. Testing basic execution..."
if ./inheritance > /dev/null 2>&1; then
    echo "✓ Program runs without crashing"
else
    echo "✗ Program crashed or failed to run"
    exit 1
fi
echo

# Test output format
echo "3. Testing output format..."
output=$(./inheritance)
if echo "$output" | grep -q "Child (Generation 0): blood type"; then
    echo "✓ Output format is correct"
else
    echo "✗ Output format is incorrect"
    exit 1
fi
echo

# Test multiple runs (should produce different results due to randomness)
echo "4. Testing randomness..."
sleep 1
output1=$(./inheritance)
sleep 1
output2=$(./inheritance)
if [ "$output1" != "$output2" ]; then
    echo "✓ Program produces different results (randomness working)"
else
    echo "ℹ Program produces same result (may be due to same time seed)"
fi
echo

# Test memory management with valgrind (if available)
if command -v valgrind > /dev/null 2>&1; then
    echo "5. Testing memory management with valgrind..."
    if valgrind --leak-check=full --error-exitcode=1 ./inheritance > /dev/null 2>&1; then
        echo "✓ No memory leaks detected"
    else
        echo "✗ Memory leaks detected"
        exit 1
    fi
    echo
else
    echo "5. Skipping valgrind test (not installed)"
    echo
fi

# Test with different generation counts (if implemented)
echo "6. Testing with different generation counts..."
if ./inheritance 2 > /dev/null 2>&1; then
    echo "✓ Command line arguments work (if implemented)"
else
    echo "ℹ Command line arguments not implemented yet (expected)"
fi
echo

echo "=== All tests completed ==="
echo
echo "Sample output:"
echo "---------------"
./inheritance 
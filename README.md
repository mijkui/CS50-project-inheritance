# Blood Type Inheritance Simulator

A C program that simulates the genetic inheritance of blood types across multiple generations of a family tree.

## Overview

This program demonstrates how blood type alleles (A, B, O) are inherited from parents to children. Each person has two alleles, and children inherit one allele from each parent randomly. The simulation creates a family tree with a specified number of generations and shows the blood type inheritance pattern.

## Blood Type Genetics

Blood types are determined by three possible alleles: A, B, and O. Each person has two alleles (one from each parent), resulting in these possible combinations:
- **OO**: Blood type O
- **OA/AO**: Blood type A
- **OB/BO**: Blood type B  
- **AA**: Blood type A
- **BB**: Blood type B
- **AB/BA**: Blood type AB

## Features

- **Recursive Family Tree Creation**: Uses recursion to build a complete family tree
- **Random Allele Assignment**: Oldest generation gets random alleles, younger generations inherit from parents
- **Memory Management**: Properly allocates and frees memory for all family members
- **Visual Output**: Displays the family tree with proper indentation and generation labels
- **Error Handling**: Includes input validation and memory allocation checks

## Compilation

To compile the program:

```bash
gcc -o inheritance inheritance.c
```

## Usage

Run the compiled program:

```bash
./inheritance
```

## Example Output

```
Child (Generation 0): blood type OO
    Parent (Generation 1): blood type AO
        Grandparent (Generation 2): blood type OA
        Grandparent (Generation 2): blood type BO
    Parent (Generation 1): blood type OB
        Grandparent (Generation 2): blood type AO
        Grandparent (Generation 2): blood type BO
```

## Implementation Details

### Key Functions

- `create_family(int generations)`: Recursively creates a family tree with the specified number of generations
- `print_family(person *p, int generation)`: Displays the family tree with proper formatting
- `free_family(person *p)`: Recursively frees all allocated memory
- `random_allele()`: Generates random alleles (A, B, or O)

### Data Structure

```c
typedef struct person
{
    struct person *parents[2];  // Pointers to parents
    char alleles[2];           // Blood type alleles
} person;
```

## Algorithm

1. **Base Case**: When `generations == 1`, create a person with random alleles and NULL parents
2. **Recursive Case**: When `generations > 1`:
   - Recursively create two parents
   - Set parent pointers
   - Inherit one random allele from each parent
3. **Memory Management**: Use recursive free to clean up all allocated memory

## Educational Value

This project demonstrates several important programming concepts:
- **Recursion**: Building complex data structures recursively
- **Memory Management**: Proper allocation and deallocation of dynamic memory
- **Data Structures**: Using structs and pointers to represent relationships
- **Random Number Generation**: Simulating genetic randomness
- **Tree Traversal**: Printing hierarchical data structures

## Requirements

- C compiler (gcc recommended)
- Unix-like operating system (for `srandom()` function)
- Standard C libraries: `stdio.h`, `stdlib.h`, `time.h`

## License

This project is part of CS50's Introduction to Computer Science course.

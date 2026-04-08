# Bit Manipulation

Bit manipulation is the act of algorithmically manipulating bits or other pieces of data shorter than a word. Computer programming tasks that require bit manipulation include low-level device control, error detection and correction algorithms, data compression, encryption algorithms, and optimization.

## Fundamental Operations
- **AND (`&`)**: `1 & 1 = 1`, otherwise 0.
- **OR (`|`)**: `0 | 0 = 0`, otherwise 1.
- **XOR (`^`)**: `1 ^ 1 = 0`, `0 ^ 0 = 0`, `1 ^ 0 = 1`.
- **NOT (`~`)**: Inverts all bits.
- **Left Shift (`<<`)**: `x << y` is equivalent to $x \cdot 2^y$.
- **Right Shift (`>>`)**: `x >> y` is equivalent to $x / 2^y$.

## Common Patterns
1. **Clear/Set/Check Bit**: Manipulating specific bits using masks.
2. **Single Number Pattern**: Using XOR properties ($a \wedge a = 0$ and $a \wedge 0 = a$) to find unique elements.
3. **Counting Bits**: Calculating the number of set bits (1s) in a number.
4. **Power of Two**: A number $n > 0$ is a power of 2 if $n \ \& \ (n-1) == 0$.
5. **Bitmasking**: Using bits to represent a set or subset of elements.

## General Steps
1. Identify if the problem can be modeled using binary representation.
2. Use bitwise operators to extract, set, or toggle specific bits.
3. Leverage algebraic properties of XOR for matching problems.

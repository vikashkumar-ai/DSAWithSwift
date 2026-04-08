# Monotonic Stack (Increasing)

A monotonic stack is a stack whose elements are always in a specific order (increasing or decreasing). An **Increasing Monotonic Stack** maintains elements in ascending order from bottom to top.

## Core Logic

1.  **Incoming Element**: When a new element $x$ arrives:
2.  **Maintain Invariant**: While the stack is not empty and the top element is greater than $x$:
    -   Pop the top element from the stack.
3.  **Push**: Push $x$ onto the stack.

## Key Applications

-   **Removing Digits**: Finding the smallest number formed by removing $K$ digits.
-   **Smallest Subsequence**: Finding the lexicographically smallest subsequence of a string with distinct characters.
-   **Next Greater Tree**: Building a Cartesian tree or similar structures.

## Complexity

-   **Time Complexity**: $O(n)$. Each element is pushed and popped at most once.
-   **Space Complexity**: $O(n)$ to store the stack.

## Example (Remove K Digits)

To make a number as small as possible, we want to ensure the digits are in increasing order. If we see a smaller digit coming, we remove the larger digits currently in the "most significant" positions.

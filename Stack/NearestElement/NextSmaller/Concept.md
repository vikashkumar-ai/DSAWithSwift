# Next Smaller Element (Increasing Monotonic Stack)

Finding the next smaller element for each item in an array is the complementary problem to Next Greater, using an **Increasing Monotonic Stack**.

## Core Logic

1.  **Iterate**: Process the array from right to left (for Next Smaller to the right).
2.  **Maintain Invariant**: The stack stores candidates in increasing order from bottom to top. 
    -   While the stack is not empty and the top element is **greater or equal** to the current element $x$:
        -   Pop the top.
3.  **Result**: The current top of the stack is the next smaller element for $x$.
4.  **Push**: Push $x$ onto the stack.

## Complexity

-   **Time Complexity**: $O(n)$.
-   **Space Complexity**: $O(n)$ for the stack.

## Application (Histogram)

Finding the next smaller element on both sides is the foundational step for the "Largest Rectangle in Histogram" problem, as it defines the left and right boundaries where a bar can expand.

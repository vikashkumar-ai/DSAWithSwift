# Next Greater Element (Decreasing Monotonic Stack)

Finding the next greater element for each item in an array is a classic problem that can be solved in linear time using a **Decreasing Monotonic Stack**.

## Core Logic

1.  **Iterate**: Process the array from right to left (to find the next greater to the right) or left to right.
2.  **Maintain Invariant**: For an "Increasing" result (greater), we need the stack to store candidates in decreasing order from bottom to top. 
    -   While the stack is not empty and the top element is **smaller or equal** to the current element $x$:
        -   Pop the top (it's no longer a "next greater" candidate for anything to the left).
3.  **Result**: The current top of the stack is the next greater element for $x$.
4.  **Push**: Push $x$ onto the stack.

## Complexity

-   **Time Complexity**: $O(n)$. Each element is pushed and popped exactly once.
-   **Space Complexity**: $O(n)$ for the stack.

## Variations

-   **Circular Arrays**: Double the array or iterate twice to find the next greater element in a circular manner.
-   **Next Greater Distance**: Store indices in the stack instead of values to calculate distances ($i - j$).

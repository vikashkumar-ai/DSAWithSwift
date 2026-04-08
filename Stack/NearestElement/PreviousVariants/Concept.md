# Previous Smaller/Greater Element

Previous variants seek the target to the **left** of the current element. This is mathematically identical to the "Next" variants, but we process the array from **left to right**.

## Core Logic (Previous Smaller)

1.  **Iterate**: Process the array from left to right.
2.  **Maintain Invariant**: Use an **Increasing Monotonic Stack**.
    -   While the stack is not empty and the top element is **greater or equal** to the current element $x$:
        -   Pop the top.
3.  **Result**: The current top of the stack is the previous smaller element for $x$.
4.  **Push**: Push $x$ onto the stack.

## Differences from "Next" Variants

-   **Direction**: Left (0 up to n-1) instead of Right (n-1 down to 0).
-   **Usage**: Calculating "spans" (how many contiguous elements to the left are smaller/larger) and "histogram" sub-calculations.

## Complexity

-   **Time Complexity**: $O(n)$.
-   **Space Complexity**: $O(n)$.

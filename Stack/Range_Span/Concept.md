# Range and Span Problems (Stack)

Range and Span problems involve finding the distance between an element and its nearest smaller/greater neighbor. The most common example is the "Stock Span" problem.

## Core Logic

1.  **Iterate**: Process the array from left to right.
2.  **Maintain Invariant**: Use a **Decreasing Monotonic Stack**. Store indices or (value, span) pairs.
    -   While the stack is not empty and the top element is **smaller or equal** to the current price $P$:
        -   Pop the top and add its span to the current span.
3.  **Result**: The current span is the number of contiguous days (including the current day) the price has been less than or equal to $P$.
4.  **Push**: Push $(P, currentSpan)$ onto the stack.

## Complexity

-   **Time Complexity**: $O(1)$ per call on average (amortized $O(n)$ for $n$ calls).
-   **Space Complexity**: $O(n)$ to store the stack.

## Key Pattern

-   **Distance Calculation**: $i - NearestGreaterIndex$.
-   **Aggregated Spans**: Storing the running total of popped spans.

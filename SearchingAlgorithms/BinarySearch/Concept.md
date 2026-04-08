# Binary Search Algorithm

Binary search is an efficient algorithm for finding an item from a sorted list of items. It works by repeatedly dividing in half the portion of the list that could contain the item, until you've narrowed down the possible locations to just one.

## Core Logic

1.  **Maintain Boundaries**: Start with a `low` pointer at 0 and a `high` pointer at $n-1$.
2.  **Calculate Mid**: Find the middle element: `mid = low + (high - low) / 2`.
3.  **Compare and Prune**:
    -   If `target == arr[mid]`, search is complete.
    -   If `target < arr[mid]`, the target must be in the left half. Set `high = mid - 1`.
    -   If `target > arr[mid]`, the target must be in the right half. Set `low = mid + 1`.
4.  **Repeat**: Continue until `low > high`.

## Complexity

-   **Time Complexity**: $O(\log n)$. Each step reduces the search space by half.
-   **Space Complexity**: $O(1)$ for iterative implementation, $O(\log n)$ for recursive implementation (due to call stack).

## Key Patterns

-   **Search on Answer**: Using binary search to find an optimal value (e.g., Koko Eating Bananas).
-   **First/Last Occurrence**: Finding the boundaries of a range of identical values.
-   **Search in Rotated Array**: Adapting the comparison logic for partially sorted data.

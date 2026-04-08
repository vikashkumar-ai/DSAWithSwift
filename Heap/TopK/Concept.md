# Top K Elements with Heaps

Finding the "Top K" elements is a classic application of the Heap (Priority Queue) data structure. It allows us to find the K smallest, largest, or most frequent elements efficiently.

## Core Logic

1.  **Iterate**: Process each element in the input collection.
2.  **Heap Maintenance**: Use a Heap of size $K$ to store the current top elements.
    -   To find **Top K Largest**: Use a **Min-Heap**. If the current element is larger than the root, replace it and heapify.
    -   To find **Top K Smallest**: Use a **Max-Heap**. If the current element is smaller than the root, replace it and heapify.
3.  **Result**: After processing all elements, the heap contains the desired Top K.

## Complexity

-   **Time Complexity**: $O(n \log k)$. Each insertion/replacement in a heap of size $k$ takes $O(\log k)$.
-   **Space Complexity**: $O(k)$ to store the heap.

## Why use a Heap instead of Sorting?

-   **Sorting**: $O(n \log n)$ time, $O(n)$ space.
-   **Heap**: $O(n \log k)$ time, $O(k)$ space.
If $k \ll n$, the heap approach is significantly faster and more memory-efficient, especially for large datasets or streaming data.

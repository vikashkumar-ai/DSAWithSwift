# Frequency-based Sorting with Heaps

Sorting elements based on their frequency (how many times they appear) is a common task in data processing. Using a Heap (Priority Queue) allows us to efficiently manage this process.

## Core Logic

1.  **Counting**: Use a Hash Map (Dictionary) to count the occurrences of each element in the input.
2.  **Heapify**: Insert each (element, frequency) pair into a Max-Heap where the comparison is based on the frequency.
3.  **Extract**: Repeatedly extract the maximum element from the heap. This gives elements in descending order of frequency.
4.  **Reconstruct**: Build the result string or array by repeating each extracted element by its frequency.

## Complexity

-   **Time Complexity**: $O(n \log k)$, where $n$ is the total number of elements and $k$ is the number of unique elements. Counting takes $O(n)$, heap building takes $O(k \log k)$, and extraction takes $O(n \log k)$.
-   **Space Complexity**: $O(k)$ to store the frequency map and the heap.

## Applications

-   Top K frequent elements.
-   Reorganizing strings so no two adjacent characters are identical.
-   Data compression algorithms like Huffman Coding.

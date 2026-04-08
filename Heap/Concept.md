# Heap (Priority Queue)

A Heap is a special Tree-based data structure in which the tree is a complete binary tree. Heaps are primarily used to implement Priority Queues.

## Types of Heaps
1. **Max Heap**: The value of the root node must be the greatest among all its children. The same property must be recursively true for all subtrees.
2. **Min Heap**: The value of the root node must be the smallest among all its children.

## Common Patterns

1. **K-th Element**: Finding the $k$-th smallest or largest element in an array using a heap of size $k$.
   - Time Complexity: $O(n \log k)$.
2. **Top K Frequent**: Finding the $k$ most frequent elements by using a frequency map and a min-heap to keep track of the top $k$ items.
3. **Frequency Sorting**: Sorting elements based on their frequencies.
4. **Merge K Sorted Lists**: Using a min-heap to efficiently find the smallest element among the current heads of $k$ sorted lists.

## Implementation in Swift
Swift does not have a built-in `Heap` or `PriorityQueue` in the standard library (it is in the `Collections` package). For DSA interviews, you should be able to implement a simple array-based binary heap.

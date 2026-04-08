# Sorting Algorithms

Sorting is the process of arranging data in a specific order (ascending or descending). Most common sorting algorithms are comparison-based, but some specialized ones are not.

## Comparison-Based Sorts
These algorithms compare elements to determine their relative order.
1. **Selection Sort**: $O(n^2)$.
2. **Bubble Sort**: $O(n^2)$. Simple but inefficient.
3. **Insertion Sort**: $O(n^2)$ worst case, $O(n)$ best case (nearly sorted).
4. **Merge Sort**: $O(n \log n)$. Stable but uses $O(n)$ space.
5. **Quick Sort**: $O(n \log n)$ average case, but $O(n^2)$ worst case. In-place and typically faster than merge sort.

## Non-Comparison Sorts
These algorithms do not compare elements directly. They typically work for specific data types or ranges.
1. **Counting Sort**: $O(n + k)$ where $k$ is the range of values.
2. **Radix Sort**: $O(d \cdot (n + k))$ where $d$ is number of digits.
3. **Bucket Sort**: $O(n)$ average case.

## Stability
A sorting algorithm is **stable** if it preserves the relative order of elements with equal keys. Examples: Merge Sort, Bubble Sort, Counting Sort.
A sorting algorithm is **unstable** if it doesn't. Example: Quick Sort, Heap Sort.

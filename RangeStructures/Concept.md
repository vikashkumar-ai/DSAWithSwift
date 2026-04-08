# Range Structures

Range structures are specialized data structures designed to perform operations on a range of elements in an array or list efficiently. They are essential for solving problems involving range updates or range queries.

## Common Data Structures

1. **Segment Tree**:
   - A versatile tree structure used for storing information about intervals or segments. 
   - It allows both range queries (e.g., sum, min, max) and point updates in $O(\log n)$ time.
   - Requires $O(n)$ space.
2. **Fenwick Tree (Binary Indexed Tree - BIT)**:
   - A tree-based structure conceptually similar to a segment tree but easier to implement and use. 
   - It allows both point updates and prefix sum queries in $O(\log n)$ time.
   - Requires $O(n)$ space.

## Comparison
| Feature | Segment Tree | Fenwick Tree |
| :--- | :--- | :--- |
| Usage | Any range query (sum, min, max) | Primarily for prefix/range sums |
| Complexity | $O(\log n)$ for all ops | $O(\log n)$ for all ops |
| Memory | $4n$ array size | $n$ array size |
| Ease of Use | Flexible but complex | Efficient and simple |

## General Steps
1. Build the structure from the initial array.
2. Use the structure to perform range queries or point/range updates as required.

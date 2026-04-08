# Queue and Deque (FIFO and Double-Ended)

A Queue is a linear data structure that follows the First-In-First-Out (FIFO) principle. A Deque (Double-Ended Queue) allows insertions and deletions from both the front and the back.

## Common Patterns

1. **FIFO Processing**: Handling elements in the order they arrive.
   - Example: Task scheduling, print queue.
2. **Level-wise Processing (BFS)**: Essential for Breadth-First Search on trees and graphs.
   - Example: Binary Tree Level Order Traversal.
3. **Circular Queue Pattern**: Using a fixed-size array with pointers that "wrap around" to efficiently reuse space.
4. **Deque Based**: Useful for problems where elements need to be accessed from both ends.
   - Example: Sliding Window Maximum.

## Implementation in Swift
While Swift doesn't have a built-in `Queue` or `Deque` type in its standard library (though `DoubleEndedQueue` exists in the `Collections` package), we can implement them using an `Array` or a `Double Stack` approach. For most DSA problems, an `Array` with careful management or a simple class is sufficient.

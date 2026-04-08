/**
 * Problem: Design Circular Queue
 * Topic: Queue / Circular Queue Pattern
 * 
 * Description:
 * Design your implementation of the circular queue. The circular queue is a 
 * linear data structure in which the operations are performed based on 
 * FIFO (First In First Out) principle and the last position is connected 
 * back to the first position to make a circle.
 * 
 * Time Complexity: O(1) for all operations.
 * Space Complexity: O(k) for the array of size k.
 */

import Foundation

class MyCircularQueue {
    private var data: [Int]
    private var head: Int
    private var tail: Int
    private var size: Int
    private var capacity: Int

    /**
     * Initializes the MyCircularQueue object with size k.
     */
    init(_ k: Int) {
        self.data = Array(repeating: 0, count: k)
        self.head = 0
        self.tail = -1
        self.size = 0
        self.capacity = k
    }
    
    /**
     * Inserts an element into the circular queue.
     */
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }
        
        tail = (tail + 1) % capacity
        data[tail] = value
        size += 1
        return true
    }
    
    /**
     * Deletes an element from the circular queue.
     */
    func deQueue() -> Bool {
        if isEmpty() { return false }
        
        head = (head + 1) % capacity
        size -= 1
        return true
    }
    
    /**
     * Gets the front item from the queue.
     */
    func Front() -> Int {
        return isEmpty() ? -1 : data[head]
    }
    
    /**
     * Gets the last item from the queue.
     */
    func Rear() -> Int {
        return isEmpty() ? -1 : data[tail]
    }
    
    /**
     * Returns whether the circular queue is empty.
     */
    func isEmpty() -> Bool {
        return size == 0
    }
    
    /**
     * Returns whether the circular queue is full.
     */
    func isFull() -> Bool {
        return size == capacity
    }
}

// --- Test Cases ---
let circularQueue = MyCircularQueue(3)
print("Circular Queue Operations (size 3):")
print("enQueue(1): \(circularQueue.enQueue(1))") // Expected: true
print("enQueue(2): \(circularQueue.enQueue(2))") // Expected: true
print("enQueue(3): \(circularQueue.enQueue(3))") // Expected: true
print("enQueue(4): \(circularQueue.enQueue(4))") // Expected: false
print("Rear():      \(circularQueue.Rear())")     // Expected: 3
print("isFull():    \(circularQueue.isFull())")   // Expected: true
print("deQueue():   \(circularQueue.deQueue())")  // Expected: true
print("enQueue(4): \(circularQueue.enQueue(4))") // Expected: true
print("Rear():      \(circularQueue.Rear())")     // Expected: 4

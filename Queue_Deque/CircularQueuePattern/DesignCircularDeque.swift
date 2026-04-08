/**
 * Problem: Design Circular Deque
 * Topic: Queue_Deque / CircularQueuePattern
 * 
 * Description:
 * Design your implementation of the circular double-ended queue (deque).
 * 
 * Pattern: Circular Array. Use two pointers (front and rear) to track 
 * the double-ended queue's position and handle wrap-around with modulo 
 * arithmetic.
 * 
 * Time Complexity: O(1) for all operations.
 * Space Complexity: O(k) for the array.
 */

import Foundation

class MyCircularDeque {
    private var data: [Int]
    private var front: Int
    private var rear: Int
    private var k: Int
    private var size: Int
    
    init(_ k: Int) {
        self.k = k
        self.data = Array(repeating: 0, count: k)
        self.front = 0
        self.rear = k - 1
        self.size = 0
    }
    
    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        front = (front - 1 + k) % k
        data[front] = value
        size += 1
        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        rear = (rear + 1) % k
        data[rear] = value
        size += 1
        return true
    }
    
    func deleteFront() -> Bool {
        if isEmpty() { return false }
        front = (front + 1) % k
        size -= 1
        return true
    }
    
    func deleteLast() -> Bool {
        if isEmpty() { return false }
        rear = (rear - 1 + k) % k
        size -= 1
        return true
    }
    
    func getFront() -> Int {
        if isEmpty() { return -1 }
        return data[front]
    }
    
    func getRear() -> Int {
        if isEmpty() { return -1 }
        return data[rear]
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isFull() -> Bool {
        return size == k
    }
}

// --- Test Cases ---
let deque = MyCircularDeque(3)
print("Insert Last 1: \(deque.insertLast(1))")   // Expected: true
print("Insert Last 2: \(deque.insertLast(2))")   // Expected: true
print("Insert Front 3: \(deque.insertFront(3))") // Expected: true
print("Current Rear: \(deque.getRear())")        // Expected: 2
print("Is full: \(deque.isFull())")            // Expected: true

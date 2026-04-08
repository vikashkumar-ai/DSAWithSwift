/**
 * Problem: Implement Queue using Stacks
 * Topic: Queue / FIFO Processing
 * 
 * Description:
 * Implement a first in first out (FIFO) queue using only two stacks. 
 * The implemented queue should support all the functions of a normal queue 
 * (push, pop, peek, empty).
 * 
 * Time Complexity: O(1) amortized for push, pop, and peek.
 * Space Complexity: O(n) for the two stacks.
 */

import Foundation

class MyQueue {
    private var stackIn: [Int]  // Primary stack for push
    private var stackOut: [Int] // Auxiliary stack for pop and peek

    /**
     * Initializes the MyQueue object.
     */
    init() {
        self.stackIn = []
        self.stackOut = []
    }
    
    /**
     * Pushes element x to the back of the queue.
     */
    func push(_ x: Int) {
        stackIn.append(x)
    }
    
    /**
     * Removes the element from the front of the queue and returns it.
     */
    func pop() -> Int {
        moveElements()
        return stackOut.popLast() ?? 0
    }
    
    /**
     * Get the front element.
     */
    func peek() -> Int {
        moveElements()
        return stackOut.last ?? 0
    }
    
    /**
     * Returns whether the queue is empty.
     */
    func empty() -> Bool {
        return stackIn.isEmpty && stackOut.isEmpty
    }
    
    /**
     * Helper to move elements from stackIn to stackOut when stackOut is empty.
     */
    private func moveElements() {
        if stackOut.isEmpty {
            while !stackIn.isEmpty {
                stackOut.append(stackIn.popLast()!)
            }
        }
    }
}

// --- Test Cases ---
let queue = MyQueue()
queue.push(1)
queue.push(2)
print("MyQueue Result:")
print("peek():  \(queue.peek())") // Expected: 1
print("pop():   \(queue.pop())")  // Expected: 1
print("empty(): \(queue.empty())") // Expected: false

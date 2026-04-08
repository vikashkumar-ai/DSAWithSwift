/**
 * Problem: Max Stack
 * Topic: Stack / MinMaxStack
 * 
 * Description:
 * Design a stack that supports push, pop, top, and retrieving the 
 * maximum element in constant time.
 * 
 * Pattern: Maintain two stacks. One stack stores all elements, and 
 * the other (maxStack) stores the maximum element seen so far 
 * up to that position.
 * 
 * Time Complexity: O(1) for all operations.
 * Space Complexity: O(n).
 */

import Foundation

class MaxStack {
    private var stack: [Int] = []
    private var maxStack: [Int] = []
    
    init() {}
    
    /**
     * Pushes a new element onto the stack.
     */
    func push(_ val: Int) {
        stack.append(val)
        // Update the current maximum
        let currentMax = maxStack.isEmpty ? val : Swift.max(val, maxStack.last!)
        maxStack.append(currentMax)
    }
    
    /**
     * Removes and returns the top element.
     */
    func pop() -> Int? {
        if stack.isEmpty { return nil }
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    /**
     * Retrieves the top element.
     */
    func top() -> Int? {
        return stack.last
    }
    
    /**
     * Retrieves the maximum element in the stack.
     */
    func getMax() -> Int? {
        return maxStack.last
    }
}

// --- Test Cases ---
let maxStack = MaxStack()
maxStack.push(5)
maxStack.push(1)
maxStack.push(10)
print("Current Max: \(maxStack.getMax() ?? -1)") // Expected: 10
maxStack.pop()
print("Max after pop: \(maxStack.getMax() ?? -1)") // Expected: 5

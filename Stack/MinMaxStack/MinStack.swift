/**
 * Problem: Min Stack
 * Topic: Stack / Min Max Stack
 * 
 * Description:
 * Design a stack that supports push, pop, top, and retrieving the 
 * minimum element in constant time.
 * 
 * Time Complexity: O(1) for all operations.
 * Space Complexity: O(n) for the extra stack to store minimum values.
 */

import Foundation

class MinStack {
    private var stack: [Int]
    private var minStack: [Int] // Auxiliary stack to store current minimum at each level

    /**
     * Initializes the MinStack object.
     */
    init() {
        self.stack = []
        self.minStack = []
    }
    
    /**
     * Pushes an element into the stack.
     */
    func push(_ val: Int) {
        stack.append(val)
        
        // Update the current minimum in minStack
        if minStack.isEmpty || val <= minStack.last! {
            minStack.append(val)
        } else {
            minStack.append(minStack.last!)
        }
    }
    
    /**
     * Removes the element at the top of the stack.
     */
    func pop() {
        if !stack.isEmpty {
            stack.popLast()
            minStack.popLast()
        }
    }
    
    /**
     * Gets the top element of the stack.
     */
    func top() -> Int {
        return stack.last ?? 0
    }
    
    /**
     * Retrieves the minimum element in the stack.
     */
    func getMin() -> Int {
        return minStack.last ?? 0
    }
}

// --- Test Cases ---
let minStack = MinStack()
print("Min Stack Operations [-2, 0, -3]:")
minStack.push(-2)
minStack.push(0)
minStack.push(-3)
print("getMin(): \(minStack.getMin())") // Expected: -3
minStack.pop()
print("top():    \(minStack.top())")    // Expected: 0
print("getMin(): \(minStack.getMin())") // Expected: -2

/**
 * Problem: Remove K Digits (Smallest Number possible)
 * Topic: Stack / MonotonicStack / Increasing
 * 
 * Description:
 * Given a non-negative integer num represented as a string, remove 
 * k digits from the number so that the new number is the smallest 
 * possible.
 * 
 * Pattern: Increasing Monotonic Stack.
 * Чтобы сделать число максимально маленьким, нам нужно чтобы 
 * цифры шли в возрастающем порядке слева направо. 
 * Если мы видим цифру меньше текущей вершины стека, мы "удаляем" 
 * вершину (decrement k).
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class RemoveKDigitsSolver {
    /**
     * Removes k digits for minimal result.
     * - Parameters:
     *   - num: Input digits string.
     *   - k: Path index.
     * - Returns: Minimal result string.
     */
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var k = k
        var stack = [Character]()
        
        for char in num {
            // Monotonic Increasing: Pop if current < top
            while k > 0 && !stack.isEmpty && stack.last! > char {
                stack.removeLast()
                k -= 1
            }
            stack.append(char)
        }
        
        // Remove remaining k from end
        while k > 0 && !stack.isEmpty {
            stack.removeLast()
            k -= 1
        }
        
        // Build result and remove leading zeros
        var result = ""
        var leadingZeros = true
        for char in stack {
            if leadingZeros && char == "0" {
                continue
            }
            leadingZeros = false
            result.append(char)
        }
        
        return result.isEmpty ? "0" : result
    }
}

// --- Test Cases ---
let solver = RemoveKDigitsSolver()
print("Remove 3 from \"1432219\": \(solver.removeKdigits("1432219", 3))") // Expected: "1219"
print("Remove 1 from \"10200\": \(solver.removeKdigits("10200", 1))") // Expected: "200"
print("Remove 2 from \"10\": \(solver.removeKdigits("10", 2))") // Expected: "0"

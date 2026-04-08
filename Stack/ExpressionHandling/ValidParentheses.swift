/**
 * Problem: Valid Parentheses
 * Topic: Stack / Expression Handling
 * 
 * Description:
 * Given a string s containing characters '(', ')', '{', '}', '[' and ']', 
 * determine if the input string is valid. An input string is valid if:
 * 1. Open brackets must be closed by the same type of brackets.
 * 2. Open brackets must be closed in the correct order.
 * 
 * Time Complexity: O(n) where n is length of the string.
 * Space Complexity: O(n) for the stack.
 */

import Foundation

class Solution {
    /**
     * Checks if the parentheses in a string are correctly balanced.
     * - Parameters:
     *   - s: The input string.
     * - Returns: A boolean value of true if the string is valid.
     */
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let bracketMapping: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["
        ]
        
        for char in s {
            // If the character is a closing bracket
            if let openingBracket = bracketMapping[char] {
                // Pop the top of the stack and check if it matches
                if stack.isEmpty || stack.popLast() != openingBracket {
                    return false
                }
            } else {
                // If it's an opening bracket, push it onto the stack
                stack.append(char)
            }
        }
        
        // If the stack is empty, all brackets have been matched correctly
        return stack.isEmpty
    }
}

// --- Test Cases ---
let sol = Solution()
print("Valid Parentheses \"()[]{}\": \(sol.isValid("()[]{}"))") // Expected: true
print("Valid Parentheses \"([)]\":  \(sol.isValid("([)]"))")     // Expected: false
print("Valid Parentheses \"{[]}\":   \(sol.isValid("{[]}"))")    // Expected: true

/**
 * Problem: Evaluate Reverse Polish Notation
 * Topic: Stack / ExpressionHandling
 * 
 * Description:
 * Evaluate the value of an arithmetic expression in Reverse Polish 
 * Notation (Postfix). 
 * Valid operators are +, -, *, and /. Each operand may be an integer 
 * or another expression.
 * 
 * Pattern: When an operand is encountered, push it onto the stack. 
 * When an operator is encountered, pop the last two operands, apply 
 * the operator, and push the result back onto the stack.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Evaluates a postfix expression.
     * - Parameters:
     *   - tokens: Array of strings representing operands and operators.
     * - Returns: The evaluated result.
     */
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for token in tokens {
            if let num = Int(token) {
                stack.append(num)
            } else {
                // Token is an operator
                let op2 = stack.removeLast()
                let op1 = stack.removeLast()
                
                switch token {
                case "+":
                    stack.append(op1 + op2)
                case "-":
                    stack.append(op1 - op2)
                case "*":
                    stack.append(op1 * op2)
                case "/":
                    stack.append(op1 / op2)
                default:
                    break
                }
            }
        }
        
        return stack.last!
    }
}

// --- Test Cases ---
let sol = Solution()
print("Eval [\"2\",\"1\",\"+\",\"3\",\n\"*\"]: \(sol.evalRPN(["2","1","+","3","*"]))") // Expected: 9
print("Eval [\"4\",\"13\",\"5\",\"/\",\n\"+\"]: \(sol.evalRPN(["4","13","5","/","+"]))") // Expected: 6

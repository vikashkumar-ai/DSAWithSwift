/**
 * Problem: Happy Number
 * Topic: HashMap / LookupBased
 * 
 * Description:
 * A happy number is a number defined by the following process:
 * Starting with any positive integer, replace the number by the 
 * sum of the squares of its digits. Repeat the process until 
 * the number equals 1 (where it will stay), or it loops endlessly 
 * in a cycle which does not include 1. 
 * Those numbers for which this process ends in 1 are happy.
 * 
 * Pattern: Cycle Detection via Hash Set. Keep track of all the numbers 
 * generated so far. If a number repeats and isn't 1, there's a 
 * cycle and the number is not happy.
 * 
 * Time Complexity: O(log n).
 * Space Complexity: O(log n).
 */

import Foundation

class Solution {
    /**
     * Determines if a given number is a happy number.
     * - Parameters:
     *   - n: The input integer.
     * - Returns: A boolean value of true if happy.
     */
    func isHappy(_ n: Int) -> Bool {
        var visited = Set<Int>()
        var current = n
        
        // Loop until we reach 1 or hit a cycle
        while current != 1 && !visited.contains(current) {
            visited.insert(current)
            current = getNext(current)
        }
        
        return current == 1
    }
    
    /**
     * Helper to get the sum of squares of digits.
     */
    private func getNext(_ n: Int) -> Int {
        var sum = 0
        var num = n
        while num > 0 {
            let digit = num % 10
            sum += digit * digit
            num /= 10
        }
        return sum
    }
}

// --- Test Cases ---
let sol = Solution()
print("Is 19 a happy number: \(sol.isHappy(19))") // Expected: true (19->82->68->100->1)
print("Is 2 a happy number:  \(sol.isHappy(2))")  // Expected: false

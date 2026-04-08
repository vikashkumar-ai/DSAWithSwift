/**
 * Problem: Daily Temperatures
 * Topic: Stack / Nearest Element / Next Greater
 * 
 * Description:
 * Given an array of integers temperatures represents the daily temperatures, 
 * return an array answer such that answer[i] is the number of days you have 
 * to wait after the i-th day to get a warmer temperature. 
 * 
 * Time Complexity: O(n) where n is length of the temperature array.
 * Space Complexity: O(n) for the stack.
 */

import Foundation

class Solution {
    /**
     * Finds the number of days until a warmer temperature occurs.
     * - Parameters:
     *   - temperatures: The input temperature array.
     * - Returns: Array of wait days.
     */
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]() // Decreasing stack: stores indices of temperatures
        
        for i in 0..<temperatures.count {
            // While current temperature is greater than the temperature at the stack top
            // We found the next warmer day for the index at stack top.
            while !stack.isEmpty && temperatures[stack.last!] < temperatures[i] {
                let colderIndex = stack.popLast()!
                result[colderIndex] = i - colderIndex
            }
            stack.append(i)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Daily Temperatures Result for [73, 74, 75, 71, 69, 72, 76, 73]: \(sol.dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]))") // Expected: [1, 1, 4, 2, 1, 1, 0, 0]

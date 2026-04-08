/**
 * Problem: Previous Greater Element
 * Topic: Stack / NearestElement / PreviousVariants
 * 
 * Description:
 * Given an array of integers, for every element, find the nearest 
 * element that is greater and located to its left. 
 * If no such element exists, return -1.
 * 
 * Pattern: Monotonic Stack (Decreasing). As we traverse from left 
 * to right, maintain a stack where the top is the latest candidate 
 * for the previous greater element.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the nearest greater element to the left for each element.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: Array of previous greater elements.
     */
    func prevGreaterElements(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: -1, count: nums.count)
        var stack = [Int]() // Stores values
        
        for i in 0..<nums.count {
            let num = nums[i]
            
            // Pop elements from the stack that are smaller than or 
            // equal to the current element.
            while !stack.isEmpty && stack.last! <= num {
                stack.removeLast()
            }
            
            // If stack is not empty, the top element is the 
            // previous greater element.
            if let top = stack.last {
                result[i] = top
            }
            
            // Push current element onto the stack
            stack.append(num)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Prev Greater for [10, 4, 5, 20]: \(sol.prevGreaterElements([10, 4, 5, 20]))") 
// Expected: [-1, 10, 10, -1]
print("Prev Greater for [10, 8, 6, 4]: \(sol.prevGreaterElements([10, 8, 6, 4]))") 
// Expected: [-1, 10, 8, 6]

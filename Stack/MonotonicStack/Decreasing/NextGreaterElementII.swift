/**
 * Problem: Next Greater Element II (Circular)
 * Topic: Stack / MonotonicStack / Decreasing
 * 
 * Description:
 * Given a circular integer array nums (i.e., the next element of 
 * nums[nums.count - 1] is nums[0]), return the next greater number 
 * for every element in nums. 
 * The next greater number of a number x is the first greater number 
 * to its traversing-order next in the array, which means you could 
 * search circularly to find its next greater number. 
 * If it doesn't exist, return -1 for this number.
 * 
 * Pattern: Circular monotonic stack. Traverse the array twice (length 2n) 
 * but only map results for the first n indices.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the next greater element in a circular array.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: Array of next greater elements.
     */
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: -1, count: n)
        var stack = [Int]() // Stores indices
        
        // Loop twice to handle circular behavior
        for i in 0..<2 * n {
            let num = nums[i % n]
            
            // Maintain a strictly decreasing stack of values 
            // (or indices with decreasing values)
            while !stack.isEmpty && nums[stack.last!] < num {
                let index = stack.removeLast()
                // Only record result for the original index range
                if result[index] == -1 {
                    result[index] = num
                }
            }
            
            // Push current index only during the first pass or if searching
            if i < n {
                stack.append(i)
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Next Greater for [1, 2, 1]: \(sol.nextGreaterElements([1, 2, 1]))") // Expected: [2, -1, 2]
print("Next Greater for [1, 2, 3, 4, 3]: \(sol.nextGreaterElements([1, 2, 3, 4, 3]))") 
// Expected: [2, 3, 4, -1, 4]

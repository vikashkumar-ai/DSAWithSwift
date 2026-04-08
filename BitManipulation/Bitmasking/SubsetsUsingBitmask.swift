/**
 * Problem: Subsets (using Bitmasking)
 * Topic: Bit Manipulation / Bitmasking
 * 
 * Description:
 * Given an integer array nums of unique elements, return all possible 
 * subsets (the power set). The solution set must not contain 
 * duplicate subsets.
 * 
 * Pattern: A set of n elements has 2ⁿ subsets. Each subset can be 
 * represented as a binary number of n bits. If the i-th bit is 1, 
 * the i-th element is included in the subset.
 * 
 * Time Complexity: O(n * 2ⁿ).
 * Space Complexity: O(n * 2ⁿ) to store all subsets.
 */

import Foundation

class Solution {
    /**
     * Generates all power set elements using bitmasking.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: A 2D array representing the power set.
     */
    func subsets(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        let totalSubsets = 1 << n // 2ⁿ
        var result = [[Int]]()
        
        for i in 0..<totalSubsets {
            var currentSubset = [Int]()
            for j in 0..<n {
                // If j-th bit of i is set, include nums[j]
                if (i & (1 << j)) != 0 {
                    currentSubset.append(nums[j])
                }
            }
            result.append(currentSubset)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Subsets of [1, 2, 3] using bitmask: \(sol.subsets([1, 2, 3]))")
// Expected: [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

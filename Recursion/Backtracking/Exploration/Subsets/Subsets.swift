/**
 * Problem: Subsets
 * Topic: Recursion / Backtracking / Exploration / Subsets
 * 
 * Description:
 * Given an integer array nums of unique elements, return all possible 
 * subsets (the power set). The solution set must not contain duplicate 
 * subsets. Return the solution in any order.
 * 
 * Time Complexity: O(n * 2ⁿ) where n is length of the array. There are 2ⁿ 
 * possible subsets, and for each subset, we copy it into the result.
 * Space Complexity: O(n) for the recursion stack.
 */

import Foundation

class Solution {
    /**
     * Generates all possible subsets of a given set of unique numbers.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: A 2D array representing the power set.
     */
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var currentSubset = [Int]()
        
        backtrack(nums, 0, &currentSubset, &result)
        
        return result
    }
    
    /**
     * Helper to generate subsets using recursion.
     * - Parameters:
     *   - index: Current position in the nums array.
     */
    private func backtrack(_ nums: [Int], _ index: Int, _ current: inout [Int], _ result: inout [[Int]]) {
        // Each state in the backtracking tree is a valid subset
        result.append(current)
        
        for i in index..<nums.count {
            // Choose the current element
            current.append(nums[i])
            
            // Explore further choices
            backtrack(nums, i + 1, &current, &result)
            
            // Unchoose (Backtrack)
            current.removeLast()
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Subsets of [1, 2, 3]: \(sol.subsets([1, 2, 3]))")
// Expected: [[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]
print("Subsets of [0]: \(sol.subsets([0]))") 
// Expected: [[], [0]]

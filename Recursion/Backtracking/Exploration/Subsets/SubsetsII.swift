/**
 * Problem: Subsets II (With Duplicates)
 * Topic: Recursion / Backtracking / Exploration / Subsets
 * 
 * Description:
 * Given an integer array nums that may contain duplicates, return all 
 * possible subsets (the power set). The solution set must not contain 
 * duplicate subsets. Return the solution in any order.
 * 
 * Pattern: Sort the array first. If current element is same as previous 
 * and previous hasn't been chosen in current recursive call (i > index), 
 * skip it to avoid duplicate subsets.
 * 
 * Time Complexity: O(n * 2ⁿ).
 * Space Complexity: O(n) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Generates all unique subsets of an array containing duplicates.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: A 2D array representing unique power sets.
     */
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var currentSubset = [Int]()
        
        // Sorting is crucial for duplicate handling
        let sortedNums = nums.sorted()
        
        backtrack(sortedNums, 0, &currentSubset, &result)
        
        return result
    }
    
    private func backtrack(_ nums: [Int], _ index: Int, _ current: inout [Int], _ result: inout [[Int]]) {
        result.append(current)
        
        for i in index..<nums.count {
            // Skip duplicates: if the current element is the same as the 
            // previous one in the same level of the recursion tree.
            if i > index && nums[i] == nums[i - 1] {
                continue
            }
            
            // Choose the candidate
            current.append(nums[i])
            // Explore
            backtrack(nums, i + 1, &current, &result)
            // Unchoose
            current.removeLast()
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Subsets of [1, 2, 2]: \(sol.subsetsWithDup([1, 2, 2]))")
// Expected: [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]]
print("Subsets of [0]:       \(sol.subsetsWithDup([0]))")
// Expected: [[], [0]]

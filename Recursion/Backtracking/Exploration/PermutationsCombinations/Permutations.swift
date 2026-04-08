/**
 * Problem: Permutations
 * Topic: Recursion / Backtracking / Exploration / PermutationsCombinations
 * 
 * Description:
 * Given an array nums of distinct integers, return all the possible 
 * permutations. You can return the answer in any order.
 * 
 * Time Complexity: O(n * n!) where n is length of the array. There are n! 
 * possible permutations, and each takes O(n) to append to the result.
 * Space Complexity: O(n) for the recursion stack and visited array.
 */

import Foundation

class Solution {
    /**
     * Generates all possible permutations of a given set of distinct numbers.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: A 2D array of permutations.
     */
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var currentPermutation = [Int]()
        var used = Array(repeating: false, count: nums.count)
        
        backtrack(nums, &used, &currentPermutation, &result)
        
        return result
    }
    
    /**
     * Helper to generate permutations using recursion.
     */
    private func backtrack(_ nums: [Int], _ used: inout [Bool], _ current: inout [Int], _ result: inout [[Int]]) {
        // If current permutation is complete
        if current.count == nums.count {
            result.append(current)
            return
        }
        
        for i in 0..<nums.count {
            // Skip already used elements in current permutation
            if used[i] { continue }
            
            // Choose the current element
            used[i] = true
            current.append(nums[i])
            
            // Explore further choices
            backtrack(nums, &used, &current, &result)
            
            // Unchoose (Backtrack)
            current.removeLast()
            used[i] = false
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Permutations of [1, 2, 3]:\n\(sol.permute([1, 2, 3]))")
// Expected: [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

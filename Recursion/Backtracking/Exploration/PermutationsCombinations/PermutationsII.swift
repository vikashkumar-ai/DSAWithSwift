/**
 * Problem: Permutations II (With Duplicates)
 * Topic: Recursion / Backtracking / Exploration / PermutationsCombinations
 * 
 * Description:
 * Given a collection of numbers, nums, that might contain duplicates, 
 * return all possible unique permutations in any order.
 * 
 * Pattern: Sort the array first. Skip elements that are identical to 
 * the previous one across the same level of recursion *if the 
 * previous one is not currently in use*.
 * 
 * Time Complexity: O(n * n!).
 * Space Complexity: O(n) for recursion stack and used array.
 */

import Foundation

class Solution {
    /**
     * Generates all unique permutations for an array containing duplicates.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: A 2D array of unique permutations.
     */
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        var used = Array(repeating: false, count: nums.count)
        
        // Sorting is crucial for duplicate handling
        let sortedNums = nums.sorted()
        
        backtrack(sortedNums, &used, &current, &result)
        
        return result
    }
    
    private func backtrack(_ nums: [Int], _ used: inout [Bool], _ current: inout [Int], _ result: inout [[Int]]) {
        if current.count == nums.count {
            result.append(current)
            return
        }
        
        for i in 0..<nums.count {
            // Already used in current permutation
            if used[i] { continue }
            
            // Skip duplicates: if the current element matches the previous one 
            // across the same decision level.
            if i > 0 && nums[i] == nums[i - 1] && !used[i - 1] {
                continue
            }
            
            // Choose the candidate
            used[i] = true
            current.append(nums[i])
            
            // Explore
            backtrack(nums, &used, &current, &result)
            
            // Unchoose
            current.removeLast()
            used[i] = false
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Unique Permutations of [1, 1, 2]:\n\(sol.permuteUnique([1, 1, 2]))")
// Expected: [[1, 1, 2], [1, 2, 1], [2, 1, 1]]
print("Unique Permutations of [1, 2, 3]:\n\(sol.permuteUnique([1, 2, 3]))")
// Expected: [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

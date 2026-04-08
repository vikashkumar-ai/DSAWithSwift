/**
 * Problem: Partition to K Equal Sum Subsets
 * Topic: Recursion / Backtracking / Exploration / Subsets
 * 
 * Description:
 * Given an integer array nums and an integer k, return true if it is 
 * possible to divide this array into k non-empty subsets whose sums 
 * are all equal.
 * 
 * Pattern: State-space Search. For each number, decide which of the 
 * k subsets (buckets) it belongs to.
 * 
 * Time Complexity: O(kⁿ) where n is length of nums.
 * Space Complexity: O(n) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Determines if given array can be partitioned into k equal subsets.
     * - Parameters:
     *   - nums: The input integer array.
     *   - k: The target number of subsets.
     * - Returns: A boolean value of true if partitioning is possible.
     */
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let totalSum = nums.reduce(0, +)
        if totalSum % k != 0 { return false }
        
        let targetSum = totalSum / k
        let n = nums.count
        
        // Sorting descending to help prune early
        let sortedNums = nums.sorted(by: >)
        if sortedNums[0] > targetSum { return false }
        
        var used = Array(repeating: false, count: n)
        
        return backtrack(sortedNums, k, 0, 0, targetSum, &used)
    }
    
    private func backtrack(_ nums: [Int], _ k: Int, _ index: Int, _ currentSum: Int, _ target: Int, _ used: inout [Bool]) -> Bool {
        // Base case: we have successfully formed k-1 subsets
        if k == 1 { return true }
        
        // If current subset is complete, start forming the next subset
        if currentSum == target {
            return backtrack(nums, k - 1, 0, 0, target, &used)
        }
        
        for i in index..<nums.count {
            // Decision: include nums[i] in the current subset?
            if !used[i] && currentSum + nums[i] <= target {
                used[i] = true
                if backtrack(nums, k, i + 1, currentSum + nums[i], target, &used) {
                    return true
                }
                // Backtrack
                used[i] = false
                
                // Pruning: if current number doesn't fit, 0 sum branches won't help
                if currentSum == 0 { return false }
            }
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
print("Can partition [4, 3, 2, 3, 5, 2, 1] to k=4: \(sol.canPartitionKSubsets([4, 3, 2, 3, 5, 2, 1], 4))") 
// Expected: true ( [5, 2], [4, 3], [3, 3, 1], [2, 2, 3]? No, [5], [4, 1], [3, 2], [3, 2] )
print("Can partition [1, 2, 3, 4] to k=3: \(sol.canPartitionKSubsets([1, 2, 3, 4], 3))") 
// Expected: false

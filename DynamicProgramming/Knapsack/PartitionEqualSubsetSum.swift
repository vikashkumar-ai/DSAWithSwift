/**
 * Problem: Partition Equal Subset Sum (0/1 Knapsack Pattern)
 * Topic: Dynamic Programming / Knapsack
 * 
 * Description:
 * Given a non-empty array nums containing only positive integers, 
 * find if the array can be partitioned into two subsets such that 
 * the sum of elements in both subsets is equal.
 * 
 * Pattern: At each number, decide to include it in the subset or not. 
 * This is equivalent to 0/1 Knapsack where Target = TotalSum / 2.
 * 
 * Time Complexity: O(n * totalSum).
 * Space Complexity: O(totalSum).
 */

import Foundation

class Solution {
    /**
     * Determines if given array can be partitioned into two equal sum subsets.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: A boolean value of true if partitioning is possible.
     */
    func canPartition(_ nums: [Int]) -> Bool {
        let n = nums.count
        let totalSum = nums.reduce(0, +)
        
        // Sum must be even to be partitioned into two equal integers
        if totalSum % 2 != 0 { return false }
        
        let target = totalSum / 2
        
        // dp[i] is true if a sum of i can be formed using a subset of numbers
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true // Base case: sum of 0 can always be formed (empty subset)
        
        for num in nums {
            // Traverse backwards to avoid using the same element multiple times
            if num <= target {
                for i in (num...target).reversed() {
                    if dp[i - num] {
                        dp[i] = true
                    }
                }
            }
        }
        
        return dp[target]
    }
}

// --- Test Cases ---
let sol = Solution()
print("Can partition [1, 5, 11, 5]: \(sol.canPartition([1, 5, 11, 5]))") // Expected: true
print("Can partition [1, 2, 3, 5]: \(sol.canPartition([1, 2, 3, 5]))")    // Expected: false

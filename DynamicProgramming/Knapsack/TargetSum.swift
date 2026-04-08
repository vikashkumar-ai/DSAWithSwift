/**
 * Problem: Target Sum (0/1 Knapsack Pattern)
 * Topic: Dynamic Programming / Knapsack
 * 
 * Description:
 * You are given an integer array nums and an integer target. 
 * You want to build an expression out of nums by adding one of 
 * the symbols '+' and '-' before each integer in nums and then 
 * concatenate all the integers. 
 * Return the number of different expressions that you can 
 * build, which evaluates to target.
 * 
 * Pattern: Let P be the sum of positive elements and N be the sum 
 * of negative elements.
 * 1. P - N = target
 * 2. P + N = sum(nums)
 * Result: 2P = target + sum(nums) => P = (target + sum(nums)) / 2.
 * Thus the problem reduces to finding the number of ways to 
 * form a subset with sum equal to P.
 * 
 * Time Complexity: O(n * P).
 * Space Complexity: O(P).
 */

import Foundation

class Solution {
    /**
     * Finds the number of expressions that evaluate to target.
     * - Parameters:
     *   - nums: The input integer array.
     *   - target: The target value.
     * - Returns: Total number of expressions.
     */
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let totalSum = nums.reduce(0, +)
        
        // Sum + Target must be even and Target sum shouldn't exceed total sum
        if (totalSum + target) % 2 != 0 || abs(target) > totalSum {
            return 0
        }
        
        let pSum = (totalSum + target) / 2
        
        // dp[i] is the number of ways to form a subset with sum i 
        var dp = Array(repeating: 0, count: pSum + 1)
        dp[0] = 1 // Base case: 1 way to form sum 0 (empty subset)
        
        for num in nums {
            if num <= pSum {
                for i in (num...pSum).reversed() {
                    dp[i] += dp[i - num]
                }
            }
        }
        
        return dp[pSum]
    }
}

// --- Test Cases ---
let sol = Solution()
print("Ways to form target 3 with [1, 1, 1, 1, 1]: \(sol.findTargetSumWays([1, 1, 1, 1, 1], 3))") 
// Expected: 5
print("Ways to form target 1 with [1]: \(sol.findTargetSumWays([1], 1))") 
// Expected: 1

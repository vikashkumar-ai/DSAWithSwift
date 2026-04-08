/**
 * Problem: Burst Balloons (MCM Pattern)
 * Topic: Dynamic Programming / MCM
 * 
 * Description:
 * You are given n balloons, indexed from 0 to n - 1. Each balloon is 
 * painted with a number on it represented by an array nums. 
 * You are asked to burst all the balloons.
 * If you burst the i-th balloon, you will get nums[i - 1] * nums[i] * nums[i + 1] 
 * coins. After bursting, the left and right balloons become adjacent.
 * Find the maximum coins you can collect by bursting the balloons wisely.
 * 
 * Pattern: MCM (Matrix Chain Multiplication) interval DP. 
 * dp[i][j] is the max coins by bursting all balloons in (i, j). 
 * For each last balloon k, dp[i][j] = max(dp[i][k] + dp[k][j] + cost(i, k, j)).
 * 
 * Time Complexity: O(n³).
 * Space Complexity: O(n²).
 */

import Foundation

class Solution {
    /**
     * Finds the maximum coins by bursting all balloons.
     * - Parameters:
     *   - nums: Array of balloon numbers.
     * - Returns: Max coins.
     */
    func maxCoins(_ nums: [Int]) -> Int {
        // Pad with 1s at both ends for calculation convenience
        let n = nums.count
        var val = Array(repeating: 1, count: n + 2)
        for i in 0..<n {
            val[i + 1] = nums[i]
        }
        
        // dp[i][j] is the maximum coins for the range (i, j)
        var dp = Array(repeating: Array(repeating: 0, count: n + 2), count: n + 2)
        
        // Try all interval lengths from 1 to n
        for len in 1...n {
            for i in 0...(n - len) {
                // The current interval is (i, i + len + 1)
                let j = i + len + 1
                
                // Try each balloon k in (i, j) as the *last* balloon to burst
                for k in (i + 1)..<j {
                    let currentCoins = val[i] * val[k] * val[j]
                    dp[i][j] = max(dp[i][j], dp[i][k] + dp[k][j] + currentCoins)
                }
            }
        }
        
        return dp[0][n + 1]
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max coins for [3, 1, 5, 8]: \(sol.maxCoins([3, 1, 5, 8]))") // Expected: 167
print("Max coins for [1, 5]: \(sol.maxCoins([1, 5]))")             // Expected: 10

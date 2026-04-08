/**
 * Problem: Unique Paths
 * Topic: Dynamic Programming / TwoD
 * 
 * Description:
 * There is a robot on an m x n grid. The robot is initially located at 
 * the top-left corner (0,0). The robot tries to move to the bottom-right 
 * corner (m-1, n-1). The robot can only move either down or right at 
 * any point in time.
 * Return the number of possible unique paths to reach the bottom-right corner.
 * 
 * Pattern: TwoD DP. The number of paths to cell (i, j) is the sum 
 * of the paths to (i-1, j) and (i, j-1).
 * 
 * Time Complexity: O(m * n) where m and n are grid dimensions.
 * Space Complexity: O(n) or O(m * n) for the DP table.
 */

import Foundation

class Solution {
    /**
     * Finds the number of unique paths from (0,0) to (m-1, n-1) using DP.
     * - Parameters:
     *   - m: Number of rows.
     *   - n: Number of columns.
     * - Returns: Total unique paths.
     */
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // Space optimization: Use only one row for calculations
        var dp = Array(repeating: 1, count: n)
        
        // Skip the first row, as all values are already 1
        for _ in 1..<m {
            for j in 1..<n {
                // Update current row using previous state of same column 
                // and current state of previous column.
                // dp[j] (new) = dp[j] (old/top) + dp[j-1] (left)
                dp[j] += dp[j-1]
            }
        }
        
        return dp[n - 1]
    }
}

// --- Test Cases ---
let sol = Solution()
print("Unique paths for 3x7 grid: \(sol.uniquePaths(3, 7))") // Expected: 28
print("Unique paths for 3x2 grid: \(sol.uniquePaths(3, 2))") // Expected: 3
print("Unique paths for 3x3 grid: \(sol.uniquePaths(3, 3))") // Expected: 6

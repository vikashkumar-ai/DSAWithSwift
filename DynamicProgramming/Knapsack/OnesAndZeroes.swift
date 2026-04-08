/**
 * Problem: Ones and Zeroes (2D Knapsack)
 * Topic: Dynamic Programming / Knapsack
 * 
 * Description:
 * You are given an array of binary strings strs and two integers m 
 * and n. 
 * Return the size of the largest subset of strs such that there are 
 * at most m 0's and n 1's in the subset.
 * 
 * Pattern: 2D Knapsack DP. For each string, decide whether to 
 * include it in the subset based on the remaining capacity of 0's (m) 
 * and 1's (n).
 * 
 * Time Complexity: O(strs.count * m * n).
 * Space Complexity: O(m * n).
 */

import Foundation

class Solution {
    /**
     * Finds the maximum subset size within constraints.
     * - Parameters:
     *   - strs: Array of binary strings.
     *   - m: Maximum 0s.
     *   - n: Maximum 1s.
     * - Returns: Size of the largest subset.
     */
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        for s in strs {
            let counts = countZerosOnes(s)
            let zeros = counts.0
            let ones = counts.1
            
            // Knapsack: traverse backwards to avoid using same item twice
            for i in (zeros...m).reversed() {
                for j in (ones...n).reversed() {
                    dp[i][j] = max(dp[i][j], dp[i - zeros][j - ones] + 1)
                }
            }
        }
        
        return dp[m][n]
    }
    
    private func countZerosOnes(_ s: String) -> (Int, Int) {
        var zeros = 0
        var ones = 0
        for char in s {
            if char == "0" { zeros += 1 } else { ones += 1 }
        }
        return (zeros, ones)
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max Subset for [\"10\",\"0001\",\"111001\",\"1\",\"0\"] with (5, 3): \(sol.findMaxForm(["10","0001","111001","1","0"], 5, 3))") 
// Expected: 4 (["10","0001","1","0"])
print("Max Subset for [\"10\",\"0\",\"1\"] with (1, 1): \(sol.findMaxForm(["10","0","1"], 1, 1))") 
// Expected: 2 (["0","1"])

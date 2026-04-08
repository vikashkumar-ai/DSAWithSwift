/**
 * Problem: Matrix Chain Multiplication
 * Topic: Dynamic Programming / MCM
 * 
 * Description:
 * Given a sequence of matrices, find the most efficient way to 
 * multiply these matrices together. The problem is not actually to 
 * perform the multiplications, but merely to decide in which order 
 * to perform the multiplications.
 * 
 * Pattern: Dynamic Programming (Interval DP). Let m[i,j] be the 
 * minimum number of scalar multiplications needed to compute 
 * the matrix product of matrices i through j.
 * 
 * Time Complexity: O(n³).
 * Space Complexity: O(n²).
 */

import Foundation

class Solution {
    /**
     * Finds the minimum multiplications needed for matrix chain.
     * - Parameters:
     *   - p: Array of dimensions (p[i-1] x p[i] for matrix i).
     * - Returns: Minimum scalar multiplications.
     */
    func matrixChainOrder(_ p: [Int]) -> Int {
        let n = p.count - 1
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        
        // l is the chain length
        for l in 2...n {
            for i in 1...(n - l + 1) {
                let j = i + l - 1
                dp[i][j] = Int.max
                
                // Try splitting at k
                for k in i..<j {
                    let cost = dp[i][k] + dp[k+1][j] + p[i-1] * p[k] * p[j]
                    dp[i][j] = min(dp[i][j], cost)
                }
            }
        }
        
        return dp[1][n]
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min cost for dimensions [10, 20, 30, 40, 30]: \(sol.matrixChainOrder([10, 20, 30, 40, 30]))") 
// Expected: 30000 (10*20*30 + 10*30*40 + 10*40*30 = 6000 + 12000 + 12000)
print("Min cost for dimensions [1, 2, 3, 4]: \(sol.matrixChainOrder([1, 2, 3, 4]))")
// Expected: 18

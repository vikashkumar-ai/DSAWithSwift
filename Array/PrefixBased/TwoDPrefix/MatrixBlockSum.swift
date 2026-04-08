/**
 * Problem: Matrix Block Sum (2D Prefix Sum)
 * Topic: Array / PrefixBased / TwoDPrefix
 * 
 * Description:
 * Given a m x n matrix mat and an integer k, return a matrix answer 
 * where each answer[i][j] is the sum of all elements mat[r][c] for 
 * which i-k <= r <= i+k and j-k <= c <= j+k and (r, c) is a 
 * valid position in the matrix.
 * 
 * Pattern: 2D Prefix Sum. Precompute a 2D prefix sum table so 
 * any rectangle sum can be computed in O(1).
 * 
 * Time Complexity: O(M * N).
 * Space Complexity: O(M * N).
 */

import Foundation

class Solution {
    /**
     * Calculates the matrix block sum within distance k.
     * - Parameters:
     *   - mat: Input 2D integer matrix.
     *   - k: Radius size.
     * - Returns: Matrix of block sums.
     */
    func matrixBlockSum(_ mat: [[Int]], _ k: Int) -> [[Int]] {
        let m = mat.count
        let n = mat[0].count
        var prefix = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        // Step 1: Precompute 2D prefix sum
        for i in 1...m {
            for j in 1...n {
                prefix[i][j] = mat[i-1][j-1] + prefix[i-1][j] + prefix[i][j-1] - prefix[i-1][j-1]
            }
        }
        
        var result = Array(repeating: Array(repeating: 0, count: n), count: m)
        // Step 2: Query each block sum in O(1)
        for i in 0..<m {
            for j in 0..<n {
                let r1 = max(0, i - k)
                let c1 = max(0, j - k)
                let r2 = min(m - 1, i + k)
                let c2 = min(n - 1, j + k)
                
                result[i][j] = prefix[r2 + 1][c2 + 1] - prefix[r1][c2 + 1] - prefix[r2 + 1][c1] + prefix[r1][c1]
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let mat = [[1,2,3],[4,5,6],[7,8,9]]
print("Matrix Block Sum (k=1): \n\(sol.matrixBlockSum(mat, 1).map { $0.description }.joined(separator: "\n"))")
// Expected: [[12,21,16],[27,45,33],[24,39,28]]

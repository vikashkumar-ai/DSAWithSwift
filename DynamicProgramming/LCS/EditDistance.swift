/**
 * Problem: Edit Distance (LCS Pattern)
 * Topic: Dynamic Programming / LCS
 * 
 * Description:
 * Given two strings word1 and word2, return the minimum number of 
 * operations required to convert word1 to word2.
 * You have the following three operations permitted on a word:
 * 1. Insert a character
 * 2. Delete a character
 * 3. Replace a character
 * 
 * Pattern: TwoD DP. 
 * If word1[i] == word2[j], dp[i][j] = dp[i-1][j-1].
 * Otherwise, dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]).
 * 
 * Time Complexity: O(m * n).
 * Space Complexity: O(n) or O(m * n).
 */

import Foundation

class Solution {
    /**
     * Finds the minimum edit distance to convert word1 to word2.
     * - Parameters:
     *   - word1: The first string.
     *   - word2: The second string.
     * - Returns: Minimum number of operations.
     */
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        
        let chars1 = Array(word1)
        let chars2 = Array(word2)
        
        // Use a 2D DP table
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        // Base case: to convert word1[0...i] into an empty string 
        // needs i deletions
        for i in 0...m { dp[i][0] = i }
        // Base case: to convert an empty string into word2[0...j] 
        // needs j insertions
        for j in 0...n { dp[0][j] = j }
        
        // Build the DP table
        for i in 1...m {
            for j in 1...n {
                if chars1[i-1] == chars2[j-1] {
                    // Characters match: skip
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    // One operation (Insert, Delete, or Replace)
                    dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
                }
            }
        }
        
        return dp[m][n]
    }
}

// --- Test Cases ---
let sol = Solution()
print("Edit distance from \"horse\" to \"ros\": \(sol.minDistance("horse", "ros"))") // Expected: 3
print("Edit distance from \"intention\" to \"execution\": \(sol.minDistance("intention", "execution"))") // Expected: 5

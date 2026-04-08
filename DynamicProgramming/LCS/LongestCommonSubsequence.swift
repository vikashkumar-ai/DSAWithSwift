/**
 * Problem: Longest Common Subsequence
 * Topic: Dynamic Programming / LCS
 * 
 * Description:
 * Given two strings text1 and text2, return the length of their 
 * longest common subsequence. 
 * A subsequence of a string is a new string generated from the 
 * original string with some characters (can be none) deleted 
 * without changing the relative order of the remaining characters.
 * 
 * Pattern: 2D Dynamic Programming. If chars match, look at 
 * (dp[i-1][j-1] + 1). If mismatch, take max of (dp[i-1][j], dp[i][j-1]).
 * 
 * Time Complexity: O(m * n) where m and n are string lengths.
 * Space Complexity: O(m * n).
 */

import Foundation

class Solution {
    /**
     * Finds the length of the longest common subsequence of two strings.
     * - Parameters:
     *   - text1: First string.
     *   - text2: Second string.
     * - Returns: Length of LCS.
     */
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let n = text1.count
        let m = text2.count
        let chars1 = Array(text1)
        let chars2 = Array(text2)
        
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        
        for i in 1...n {
            for j in 1...m {
                if chars1[i-1] == chars2[j-1] {
                    // Chars match, add 1 to previous result
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    // Chars mismatch, take the max from top or left
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        return dp[n][m]
    }
}

// --- Test Cases ---
let sol = Solution()
print("LCS for \"abcde\" and \"ace\": \(sol.longestCommonSubsequence("abcde", "ace"))") // Expected: 3
print("LCS for \"abc\" and \"abc\":   \(sol.longestCommonSubsequence("abc", "abc"))")     // Expected: 3
print("LCS for \"abc\" and \"def\":   \(sol.longestCommonSubsequence("abc", "def"))")     // Expected: 0

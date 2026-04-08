/**
 * Problem: Palindrome Partitioning II (MCM Pattern)
 * Topic: Dynamic Programming / MCM
 * 
 * Description:
 * Given a string s, partition s such that every substring of the partition 
 * is a palindrome. Return the minimum cuts needed for a palindrome 
 * partitioning of s.
 * 
 * Pattern: Matrix Chain Multiplication (MCM). We solve for each range 
 * [i, j] or use a 1D DP optimized with a 2D palindrome lookup table.
 * 
 * Time Complexity: O(n²) where n is length of string s.
 * Space Complexity: O(n²) for the palindrome lookup table.
 */

import Foundation

class Solution {
    /**
     * Finds the minimum cuts needed for palindrome partitioning using DP.
     * - Parameters:
     *   - s: The input string.
     * - Returns: Minimum cuts required.
     */
    func minCut(_ s: String) -> Int {
        let n = s.count
        if n <= 1 { return 0 }
        
        let chars = Array(s)
        
        // Step 1: Precompute a 2D table representing whether s[i...j] is a palindrome
        var isPalindrome = Array(repeating: Array(repeating: false, count: n), count: n)
        for i in (0..<n).reversed() {
            for j in i..<n {
                if chars[i] == chars[j] && (j - i <= 2 || isPalindrome[i + 1][j - 1]) {
                    isPalindrome[i][j] = true
                }
            }
        }
        
        // Step 2: Use 1D DP to store min cuts for s[0...i]
        var dp = Array(repeating: 0, count: n)
        for i in 0..<n {
            // Initializing max possible cuts for s[0...i]
            var minCuts = i 
            // If s[0...i] is already a palindrome, 0 cuts are needed
            if isPalindrome[0][i] {
                dp[i] = 0
            } else {
                for j in 1...i {
                    // If s[j...i] is a palindrome, cuts needed is 1 + dp[j-1]
                    if isPalindrome[j][i] {
                        minCuts = min(minCuts, 1 + dp[j - 1])
                    }
                }
                dp[i] = minCuts
            }
        }
        
        return dp[n - 1]
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min cuts for \"aab\": \(sol.minCut("aab"))") // Expected: 1 (["aa","b"])
print("Min cuts for \"a\":   \(sol.minCut("a"))")   // Expected: 0
print("Min cuts for \"ab\":  \(sol.minCut("ab"))")  // Expected: 1

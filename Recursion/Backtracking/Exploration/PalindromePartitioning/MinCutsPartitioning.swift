/**
 * Problem: Palindrome Partitioning Min Cuts (Backtracking Approach)
 * Topic: Recursion / Backtracking / Exploration / PalindromePartitioning
 * 
 * Description:
 * Given a string s, partition s such that every substring of the 
 * partition is a palindrome. Return the minimum cuts needed for a 
 * palindrome partitioning of s.
 * 
 * Pattern: Explore each possible cut. If current substring is a 
 * palindrome, count the current cut and recurse. 
 * Note: While usually solved with DP for efficiency, the backtracking 
 * view helps understand the state-space tree.
 * 
 * Time Complexity: O(2ⁿ * n).
 * Space Complexity: O(n) for recursion stack.
 */

import Foundation

class Solution {
    private var minCuts = Int.max
    
    /**
     * Finds the minimum cuts required for palindromic partitioning.
     * - Parameters:
     *   - s: The input string.
     * - Returns: Minimum cuts required.
     */
    func minCut(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        self.minCuts = s.count - 1
        
        var currentPartition = [String]()
        backtrack(s, 0, &currentPartition)
        
        return minCuts
    }
    
    private func backtrack(_ s: String, _ index: Int, _ current: inout [String]) {
        // Base case: we reached the end of the string
        if index == s.count {
            minCuts = min(minCuts, current.count - 1)
            return
        }
        
        // Pruning: if current partition count is already bigger than minCuts
        if current.count > minCuts {
            return
        }
        
        let chars = Array(s)
        for i in index..<s.count {
            let substring = String(chars[index...i])
            
            if isPalindrome(substring) {
                current.append(substring)
                backtrack(s, i + 1, &current)
                current.removeLast()
            }
        }
    }
    
    private func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var left = 0
        var right = chars.count - 1
        while left < right {
            if chars[left] != chars[right] { return false }
            left += 1
            right -= 1
        }
        return true
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min cuts for \"aab\": \(sol.minCut("aab"))") // Expected: 1 (["aa", "b"])
print("Min cuts for \"ab\":  \(sol.minCut("ab"))")  // Expected: 1 (["a", "b"])

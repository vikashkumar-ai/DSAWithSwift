/**
 * Problem: Palindrome Partitioning
 * Topic: Recursion / Backtracking / Exploration / PalindromePartitioning
 * 
 * Description:
 * Given a string s, partition s such that every substring of the 
 * partition is a palindrome. Return all possible palindrome partitioning of s.
 * 
 * Pattern: Explore every substring at the current level. If it's a 
 * palindrome, proceed recursively with the remaining string.
 * 
 * Time Complexity: O(n * 2ⁿ) where n is length of string s. 
 * Space Complexity: O(n) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Finds all ways to partition s into palindromic substrings.
     * - Parameters:
     *   - s: The input string.
     * - Returns: A 2D array of all palindrome partitionings.
     */
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var currentPartition = [String]()
        
        backtrack(s, 0, &currentPartition, &result)
        
        return result
    }
    
    private func backtrack(_ s: String, _ index: Int, _ current: inout [String], _ result: inout [[String]]) {
        // Base case: we reached the end of the string
        if index == s.count {
            result.append(current)
            return
        }
        
        let chars = Array(s)
        for i in index..<s.count {
            let substring = String(chars[index...i])
            
            // Check if current substring is a palindrome
            if isPalindrome(substring) {
                // Choose
                current.append(substring)
                // Explore
                backtrack(s, i + 1, &current, &result)
                // Unchoose (Backtrack)
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
print("Palindrome Partition of \"aab\": \(sol.partition("aab"))")
// Expected: [["a","a","b"], ["aa","b"]]
print("Palindrome Partition of \"a\": \(sol.partition("a"))")
// Expected: [["a"]]

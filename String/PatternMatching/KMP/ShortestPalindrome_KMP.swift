/**
 * Problem: Shortest Palindrome (using KMP Prefix Function)
 * Topic: String / PatternMatching / KMP
 * 
 * Description:
 * You are given a string s. You can convert s to a palindrome by 
 * adding characters in front of it. Find and return the shortest 
 * palindrome you can find by performing this transformation.
 * 
 * Pattern: KMP Prefix Function. The problem is equivalent to finding 
 * the longest prefix of s that is also a suffix of s.reversed(). 
 * Concatenate s + "#" + s.reversed() and find the LSP (Longest Special 
 * Prefix) value of the last character.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the shortest palindrome by prepending characters.
     * - Parameters:
     *   - s: The source string.
     * - Returns: The shortest possible palindrome.
     */
    func shortestPalindrome(_ s: String) -> String {
        if s.isEmpty { return "" }
        
        let reversedS = String(s.reversed())
        // Combine string to search for longest palindromic prefix
        let combined = s + "#" + reversedS
        let lps = computeLPS(combined)
        
        // Non-palindromic suffix length = s.count - lps.last!
        let suffixLen = s.count - lps.last!
        let prefixToAdd = String(reversedS.prefix(suffixLen))
        
        return prefixToAdd + s
    }
    
    private func computeLPS(_ s: String) -> [Int] {
        let chars = Array(s)
        var lps = Array(repeating: 0, count: chars.count)
        var length = 0
        var i = 1
        
        while i < chars.count {
            if chars[i] == chars[length] {
                length += 1
                lps[i] = length
                i += 1
            } else {
                if length != 0 {
                    length = lps[length - 1]
                } else {
                    lps[i] = 0
                    i += 1
                }
            }
        }
        return lps
    }
}

// --- Test Cases ---
let sol = Solution()
print("Shortest Palindrome for \"aacecaaa\": \(sol.shortestPalindrome("aacecaaa"))") // Expected: "aaacecaaa"
print("Shortest Palindrome for \"abcd\": \(sol.shortestPalindrome("abcd"))")         // Expected: "dcbabcd"

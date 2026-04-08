/**
 * Problem: Knuth-Morris-Pratt (KMP) Algorithm
 * Topic: String / Pattern Matching / KMP
 * 
 * Description:
 * Implements the Knuth-Morris-Pratt (KMP) string matching algorithm 
 * using the Longest Proper Prefix which is also a Suffix (LPS) array.
 * 
 * Time Complexity: O(m + n) where m is length of text and n pattern length.
 * Space Complexity: O(n) for the LPS array.
 */

import Foundation

class Solution {
    /**
     * Searches for occurrences of a pattern in a text using KMP.
     * - Parameters:
     *   - text: The source string.
     *   - pattern: The pattern string to find.
     * - Returns: Array of starting indices where matches are found.
     */
    func strStr(_ text: String, _ pattern: String) -> [Int] {
        if pattern.isEmpty { return [] }
        
        let t = Array(text)
        let p = Array(pattern)
        let n = t.count
        let m = p.count
        
        // Step 1: Precompute the LPS array
        let lps = computeLPSArray(p)
        var result = [Int]()
        
        var i = 0 // current index in text
        var j = 0 // current index in pattern
        
        while i < n {
            if t[i] == p[j] {
                i += 1
                j += 1
            }
            
            if j == m {
                // Match found
                result.append(i - j)
                j = lps[j - 1]
            } else if i < n && t[i] != p[j] {
                // Mismatch
                if j != 0 {
                    j = lps[j - 1]
                } else {
                    i += 1
                }
            }
        }
        
        return result
    }
    
    /**
     * Computes the LPS (Longest Proper Prefix which is also Suffix) array.
     */
    private func computeLPSArray(_ p: [Character]) -> [Int] {
        let m = p.count
        var lps = Array(repeating: 0, count: m)
        var len = 0
        var i = 1
        
        while i < m {
            if p[i] == p[len] {
                len += 1
                lps[i] = len
                i += 1
            } else {
                if len != 0 {
                    len = lps[len - 1]
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
print("KMP Result for text=\"abcabcabc\" pattern=\"abc\": \(sol.strStr("abcabcabc", "abc"))") // Expected: [0, 3, 6]
print("KMP Result for text=\"hello\" pattern=\"ll\": \(sol.strStr("hello", "ll"))")               // Expected: [2]

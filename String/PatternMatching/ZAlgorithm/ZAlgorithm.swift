/**
 * Problem: Z-Algorithm (Linear Time Pattern Matching)
 * Topic: String / Pattern Matching / ZAlgorithm
 * 
 * Description:
 * Implements the Z-Algorithm for string matching. The Z-array for a string S 
 * is an array of the same length as S where Z[i] is the length of the longest 
 * common prefix between S and the suffix of S starting at index i.
 * 
 * Time Complexity: O(m + n) where m is length of text and n pattern length.
 * Space Complexity: O(m + n) for the Z-array.
 */

import Foundation

class Solution {
    /**
     * Searches for occurrences of a pattern in a text using the Z-Algorithm.
     * - Parameters:
     *   - text: The source string.
     *   - pattern: The pattern string to find.
     * - Returns: Array of starting indices where matches are found.
     */
    func strStr(_ text: String, _ pattern: String) -> [Int] {
        if pattern.isEmpty { return [] }
        
        // Step 1: Create a combined string pattern + "$" + text
        let combined = pattern + "$" + text
        let s = Array(combined)
        let n = s.count
        let m = pattern.count
        
        // Step 2: Precompute the Z-array
        let z = computeZArray(s)
        var result = [Int]()
        
        // Step 3: Find matches in the text portion of the Z-array
        // Indices in text portion start from m + 1
        for i in 0..<n {
            if z[i] == m {
                result.append(i - (m + 1))
            }
        }
        
        return result
    }
    
    /**
     * Computes the Z-array for a given character array.
     */
    private func computeZArray(_ s: [Character]) -> [Int] {
        let n = s.count
        var z = Array(repeating: 0, count: n)
        var l = 0
        var r = 0
        
        for i in 1..<n {
            if i <= r {
                z[i] = min(r - i + 1, z[i - l])
            }
            
            while i + z[i] < n && s[z[i]] == s[i + z[i]] {
                z[i] += 1
            }
            
            if i + z[i] - 1 > r {
                l = i
                r = i + z[i] - 1
            }
        }
        
        return z
    }
}

// --- Test Cases ---
let sol = Solution()
print("Z-Algorithm Result for text=\"abcabcabc\" pattern=\"abc\": \(sol.strStr("abcabcabc", "abc"))") // Expected: [0, 3, 6]
print("Z-Algorithm Result for text=\"hello\" pattern=\"ll\": \(sol.strStr("hello", "ll"))")               // Expected: [2]

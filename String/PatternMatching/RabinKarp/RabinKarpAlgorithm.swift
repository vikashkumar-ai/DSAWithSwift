/**
 * Problem: Rabin-Karp Algorithm (Rolling Hash)
 * Topic: String / Pattern Matching / RabinKarp
 * 
 * Description:
 * Implements the Rabin-Karp string matching algorithm using a rolling hash.
 * 
 * Time Complexity: O(m + n) average case. O(m * n) worst case (with many hash collisions).
 * Space Complexity: O(1) as we are only using constants and for frequency.
 */

import Foundation

class Solution {
    /**
     * Searches for occurrences of a pattern in a text using Rabin-Karp.
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
        
        if n < m { return [] }
        
        let d = 256 // Number of characters in alphabet
        let q = 101 // A prime number for modulo
        var result = [Int]()
        
        var patternHash = 0
        var windowHash = 0
        var h = 1
        
        // h = pow(d, m-1) % q
        for i in 0..<m-1 {
            h = (h * d) % q
        }
        
        // Initial hashes for pattern and first window of text
        for i in 0..<m {
            patternHash = (d * patternHash + Int(p[i].asciiValue!)) % q
            windowHash = (d * windowHash + Int(t[i].asciiValue!)) % q
        }
        
        // Slide the window and compare hashes
        for i in 0...n - m {
            if patternHash == windowHash {
                // If hashes match, check characters one by one (to handle collisions)
                if Array(t[i..<i + m]) == p {
                    result.append(i)
                }
            }
            
            // Calculate hash for the next window
            if i < n - m {
                windowHash = (d * (windowHash - Int(t[i].asciiValue!) * h) + Int(t[i + m].asciiValue!)) % q
                if windowHash < 0 { windowHash += q }
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Rabin-Karp Result for text=\"abcabcabc\" pattern=\"abc\": \(sol.strStr("abcabcabc", "abc"))") // Expected: [0, 3, 6]
print("Rabin-Karp Result for text=\"hello\" pattern=\"ll\": \(sol.strStr("hello", "ll"))")               // Expected: [2]

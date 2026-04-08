/**
 * Problem: Longest Repeating Substring (using Rabin-Karp)
 * Topic: String / PatternMatching / RabinKarp
 * 
 * Description:
 * Given a string s, find the length of the longest repeating substring. 
 * If no repeating substring exists, return 0.
 * 
 * Pattern: Binary Search on length + Rabin-Karp hashing. For a given 
 * length L, use rolling hashes to check if any substring of length L 
 * repeats in O(n) time.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the length of the longest repeating substring.
     * - Parameters:
     *   - s: The source string.
     * - Returns: Maximum length found.
     */
    func longestRepeatingSubstring(_ s: String) -> Int {
        let n = s.count
        if n == 0 { return 0 }
        
        var low = 1
        var high = n - 1
        var ans = 0
        
        while low <= high {
            let mid = low + (high - low) / 2
            if hasRepeatingSub(s, mid) {
                ans = mid
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return ans
    }
    
    /**
     * Generic Rabin-Karp check for a repeat of length L.
     */
    private func hasRepeatingSub(_ s: String, _ L: Int) -> Bool {
        var seenHashes = Set<Int>()
        let chars = Array(s.utf8)
        let n = chars.count
        
        let base = 26
        let modulus = 1_000_000_007
        
        var h = 0
        var weight = 1
        
        // Initial window hash
        for i in 0..<L {
            h = (h * base + Int(chars[i])) % modulus
            if i < L - 1 {
                weight = (weight * base) % modulus
            }
        }
        
        seenHashes.insert(h)
        
        // Rolling hash
        for i in 1...(n - L) {
            // Remove the leftmost character and add the new rightmost character
            h = (h - Int(chars[i - 1]) * weight) % modulus
            if h < 0 { h += modulus }
            h = (h * base + Int(chars[i + L - 1])) % modulus
            
            if seenHashes.contains(h) {
                return true
            }
            seenHashes.insert(h)
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
print("Longest repeating substring in \"abcd\": \(sol.longestRepeatingSubstring("abcd"))") // Expected: 0
print("Longest repeating substring in \"abbaba\": \(sol.longestRepeatingSubstring("abbaba"))") // Expected: 2 ("ab" or "ba")
print("Longest repeating substring in \"aabcaab\": \(sol.longestRepeatingSubstring("aabcaab"))") // Expected: 3 ("aab")

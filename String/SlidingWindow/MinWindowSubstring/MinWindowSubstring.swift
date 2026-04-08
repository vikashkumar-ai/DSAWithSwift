/**
 * Problem: Minimum Window Substring
 * Topic: String / Sliding Window / Min Window Substring
 * 
 * Description:
 * Given two strings s and t of lengths m and n respectively, return the minimum 
 * window substring of s such that every character in t (including duplicates) 
 * is included in the window. If there is no such substring, return an empty string.
 * 
 * Time Complexity: O(m + n) where m is length of s and n is length of t.
 * Space Complexity: O(k) where k is the character set size for frequency maps.
 */

import Foundation

class Solution {
    /**
     * Finds the minimum window in s containing all characters of t.
     * - Parameters:
     *   - s: The source string.
     *   - t: The target string.
     * - Returns: Minimum window substring or "".
     */
    func minWindow(_ s: String, _ t: String) -> String {
        if s.isEmpty || t.isEmpty { return "" }
        
        var tFreq = [Character: Int]()
        for char in t { tFreq[char, default: 0] += 1 }
        
        let required = tFreq.count
        var formed = 0
        var windowFreq = [Character: Int]()
        
        let sChars = Array(s)
        var i = 0
        var minLen = Int.max
        var resultRange = (0, 0)
        
        for j in 0..<sChars.count {
            let char = sChars[j]
            windowFreq[char, default: 0] += 1
            
            // If current character matches the count in tFreq
            if let targetCount = tFreq[char], windowFreq[char] == targetCount {
                formed += 1
            }
            
            // While all required characters are present, try shrinking the window from left
            while i <= j && formed == required {
                let currentLen = j - i + 1
                if currentLen < minLen {
                    minLen = currentLen
                    resultRange = (i, j)
                }
                
                let leftChar = sChars[i]
                windowFreq[leftChar]! -= 1
                
                if let targetCount = tFreq[leftChar], windowFreq[leftChar]! < targetCount {
                    formed -= 1
                }
                
                i += 1
            }
        }
        
        return minLen == Int.max ? "" : String(sChars[resultRange.0...resultRange.1])
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min Window Substring of \"ADOBECODEBANC\" for \"ABC\": \"\(sol.minWindow("ADOBECODEBANC", "ABC"))\"") // Expected: "BANC"

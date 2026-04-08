/**
 * Problem: Minimum Window Substring
 * Topic: String / SlidingWindow / MinWindowSubstring
 * 
 * Description:
 * Given two strings s and t of lengths m and n respectively, return 
 * the minimum window substring of s such that every character in t 
 * (including duplicates) is included in the window. 
 * If there is no such substring, return an empty string "".
 * 
 * Pattern: Variable Sliding Window. Maintain a frequency map of 
 * characters required from string t. Expand the window until all 
 * characters are found, then shrink it from the left to find 
 * the minimum length.
 * 
 * Time Complexity: O(m + n) where m and n are string lengths.
 * Space Complexity: O(k) for frequency maps.
 */

import Foundation

class Solution {
    /**
     * Finds the minimum window substring containing all characters of t.
     * - Parameters:
     *   - s: The source string.
     *   - t: The target characters to include.
     * - Returns: The minimum length window substring or an empty string.
     */
    func minWindow(_ s: String, _ t: String) -> String {
        if s.isEmpty || t.isEmpty { return "" }
        
        var targetMap: [Character: Int] = [:]
        for char in t {
            targetMap[char, default: 0] += 1
        }
        
        var windowMap: [Character: Int] = [:]
        var left = 0
        var right = 0
        var formed = 0
        let required = targetMap.count
        
        // pair: (length, leftIndex, rightIndex)
        var result = (-1, 0, 0)
        
        let chars = Array(s)
        while right < chars.count {
            let char = chars[right]
            windowMap[char, default: 0] += 1
            
            if let targetCount = targetMap[char], windowMap[char] == targetCount {
                formed += 1
            }
            
            // Try to shrink window from left until it's no longer valid
            while left <= right && formed == required {
                let currentLen = right - left + 1
                if result.0 == -1 || currentLen < result.0 {
                    result = (currentLen, left, right)
                }
                
                let leftChar = chars[left]
                windowMap[leftChar]! -= 1
                
                if let targetCount = targetMap[leftChar], windowMap[leftChar]! < targetCount {
                    formed -= 1
                }
                left += 1
            }
            
            right += 1
        }
        
        return result.0 == -1 ? "" : String(chars[result.1...result.2])
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min window for s=\"ADOBECODEBANC\", t=\"ABC\": \(sol.minWindow("ADOBECODEBANC", "ABC"))") // Expected: "BANC"
print("Min window for s=\"a\", t=\"a\": \(sol.minWindow("a", "a"))")                         // Expected: "a"
print("Min window for s=\"a\", t=\"aa\": \(sol.minWindow("a", "aa"))")                       // Expected: ""

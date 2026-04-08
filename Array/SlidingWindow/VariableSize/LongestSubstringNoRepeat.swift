/**
 * Problem: Longest Substring Without Repeating Characters
 * Topic: Array / Sliding Window / Variable Size
 * 
 * Description:
 * Given a string, find the length of the longest substring without repeating characters.
 * 
 * Time Complexity: O(n) where n is the length of the string.
 * Space Complexity: O(min(n, m)) where m is the character set size.
 */

import Foundation

class Solution {
    /**
     * Finds the length of the longest substring with no repeating characters.
     * - Parameters:
     *   - s: The input string.
     * - Returns: The length of the longest substring.
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var charMap = [Character: Int]() // Stores character and its last seen index
        let chars = Array(s)
        var i = 0
        
        for j in 0..<chars.count {
            // Expand window
            let char = chars[j]
            
            // If character is already in window, shrink window from left
            if let lastSeenIndex = charMap[char] {
                // Shrink window to the right of the last seen index of current character
                i = max(i, lastSeenIndex + 1)
            }
            
            // Update last seen index
            charMap[char] = j
            
            // Update maximum length
            maxLength = max(maxLength, j - i + 1)
        }
        
        return maxLength
    }
}

// --- Test Cases ---
let sol = Solution()
let testStr = "abcabcbb"
print("Longest Substring without repeating chars in \"\(testStr)\": \(sol.lengthOfLongestSubstring(testStr))") // Expected: 3 ("abc")

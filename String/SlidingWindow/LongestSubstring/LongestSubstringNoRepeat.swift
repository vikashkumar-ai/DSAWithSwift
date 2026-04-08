/**
 * Problem: Longest Substring Without Repeating Characters
 * Topic: String / Sliding Window / Longest Substring
 * 
 * Description:
 * Given a string s, find the length of the longest substring without repeating characters.
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
        var charMap = [Character: Int]() // Stores the last index of each character
        let chars = Array(s)
        var i = 0 // Left pointer of the window
        
        for j in 0..<chars.count {
            let char = chars[j]
            
            // If the character is already in our map and its index is inside the current window,
            // we move the left pointer past its last occurrence.
            if let lastIndex = charMap[char] {
                i = max(i, lastIndex + 1)
            }
            
            // Update the character's last seen index
            charMap[char] = j
            
            // Update the maximum length found so far
            maxLength = max(maxLength, j - i + 1)
        }
        
        return maxLength
    }
}

// --- Test Cases ---
let sol = Solution()
print("Longest Substring No Repeat for \"abcabcbb\": \(sol.lengthOfLongestSubstring("abcabcbb"))") // Expected: 3
print("Longest Substring No Repeat for \"bbbbb\": \(sol.lengthOfLongestSubstring("bbbbb"))")       // Expected: 1
print("Longest Substring No Repeat for \"pwwkew\": \(sol.lengthOfLongestSubstring("pwwkew"))")     // Expected: 3

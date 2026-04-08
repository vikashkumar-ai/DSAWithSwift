/**
 * Problem: Longest Repeating Character Replacement
 * Topic: String / SlidingWindow / LongestSubstring
 * 
 * Description:
 * You are given a string s and an integer k. You can choose any 
 * character of the string and change it to any other uppercase English 
 * character. You can perform this operation at most k times.
 * Return the length of the longest substring containing the same 
 * letter you can get after performing the above operations.
 * 
 * Pattern: Variable Sliding Window. Maintain a frequency map of 
 * characters within the window. The goal is to maximize window length 
 * L such that (L - maxFrequency) <= k.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1) for fixed English alphabet.
 */

import Foundation

class Solution {
    /**
     * Finds the length of the longest substring with character replacement.
     * - Parameters:
     *   - s: The input string.
     *   - k: Max replacements allowed.
     * - Returns: Length of the longest substring.
     */
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var count: [Character: Int] = [:]
        var maxFreq = 0
        var left = 0
        var result = 0
        
        let chars = Array(s)
        for right in 0..<chars.count {
            let char = chars[right]
            count[char, default: 0] += 1
            maxFreq = max(maxFreq, count[char]!)
            
            // Current window size = right - left + 1
            // If the current window has more than k non-dominant characters, 
            // the window is invalid. Shrink it from the left.
            if (right - left + 1) - maxFreq > k {
                count[chars[left]]! -= 1
                left += 1
            }
            
            result = max(result, right - left + 1)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max length for \"ABAB\" with k=2: \(sol.characterReplacement("ABAB", 2))") // Expected: 4
print("Max length for \"AABABBA\" with k=1: \(sol.characterReplacement("AABABBA", 1))") // Expected: 4

/**
 * Problem: Longest Substring with K Distinct Characters
 * Topic: Array / Sliding Window / Variable Size
 * 
 * Description:
 * Given a string, find the length of the longest substring in it with no more than k distinct characters.
 * 
 * Time Complexity: O(n) where n is the length of the string.
 * Space Complexity: O(k) for storing distinct characters in a frequency map.
 */

import Foundation

class Solution {
    /**
     * Finds the length of the longest substring with at most k distinct characters.
     * - Parameters:
     *   - s: The input string.
     *   - k: The maximum number of distinct characters allowed.
     * - Returns: The length of the longest substring.
     */
    func longestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        var maxLength = 0
        var charFreq = [Character: Int]()
        let chars = Array(s)
        var i = 0
        
        for j in 0..<chars.count {
            // Expand window
            charFreq[chars[j], default: 0] += 1
            
            // While characters in the window exceed k, shrink it from left
            while charFreq.count > k {
                charFreq[chars[i]]! -= 1
                if charFreq[chars[i]]! == 0 {
                    charFreq.removeValue(forKey: chars[i])
                }
                i += 1
            }
            
            // Update maximum length found
            maxLength = max(maxLength, j - i + 1)
        }
        
        return maxLength
    }
}

// --- Test Cases ---
let sol = Solution()
let testStr = "araaci"
let k = 2
print("Longest Substring with at most \(k) distinct chars in \"\(testStr)\": \(sol.longestSubstringKDistinct(testStr, k))") // Expected: 4 ("araa")

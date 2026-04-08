/**
 * Problem: First Unique Character in a String
 * Topic: HashMap / Frequency Based
 * 
 * Description:
 * Given a string s, find the first non-repeating character in it and 
 * return its index. If it does not exist, return -1.
 * 
 * Time Complexity: O(n) where n is length of the string.
 * Space Complexity: O(1) as we are only using a fixed-size frequency map.
 */

import Foundation

class Solution {
    /**
     * Finds the index of the first character that appears only once.
     * - Parameters:
     *   - s: The input string.
     * - Returns: Index of the first unique character or -1.
     */
    func firstUniqChar(_ s: String) -> Int {
        var charFrequency = [Character: Int]()
        let chars = Array(s)
        
        // Step 1: Count the frequency of each character
        for char in chars {
            charFrequency[char, default: 0] += 1
        }
        
        // Step 2: Iterate through the string again to find the first character with frequency 1
        for (index, char) in chars.enumerated() {
            if charFrequency[char] == 1 {
                return index
            }
        }
        
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
print("First Unique Character in \"leetcode\": \(sol.firstUniqChar("leetcode"))")     // Expected: 0
print("First Unique Character in \"loveleetcode\": \(sol.firstUniqChar("loveleetcode"))") // Expected: 2
print("First Unique Character in \"aabb\": \(sol.firstUniqChar("aabb"))")           // Expected: -1

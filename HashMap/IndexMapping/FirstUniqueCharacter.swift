/**
 * Problem: First Unique Character in a String
 * Topic: HashMap / IndexMapping
 * 
 * Description:
 * Given a string s, find the first non-repeating character in it 
 * and return its index. If it does not exist, return -1.
 * 
 * Pattern: Two-pass HashMap. In the first pass, count the frequency 
 * of each character. In the second pass, find the first character 
 * with a frequency of 1.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1) for fixed character set.
 */

import Foundation

class Solution {
    /**
     * Finds the index of the first non-repeating character.
     * - Parameters:
     *   - s: The input string.
     * - Returns: Index of the first unique character or -1.
     */
    func firstUniqChar(_ s: String) -> Int {
        var count = [Character: Int]()
        let chars = Array(s)
        
        // Step 1: Count freuqency
        for char in chars {
            count[char, default: 0] += 1
        }
        
        // Step 2: Find the first index with freq 1
        for (i, char) in chars.enumerated() {
            if count[char] == 1 {
                return i
            }
        }
        
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
print("First Unique in \"leetcode\": \(sol.firstUniqChar("leetcode"))")     // Expected: 0
print("First Unique in \"loveleetcode\": \(sol.firstUniqChar("loveleetcode"))") // Expected: 2
print("First Unique in \"aabb\": \(sol.firstUniqChar("aabb"))")           // Expected: -1

/**
 * Problem: Find All Anagrams in a String
 * Topic: String / Sliding Window / Anagram Permutation
 * 
 * Description:
 * Given two strings s and p, return an array of all the start indices of p's 
 * anagrams in s. An Anagram is a word or phrase formed by rearranging the 
 * letters of a different word or phrase, typically using all the original 
 * letters exactly once.
 * 
 * Time Complexity: O(n) where n is length of s.
 * Space Complexity: O(1) as frequency maps of size 26 or 256 are constant.
 */

import Foundation

class Solution {
    /**
     * Finds starting indices of all anagrams of p in s.
     * - Parameters:
     *   - s: The source string.
     *   - p: The pattern string.
     * - Returns: Array of starting indices.
     */
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count { return [] }
        
        var result = [Int]()
        var pFreq = [Character: Int]()
        var sFreq = [Character: Int]()
        
        let sChars = Array(s)
        let pChars = Array(p)
        
        // Initial frequency for p and first window of s
        for i in 0..<pChars.count {
            pFreq[pChars[i], default: 0] += 1
            sFreq[sChars[i], default: 0] += 1
        }
        
        // Check first window
        if sFreq == pFreq { result.append(0) }
        
        // Slide the window
        for j in pChars.count..<sChars.count {
            let leftChar = sChars[j - pChars.count]
            let rightChar = sChars[j]
            
            // Add current character to window
            sFreq[rightChar, default: 0] += 1
            
            // Remove the character that is now outside the window
            sFreq[leftChar]! -= 1
            if sFreq[leftChar]! == 0 {
                sFreq.removeValue(forKey: leftChar)
            }
            
            // Check if current window matches
            if sFreq == pFreq {
                result.append(j - pChars.count + 1)
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Anagrams of \"abc\" in \"cbaebabacd\": \(sol.findAnagrams("cbaebabacd", "abc"))") // Expected: [0, 6]

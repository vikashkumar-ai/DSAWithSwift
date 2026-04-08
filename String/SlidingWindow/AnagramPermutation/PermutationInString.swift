/**
 * Problem: Permutation in String
 * Topic: String / SlidingWindow / AnagramPermutation
 * 
 * Description:
 * Given two strings s1 and s2, return true if s2 contains a permutation 
 * of s1. 
 * In other words, one of s1's permutations is the substring of s2.
 * 
 * Pattern: Fixed-size Sliding Window. Maintain a frequency map of s1. 
 * As the window of size s1.count slides over s2, update the current 
 * window's frequency map and compare.
 * 
 * Time Complexity: O(n) where n is length of s2.
 * Space Complexity: O(1) for fixed character set.
 */

import Foundation

class Solution {
    /**
     * Checks if s2 contains any permutation of s1.
     * - Parameters:
     *   - s1: The string whose permutation is sought.
     *   - s2: The string to search in.
     * - Returns: A boolean value of true if a permutation is found.
     */
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let n1 = s1.count
        let n2 = s2.count
        
        if n1 > n2 { return false }
        
        let chars1 = Array(s1)
        let chars2 = Array(s2)
        
        var s1Freq = Array(repeating: 0, count: 26)
        var s2Freq = Array(repeating: 0, count: 26)
        
        func getIndex(_ char: Character) -> Int {
            return Int(char.asciiValue! - Character("a").asciiValue!)
        }
        
        // Initial window of size n1
        for i in 0..<n1 {
            s1Freq[getIndex(chars1[i])] += 1
            s2Freq[getIndex(chars2[i])] += 1
        }
        
        if s1Freq == s2Freq { return true }
        
        // Slide the window
        for i in n1..<n2 {
            // Include new character
            s2Freq[getIndex(chars2[i])] += 1
            // Exclude character from the left
            s2Freq[getIndex(chars2[i - n1])] -= 1
            
            if s1Freq == s2Freq { return true }
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
print("Does \"eidbaooo\" contain permutation of \"ab\": \(sol.checkInclusion("ab", "eidbaooo"))") // Expected: true
print("Does \"eidboaoo\" contain permutation of \"ab\": \(sol.checkInclusion("ab", "eidboaoo"))") // Expected: false

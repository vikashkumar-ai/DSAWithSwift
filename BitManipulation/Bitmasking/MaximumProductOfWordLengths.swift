/**
 * Problem: Maximum Product of Word Lengths (Bitmasking)
 * Topic: Bit Manipulation / Bitmasking
 * 
 * Description:
 * Given a string array words, return the maximum value of 
 * length(word[i]) * length(word[j]) where the two words do not share 
 * common letters. If no such two words exist, return 0.
 * 
 * Pattern: Bitmasking. For each word, create a 26-bit integer mask 
 * where the i-th bit is set if the word contains the i-th letter. 
 * Two words share no common letters if (mask[i] & mask[j]) == 0.
 * 
 * Time Complexity: O(n² + n * L) where n is word count and L average length.
 * Space Complexity: O(n) for masks.
 */

import Foundation

class Solution {
    /**
     * Calculates the maximum product of two words without common characters.
     * - Parameters:
     *   - words: Array of strings.
     * - Returns: Maximum product of lengths.
     */
    func maxProduct(_ words: [String]) -> Int {
        let n = words.count
        var masks = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            let chars = Array(words[i])
            for char in chars {
                let bit = Int(char.asciiValue! - Character("a").asciiValue!)
                masks[i] |= (1 << bit)
            }
        }
        
        var maxProd = 0
        for i in 0..<n {
            for j in i + 1..<n {
                // If there are no common letters
                if (masks[i] & masks[j]) == 0 {
                    maxProd = max(maxProd, words[i].count * words[j].count)
                }
            }
        }
        
        return maxProd
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max length product for [\"abcw\",\"baz\",\"foo\",\"bar\",\"xtfn\",\"abcdef\"]: \(sol.maxProduct(["abcw","baz","foo","bar","xtfn","abcdef"]))") 
// Expected: 16 ("abcw" and "xtfn")
print("Max length product for [\"a\",\"ab\",\"abc\",\"d\",\"cd\",\"bcd\",\"abcd\"]: \(sol.maxProduct(["a","ab","abc","d","cd","bcd","abcd"]))") 
// Expected: 4 ("ab" and "cd")

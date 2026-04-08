/**
 * Problem: Reverse Words in a String
 * Topic: String / Two Pointes / Reverse Words Characters
 * 
 * Description:
 * Given an input string s, reverse the order of the words. Return a string 
 * of the words in reverse order concatenated by a single space.
 * 
 * Time Complexity: O(n) where n is length of the string.
 * Space Complexity: O(n) for the intermediate character array.
 */

import Foundation

class Solution {
    /**
     * Reverses the words in a string.
     * - Parameters:
     *   - s: The input string.
     * - Returns: A string of words in reverse order.
     */
    func reverseWords(_ s: String) -> String {
        // Step 1: Trim whitespace from sides and split by spaces
        let words = s.split(whereSeparator: { $0.isWhitespace })
        
        // Step 2: Use two pointers to reverse the collection of words
        var wordsArray = Array(words)
        var left = 0
        var right = wordsArray.count - 1
        
        while left < right {
            (wordsArray[left], wordsArray[right]) = (wordsArray[right], wordsArray[left])
            left += 1
            right -= 1
        }
        
        // Step 3: Join the words with a single space
        return wordsArray.joined(separator: " ")
    }
}

// --- Test Cases ---
let sol = Solution()
print("Reverse Words for \"  the sky is blue  \": \"\(sol.reverseWords("  the sky is blue  "))\"") // Expected: "blue is sky the"
print("Reverse Words for \"hello world\": \"\(sol.reverseWords("hello world"))\"")              // Expected: "world hello"
print("Reverse Words for \"a good   example\": \"\(sol.reverseWords("a good   example"))\"")     // Expected: "example good a"

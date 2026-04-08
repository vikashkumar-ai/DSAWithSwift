/**
 * Problem: Reverse String
 * Topic: String / Two Pointes / Reverse Words Characters
 * 
 * Description:
 * Write a function that reverses a string. The input string is given as an array 
 * of characters s. Do this in-place with O(1) extra memory.
 * 
 * Time Complexity: O(n) where n is length of the string.
 * Space Complexity: O(1) as we are modifying the array in-place.
 */

import Foundation

class Solution {
    /**
     * Reverses a character array in-place using two pointers.
     * - Parameters:
     *   - s: Reference to the input character array.
     */
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        
        while left < right {
            // Swap characters at left and right
            (s[left], s[right]) = (s[right], s[left])
            
            // Move pointers inward
            left += 1
            right -= 1
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testChars: [Character] = ["h", "e", "l", "l", "o"]
sol.reverseString(&testChars)
print("Reversed ['h','e','l','l','o']: \(testChars)") // Expected: ["o", "l", "l", "e", "h"]

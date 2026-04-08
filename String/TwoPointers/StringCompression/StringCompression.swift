/**
 * Problem: String Compression
 * Topic: String / Two Pointes / String Compression
 * 
 * Description:
 * Given an array of characters chars, compress it using the following algorithm:
 * Begin with an empty string s. For each group of consecutive repeating 
 * characters in chars:
 * If the group's length is 1, append the character to s.
 * Otherwise, append the character followed by the group's length.
 * 
 * Time Complexity: O(n) where n is length of the character array.
 * Space Complexity: O(1) as we are modifying the array in-place.
 */

import Foundation

class Solution {
    /**
     * Compresses a character array in-place.
     * - Parameters:
     *   - chars: Reference to the input character array.
     * - Returns: The new length of the compressed array.
     */
    func compress(_ chars: inout [Character]) -> Int {
        var writer = 0 // Pointer to write the compressed characters
        var reader = 0 // Pointer to read the original characters
        
        while reader < chars.count {
            let char = chars[reader]
            var count = 0
            
            // Count consecutive repeating characters
            while reader < chars.count && chars[reader] == char {
                reader += 1
                count += 1
            }
            
            // Write the character
            chars[writer] = char
            writer += 1
            
            // If the count is greater than 1, write the digits of the count
            if count > 1 {
                for digit in String(count) {
                    chars[writer] = digit
                    writer += 1
                }
            }
        }
        
        return writer
    }
}

// --- Test Cases ---
let sol = Solution()
var testChars: [Character] = ["a", "a", "b", "b", "c", "c", "c"]
let newLen = sol.compress(&testChars)
print("Compressed \"aabbccc\": \"\(String(testChars.prefix(newLen)))\" result length \(newLen)") // Expected: "a2b2c3", 6

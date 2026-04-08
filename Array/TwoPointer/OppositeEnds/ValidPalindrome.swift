/**
 * Problem: Valid Palindrome
 * Topic: Array / Two Pointer / Opposite Ends
 * 
 * Description:
 * A phrase is a palindrome if, after converting all uppercase letters into lowercase letters 
 * and removing all non-alphanumeric characters, it reads the same forward and backward.
 * 
 * Time Complexity: O(n) where n is the length of the string.
 * Space Complexity: O(1) as we are only using two pointers.
 */

import Foundation

class Solution {
    /**
     * Determines whether a given string is a valid palindrome.
     * - Parameters:
     *   - s: The input string.
     * - Returns: A boolean value of true if the string is a palindrome.
     */
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s.lowercased())
        var left = 0
        var right = chars.count - 1
        
        while left < right {
            // Skip non-alphanumeric characters for left
            if !chars[left].isLetter && !chars[left].isNumber {
                left += 1
                continue
            }
            
            // Skip non-alphanumeric characters for right
            if !chars[right].isLetter && !chars[right].isNumber {
                right -= 1
                continue
            }
            
            // Characters mismatch
            if chars[left] != chars[right] {
                return false
            }
            
            // Move pointers inward
            left += 1
            right -= 1
        }
        
        return true
    }
}

// --- Test Cases ---
let sol = Solution()
let testStr = "A man, a plan, a canal: Panama"
print("Valid Palindrome \"\(testStr)\": \(sol.isPalindrome(testStr))") // Expected: true

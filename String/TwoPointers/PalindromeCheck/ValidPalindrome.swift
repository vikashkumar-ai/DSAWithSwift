/**
 * Problem: Valid Palindrome (Case-Insensitive & Alphanumeric)
 * Topic: String / Two Pointers / Palindrome Check
 * 
 * Description:
 * A phrase is a palindrome if, after converting all uppercase letters into 
 * lowercase letters and removing all non-alphanumeric characters, it reads 
 * the same forward and backward.
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
            // Move left pointer forward while current character is not alphanumeric
            if !isAlphanumeric(chars[left]) {
                left += 1
                continue
            }
            
            // Move right pointer backward while current character is not alphanumeric
            if !isAlphanumeric(chars[right]) {
                right -= 1
                continue
            }
            
            // If current alphanumeric characters mismatch
            if chars[left] != chars[right] {
                return false
            }
            
            // Move both pointers inward
            left += 1
            right -= 1
        }
        
        return true
    }
    
    /**
     * Helper to check if a character is alphanumeric.
     */
    private func isAlphanumeric(_ char: Character) -> Bool {
        return char.isLetter || char.isNumber
    }
}

// --- Test Cases ---
let sol = Solution()
print("Valid Palindrome \"A man, a plan, a canal: Panama\": \(sol.isPalindrome("A man, a plan, a canal: Panama"))") // Expected: true
print("Valid Palindrome \"race a car\": \(sol.isPalindrome("race a car"))") // Expected: false

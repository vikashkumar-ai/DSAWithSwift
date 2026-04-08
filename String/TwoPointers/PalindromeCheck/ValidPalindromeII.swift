/**
 * Problem: Valid Palindrome II (At most one deletion)
 * Topic: String / TwoPointers / PalindromeCheck
 * 
 * Description:
 * Given a string s, return true if the s can be palindrome after 
 * deleting at most one character from it.
 * 
 * Pattern: Two Pointers. Check for palindrome from both ends. 
 * If a mismatch occurs, try skipping the left character or the 
 * right character and check if the remaining substring is a palindrome.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Determines if a string can be a palindrome with <= 1 deletion.
     * - Parameters:
     *   - s: The source string.
     * - Returns: A boolean value of true if possible.
     */
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var left = 0
        var right = chars.count - 1
        
        while left < right {
            if chars[left] != chars[right] {
                // Try skipping the left character OR skipping the right character
                return isPalindrome(chars, left + 1, right) || isPalindrome(chars, left, right - 1)
            }
            left += 1
            right -= 1
        }
        
        return true
    }
    
    private func isPalindrome(_ chars: [Character], _ l: Int, _ r: Int) -> Bool {
        var left = l
        var right = r
        while left < right {
            if chars[left] != chars[right] { return false }
            left += 1
            right -= 1
        }
        return true
    }
}

// --- Test Cases ---
let sol = Solution()
print("Valid Palindrome II for \"abca\": \(sol.validPalindrome("abca"))") // Expected: true
print("Valid Palindrome II for \"aba\": \(sol.validPalindrome("aba"))")   // Expected: true
print("Valid Palindrome II for \"abc\": \(sol.validPalindrome("abc"))")   // Expected: false

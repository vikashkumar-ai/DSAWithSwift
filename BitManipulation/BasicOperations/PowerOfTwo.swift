/**
 * Problem: Power of Two
 * Topic: Bit Manipulation / Basic Operations
 * 
 * Description:
 * Given an integer n, return true if it is a power of two. 
 * An integer n is a power of two if there exists an integer x 
 * such that n == 2^x.
 * 
 * Pattern: A number that is a power of 2 has exactly one '1' bit 
 * in its binary representation. Thus n & (n - 1) should be 0.
 * 
 * Time Complexity: O(1).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Determines if a given integer is a power of two.
     * - Parameters:
     *   - n: The input integer.
     * - Returns: A boolean value of true if n is a power of two.
     */
    func isPowerOfTwo(_ n: Int) -> Bool {
        // Powers of two must be positive integers
        if n <= 0 { return false }
        
        // If n & (n - 1) is 0, it has exactly one bit set.
        return (n & (n - 1)) == 0
    }
}

// --- Test Cases ---
let sol = Solution()
print("Is 16 a power of 2: \(sol.isPowerOfTwo(16))") // Expected: true
print("Is 1 a power of 2:  \(sol.isPowerOfTwo(1))")  // Expected: true
print("Is 14 a power of 2: \(sol.isPowerOfTwo(14))") // Expected: false

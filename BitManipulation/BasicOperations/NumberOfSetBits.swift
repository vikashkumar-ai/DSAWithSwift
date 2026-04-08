/**
 * Problem: Number of 1 Bits (Hamming Weight)
 * Topic: Bit Manipulation / Basic Operations
 * 
 * Description:
 * Write a function that takes an unsigned integer and returns the 
 * number of '1' bits it has (also known as the Hamming weight).
 * 
 * Pattern: Use n & (n - 1) to unset the rightmost set bit in each iteration.
 * 
 * Time Complexity: O(k) where k is the number of set bits.
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Counts the number of set bits (1s) in a 32-bit integer.
     * - Parameters:
     *   - n: The input integer.
     * - Returns: The count of set bits.
     */
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var num = n
        
        while num != 0 {
            // Unsets the rightmost set bit
            num &= (num - 1)
            count += 1
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
print("Number of set bits in 11 (1011): \(sol.hammingWeight(11))") // Expected: 3
print("Number of set bits in 128 (10000000): \(sol.hammingWeight(128))") // Expected: 1

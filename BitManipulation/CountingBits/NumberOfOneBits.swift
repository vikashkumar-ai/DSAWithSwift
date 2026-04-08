/**
 * Problem: Number of 1 Bits (Hamming Weight)
 * Topic: Bit Manipulation / CountingBits
 * 
 * Description:
 * Write a function that takes an unsigned integer and returns the 
 * number of '1' bits it has (also known as the Hamming weight).
 * 
 * Pattern: Brian Kernighan’s Algorithm. Repeatedly flip the 
 * least significant set bit to 0 (n = n & (n-1)) and increment 
 * a counter until n becomes 0.
 * 
 * Time Complexity: O(k) where k is number of set bits.
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Calculates the number of set bits in an integer.
     * - Parameters:
     *   - n: Input integer.
     * - Returns: Hamming weight.
     */
    func hammingWeight(_ n: Int) -> Int {
        var num = n
        var count = 0
        while num != 0 {
            num &= (num - 1) // Clears the lowest set bit
            count += 1
        }
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
print("Hamming Weight of 11 (1011): \(sol.hammingWeight(11))") // Expected: 3
print("Hamming Weight of 128 (10000000): \(sol.hammingWeight(128))") // Expected: 1

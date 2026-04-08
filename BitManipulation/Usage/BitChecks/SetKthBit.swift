/**
 * Problem: Set Kth Bit
 * Topic: Bit Manipulation / Usage / BitChecks
 * 
 * Description:
 * Given a number n and a bit position k, set the kth bit 
 * to 1. Leave all other bits unchanged.
 * 
 * Pattern: Left shift 1 by k and use the bitwise OR operator.
 * 
 * Time Complexity: O(1).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Sets the k-th bit. (0-indexed)
     * - Parameters:
     *   - n: Input number.
     *   - k: Target bit index.
     * - Returns: Modified number.
     */
    func setKthBit(_ n: Int, _ k: Int) -> Int {
        return n | (1 << k)
    }
}

// --- Test Cases ---
let sol = Solution()
print("Set bit 1 in 4 (100): \(sol.setKthBit(4, 1))") // Expected: 6 (110)
print("Set bit 0 in 10 (1010): \(sol.setKthBit(10, 0))") // Expected: 11 (1011)

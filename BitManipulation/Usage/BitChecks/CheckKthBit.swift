/**
 * Problem: Check if Kth Bit is Set
 * Topic: Bit Manipulation / Usage / BitChecks
 * 
 * Description:
 * Given a number n and a bit position k, check if the kth 
 * bit is set (1) or not (0).
 * 
 * Pattern: Left shift 1 by k or right shift n by k. Use the 
 * bitwise AND operator to check the value.
 * 
 * Time Complexity: O(1).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Checks if k-th bit is set. (0-indexed)
     * - Parameters:
     *   - n: Input number.
     *   - k: Path index.
     * - Returns: Boolean value of true if set.
     */
    func checkKthBit(_ n: Int, _ k: Int) -> Bool {
        return (n & (1 << k)) != 0
    }
}

// --- Test Cases ---
let sol = Solution()
print("Check bit 1 in 4 (100): \(sol.checkKthBit(4, 1))") // Expected: false
print("Check bit 2 in 4 (100): \(sol.checkKthBit(4, 2))") // Expected: true
print("Check bit 0 in 5 (101): \(sol.checkKthBit(5, 0))") // Expected: true

/**
 * Problem: Counting Bits
 * Topic: Bit Manipulation / Counting Bits
 * 
 * Description:
 * Given an integer n, return an array ans of length n + 1 such that for 
 * each i (0 <= i <= n), ans[i] is the number of 1 bits in the binary 
 * representation of i.
 * 
 * Pattern: DP with Bit Manipulation. The number of set bits for i is 
 * (number of set bits for i >> 1) + (i & 1).
 * 
 * Time Complexity: O(n) where n is input integer.
 * Space Complexity: O(n) to store the result.
 */

import Foundation

class Solution {
    /**
     * Calculates the number of 1 bits for every integer from 0 to n.
     * - Parameters:
     *   - n: The upper bound of the integers.
     * - Returns: An integer array with bit counts.
     */
    func countBits(_ n: Int) -> [Int] {
        var ans = Array(repeating: 0, count: n + 1)
        
        // Base case: ans[0] = 0
        for i in (0...n) {
            if i == 0 { continue }
            // Number of bits for i is bits for i/2 + current last bit
            ans[i] = ans[i >> 1] + (i & 1)
        }
        
        return ans
    }
}

// --- Test Cases ---
let sol = Solution()
print("Counting bits for n=2: \(sol.countBits(2))") // Expected: [0, 1, 1]
print("Counting bits for n=5: \(sol.countBits(5))") // Expected: [0, 1, 1, 2, 1, 2]

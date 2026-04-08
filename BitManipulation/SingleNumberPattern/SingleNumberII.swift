/**
 * Problem: Single Number II
 * Topic: Bit Manipulation / Single Number Pattern
 * 
 * Description:
 * Given an integer array nums where every element appears three times 
 * except for one, which appears exactly once. 
 * Find the single element and return it.
 * 
 * Pattern: Count bits at each position. For each position i from 0 to 31, 
 * count how many numbers have the i-th bit set. 
 * The single element's i-th bit will be (count % 3).
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Finds the element that appears only once in an array where 
     * others appear three times.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: The single number found.
     */
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        
        // Check each bit position (assuming 32-bit integers)
        for i in 0..<32 {
            var bitCount = 0
            let mask = 1 << i
            
            for num in nums {
                if (num & mask) != 0 {
                    bitCount += 1
                }
            }
            
            // If bit count is not a multiple of 3, the single element 
            // has this bit set.
            if bitCount % 3 != 0 {
                result |= mask
            }
        }
        
        // Handle negative numbers if testing on platform with signed ints
        return Int(Int32(truncatingIfNeeded: result))
    }
}

// --- Test Cases ---
let sol = Solution()
print("Single Number in [2, 2, 3, 2]: \(sol.singleNumber([2, 2, 3, 2]))") // Expected: 3
print("Single Number in [0, 1, 0, 1, 0, 1, 99]: \(sol.singleNumber([0, 1, 0, 1, 0, 1, 99]))") // Expected: 99
print("Single Number in [-2, -2, 1, -2]: \(sol.singleNumber([-2, -2, 1, -2]))") // Expected: 1

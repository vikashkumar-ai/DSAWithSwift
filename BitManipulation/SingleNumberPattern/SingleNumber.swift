/**
 * Problem: Single Number
 * Topic: Bit Manipulation / Single Number Pattern
 * 
 * Description:
 * Given a non-empty array of integers nums, every element appears 
 * twice except for one. Find that single one.
 * You must implement a solution with a linear runtime complexity 
 * and use only constant extra space.
 * 
 * Pattern: Use XOR properties: $a \wedge a = 0$ and $a \wedge 0 = a$.
 * 
 * Time Complexity: O(n) where n is length of the array.
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Finds the element that appears only once in an array where 
     * others appear twice.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: The single number found.
     */
    func singleNumber(_ nums: [Int]) -> Int {
        var xorSum = 0
        
        // XORing all elements together will leave only the single element
        for num in nums {
            xorSum ^= num
        }
        
        return xorSum
    }
}

// --- Test Cases ---
let sol = Solution()
print("Single Number in [2, 2, 1]: \(sol.singleNumber([2, 2, 1]))") // Expected: 1
print("Single Number in [4, 1, 2, 1, 2]: \(sol.singleNumber([4, 1, 2, 1, 2]))") // Expected: 4
print("Single Number in [1]: \(sol.singleNumber([1]))") // Expected: 1

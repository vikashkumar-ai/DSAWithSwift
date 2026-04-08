/**
 * Problem: Maximum XOR Subset
 * Topic: Bit Manipulation / Usage / PrefixXOR
 * 
 * Description:
 * Given an array of integers, find the maximum XOR sum of 
 * any subset.
 * 
 * Pattern: Gaussian Elimination (Linear Basis). Use a basis array 
 * of size 64 (for 64-bit integers) and for each number, try to 
 * represent it as an XOR combination of the basis.
 * 
 * Time Complexity: O(N * 64).
 * Space Complexity: O(64).
 */

import Foundation

class Solution {
    /**
     * Calculates the maximum XOR sum for any subset.
     * - Parameters:
     *   - nums: Input integer array.
     * - Returns: Maximum XOR sum.
     */
    func maxXorSubset(_ nums: [Int]) -> Int {
        var basis = Array(repeating: 0, count: 64)
        
        for num in nums {
            var temp = num
            for i in (0..<64).reversed() {
                if (temp >> i) & 1 == 0 { continue }
                
                if basis[i] == 0 {
                    basis[i] = temp
                    break
                }
                
                temp ^= basis[i]
            }
        }
        
        var maxXor = 0
        for i in (0..<64).reversed() {
            if (maxXor ^ basis[i]) > maxXor {
                maxXor ^= basis[i]
            }
        }
        
        return maxXor
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max XOR Subset for [2, 4, 5]: \(sol.maxXorSubset([2, 4, 5]))") // Expected: 7 (2 ^ 5 or 4 ^ 5 ^ 2?)
print("Max XOR Subset for [9, 8, 5]: \(sol.maxXorSubset([9, 8, 5]))") // Expected: 13 (8 ^ 5)

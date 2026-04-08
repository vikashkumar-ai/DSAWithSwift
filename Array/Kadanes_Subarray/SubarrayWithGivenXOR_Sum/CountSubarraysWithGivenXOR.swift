/**
 * Problem: Count Subarrays with Given XOR
 * Topic: Array / Kadanes_Subarray / SubarrayWithGivenXOR_Sum
 * 
 * Description:
 * Given an array of integers A and an integer B, find the total number 
 * of subarrays having bitwise XOR of all elements equal to B.
 * 
 * Pattern: Use a hash map to store prefix XOR frequencies. 
 * If current_XOR ^ Target = Prefix_XOR, it means there exists a 
 * subarray ending at the current index with XOR sum equal to Target.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the total number of subarrays whose XOR sum is equal to b.
     * - Parameters:
     *   - a: The input integer array.
     *   - b: The target XOR sum.
     * - Returns: Total count of subarrays.
     */
    func solve(_ a: [Int], _ b: Int) -> Int {
        var count = 0
        var currentXor = 0
        // Key: prefix XOR, Value: frequency
        var xorFrequencies: [Int: Int] = [0: 1]
        
        for num in a {
            currentXor ^= num
            
            // X ^ Target = Y  =>  X ^ Y = Target
            let targetXor = currentXor ^ b
            
            if let freq = xorFrequencies[targetXor] {
                count += freq
            }
            
            // Update currentXor frequency
            xorFrequencies[currentXor, default: 0] += 1
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
print("Subarrays with XOR sum 6 in [4, 2, 2, 6, 4]: \(sol.solve([4, 2, 2, 6, 4], 6))") // Expected: 4
print("Subarrays with XOR sum 1 in [5, 6, 7, 8, 9]: \(sol.solve([5, 6, 7, 8, 9], 1))") // Expected: 2

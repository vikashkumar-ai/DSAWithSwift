/**
 * Problem: Subarray with Given Sum K (Optimized)
 * Topic: Array / Kadane's / Subarray with sum K
 * 
 * Description:
 * Given an array of integers and a target sum k, return true if there exists 
 * a contiguous subarray whose sum is equal to k.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(n) using a hash set for prefix sums.
 */

import Foundation

class Solution {
    /**
     * Finds if a subarray with sum k exists using Prefix Sum and Hash Set.
     * - Parameters:
     *   - nums: The input integer array.
     *   - k: The target sum.
     * - Returns: A boolean value of true if such a subarray exists.
     */
    func hasSubarrayWithSum(_ nums: [Int], _ k: Int) -> Bool {
        var currentSum = 0
        var prefixSums = Set<Int>()
        prefixSums.insert(0) // Handle cases where currentSum itself equals k
        
        for num in nums {
            currentSum += num
            
            // If (currentSum - k) exists in prefixSums, we found a subarray
            if prefixSums.contains(currentSum - k) {
                return true
            }
            
            // Insert current prefix sum into the set
            prefixSums.insert(currentSum)
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [10, 2, -2, -20, 10]
let k = -10
print("Has Subarray with sum \(k) in \(testArr): \(sol.hasSubarrayWithSum(testArr, k))") // Expected: true ([2, -2, -20, 10])

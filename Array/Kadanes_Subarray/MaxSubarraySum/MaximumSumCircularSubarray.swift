/**
 * Problem: Maximum Sum Circular Subarray
 * Topic: Array / Kadanes_Subarray / MaxSubarraySum
 * 
 * Description:
 * Given a circular integer array nums of length n, return the maximum 
 * possible sum of a non-empty subarray of nums. 
 * A circular array means the end of the array connects to the beginning 
 * of the array.
 * 
 * Pattern: Modified Kadane's. The max circular subarray sum is either:
 * 1. The maximum subarray sum found by standard Kadane's.
 * 2. Total Sum - Minimum subarray sum (representing the wrapped-around 
 * max sum).
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Finds the maximum subarray sum in a circular array.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: Maximum subarray sum.
     */
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var totalSum = 0
        var maxEnd = 0
        var maxSoFar = Int.min
        var minEnd = 0
        var minSoFar = Int.max
        
        for num in nums {
            totalSum += num
            
            // Standard Kadane's for Maximum Subarray
            maxEnd = max(num, maxEnd + num)
            maxSoFar = max(maxSoFar, maxEnd)
            
            // Standard Kadane's for Minimum Subarray
            minEnd = min(num, minEnd + num)
            minSoFar = min(minSoFar, minEnd)
        }
        
        // If all numbers are negative, maxSoFar is the answer.
        if maxSoFar < 0 {
            return maxSoFar
        }
        
        let circularMax = totalSum - minSoFar
        return max(maxSoFar, circularMax)
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max Circular Sum for [1, -2, 3, -2]: \(sol.maxSubarraySumCircular([1, -2, 3, -2]))") // Expected: 3
print("Max Circular Sum for [5, -3, 5]: \(sol.maxSubarraySumCircular([5, -3, 5]))")       // Expected: 10
print("Max Circular Sum for [-3, -2, -3]: \(sol.maxSubarraySumCircular([-3, -2, -3]))")    // Expected: -2

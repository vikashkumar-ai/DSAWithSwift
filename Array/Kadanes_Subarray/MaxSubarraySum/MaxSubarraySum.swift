/**
 * Problem: Maximum Subarray Sum (Kadane's Algorithm)
 * Topic: Array / Kadane's / Max Subarray Sum
 * 
 * Description:
 * Given an integer array nums, find the contiguous subarray (containing at least one number) 
 * which has the largest sum and return its sum.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(1) as we are only using two variables for tracking.
 */

import Foundation

class Solution {
    /**
     * Finds the maximum sum of a contiguous subarray using Kadane's Algorithm.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: The maximum sum found.
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        var currentSum = nums[0]
        var maxSum = nums[0]
        
        for i in 1..<nums.count {
            // currentSum at index i is either nums[i] or (currentSum at i-1 + nums[i])
            currentSum = max(nums[i], currentSum + nums[i])
            
            // Update maxSum with the maximum encountered currentSum
            maxSum = max(maxSum, currentSum)
        }
        
        return maxSum
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
print("Maximum Subarray Sum for [-2, 1, -3, 4, -1, 2, 1, -5, 4]: \(sol.maxSubArray(testArr))") // Expected: 6 ([4, -1, 2, 1])

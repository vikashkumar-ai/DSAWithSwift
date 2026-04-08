/**
 * Problem: Maximum Product Subarray
 * Topic: Array / Kadane's / Max Product Subarray
 * 
 * Description:
 * Given an integer array nums, find the contiguous subarray that has 
 * the largest product and return its product.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(1) as we are only using two variables for tracking.
 */

import Foundation

class Solution {
    /**
     * Finds the maximum product of a contiguous subarray.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: The maximum product found.
     */
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        var maxProd = nums[0]
        var minProd = nums[0]
        var result = nums[0]
        
        for i in 1..<nums.count {
            // If current number is negative, swap maxProd and minProd
            if nums[i] < 0 {
                (maxProd, minProd) = (minProd, maxProd)
            }
            
            // maxProd at index i = max(nums[i], maxProd * nums[i])
            maxProd = max(nums[i], maxProd * nums[i])
            // minProd at index i = min(nums[i], minProd * nums[i])
            minProd = min(nums[i], minProd * nums[i])
            
            // Result is maximum of maxProd encountered
            result = max(result, maxProd)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [2, 3, -2, 4]
print("Maximum Product Subarray for [2, 3, -2, 4]: \(sol.maxProduct(testArr))") // Expected: 6 ([2, 3])

/**
 * Problem: Maximum Product Subarray
 * Topic: Array / Kadanes_Subarray / MaxProductSubarray
 * 
 * Description:
 * Given an integer array nums, find a contiguous non-empty subarray within 
 * the array that has the largest product, and return the product.
 * 
 * Pattern: Modified Kadane's. Since negative numbers flip signs, 
 * we must track both the maximum product and the minimum product 
 * ending at the current index.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1).
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
        
        var maxSoFar = nums[0]
        var minSoFar = nums[0]
        var result = nums[0]
        
        for i in 1..<nums.count {
            let n = nums[i]
            
            // Swap if current number is negative
            if n < 0 {
                swap(&maxSoFar, &minSoFar)
            }
            
            // At each step, either the current number is the start of a 
            // new subarray product or it's an extension of the previous one.
            maxSoFar = max(n, maxSoFar * n)
            minSoFar = min(n, minSoFar * n)
            
            result = max(result, maxSoFar)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max Product for [2, 3, -2, 4]: \(sol.maxProduct([2, 3, -2, 4]))") // Expected: 6
print("Max Product for [-2, 0, -1]: \(sol.maxProduct([-2, 0, -1]))")     // Expected: 0
print("Max Product for [-2, 3, -4]: \(sol.maxProduct([-2, 3, -4]))")     // Expected: 24

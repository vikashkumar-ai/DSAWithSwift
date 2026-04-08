/**
 * Problem: Maximum Sum Subarray of Size K
 * Topic: Array / Sliding Window / Fixed Size
 * 
 * Description:
 * Given an array of integers and a number k, find the maximum sum of a subarray of size k.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(1) as we are only using a few variables for tracking.
 */

import Foundation

class Solution {
    /**
     * Finds the maximum sum of any contiguous subarray of size k.
     * - Parameters:
     *   - arr: The input array of integers.
     *   - k: The size of the window.
     * - Returns: The maximum sum found.
     */
    func maxSumSubarray(_ arr: [Int], _ k: Int) -> Int {
        var maxSum = 0
        var windowSum = 0
        var i = 0
        var j = 0
        
        while j < arr.count {
            // Add current element to window sum
            windowSum += arr[j]
            
            // If window size is less than k, just increase j
            if j - i + 1 < k {
                j += 1
            } 
            // Once window size reaches k
            else if j - i + 1 == k {
                // Update maxSum
                maxSum = max(maxSum, windowSum)
                
                // Subtract the element going out of window
                windowSum -= arr[i]
                
                // Slide the window
                i += 1
                j += 1
            }
        }
        
        return maxSum
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [2, 1, 5, 1, 3, 2]
let k = 3
print("Max Sum Subarray of size \(k) in \(testArr): \(sol.maxSumSubarray(testArr, k))") // Expected: 9 (5+1+3)

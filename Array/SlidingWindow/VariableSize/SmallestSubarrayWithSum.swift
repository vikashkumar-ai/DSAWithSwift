/**
 * Problem: Smallest Subarray Length with Sum >= Target
 * Topic: Array / Sliding Window / Variable Size
 * 
 * Description:
 * Given an array of positive integers and a number target, find the length of the smallest contiguous subarray whose sum is greater than or equal to target. Return 0 if no such subarray exists.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(1) as we are only using a few variables for tracking.
 */

import Foundation

class Solution {
    /**
     * Finds the length of the smallest contiguous subarray whose sum is >= target.
     * - Parameters:
     *   - arr: The input array of integers.
     *   - target: The target sum.
     * - Returns: The length of the smallest subarray found.
     */
    func smallestSubarrayLength(_ arr: [Int], _ target: Int) -> Int {
        var minLength = Int.max
        var windowSum = 0
        var i = 0
        var j = 0
        
        while j < arr.count {
            // Expand the window
            windowSum += arr[j]
            
            // While current window sum exceeds target, try shrinking the window from left
            while windowSum >= target {
                minLength = min(minLength, j - i + 1)
                windowSum -= arr[i]
                i += 1
            }
            
            // Expand further
            j += 1
        }
        
        return minLength == Int.max ? 0 : minLength
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [2, 1, 5, 2, 3, 2]
let target = 7
print("Smallest Subarray length with sum >= \(target) in \(testArr): \(sol.smallestSubarrayLength(testArr, target))") // Expected: 2 ([5, 2])

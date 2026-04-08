/**
 * Problem: Subarray Sum Equals K
 * Topic: Array / Prefix Based / Prefix Sum
 * 
 * Description:
 * Given an array of integers nums and an integer k, return the total number
 * of subarrays whose sum equals to k.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(n) for the hash map to store prefix sums frequency.
 */

import Foundation

class Solution {
    /**
     * Finds the number of subarrays with sum equal to k.
     * - Parameters:
     *   - nums: The input integer array.
     *   - k: The target sum.
     * - Returns: Count of subarrays whose sum is k.
     */
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var currentSum = 0
        var sumFrequency = [0: 1] // Initial state for sum = 0 found once
        
        for num in nums {
            currentSum += num
            
            // Check if (currentSum - k) exists in our hash map
            // If currentSum - X = k, then X = currentSum - k
            if let occurrences = sumFrequency[currentSum - k] {
                count += occurrences
            }
            
            // Increment the currentSum frequency in the hash map
            sumFrequency[currentSum, default: 0] += 1
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [1, 2, 3]
let k = 3
print("Count of Subarrays with sum \(k) in \(testArr): \(sol.subarraySum(testArr, k))") // Expected: 2 ([1, 2] and [3])

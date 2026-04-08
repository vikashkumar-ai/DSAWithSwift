/**
 * Problem: Subarray Sum Equals K
 * Topic: Array / Kadanes_Subarray / SubarrayWithGivenXOR_Sum
 * 
 * Description:
 * Given an array of integers nums and an integer k, return the total 
 * number of continuous subarrays whose sum equals to k.
 * 
 * Pattern: Use a hash map to store the cumulative sum (prefix sum) 
 * frequencies. If (currentSum - k) exists in the map, it means there's 
 * a subarray ending here that sums to k.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n) for the frequency map.
 */

import Foundation

class Solution {
    /**
     * Finds the total number of subarrays whose sum is equal to k.
     * - Parameters:
     *   - nums: The input integer array.
     *   - k: The target sum.
     * - Returns: Total count of subarrays.
     */
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var currentSum = 0
        // Key: prefix sum, Value: frequency of that sum
        var sumFrequencies: [Int: Int] = [0: 1]
        
        for num in nums {
            currentSum += num
            
            // Check if sum - k exists
            if let freq = sumFrequencies[currentSum - k] {
                count += freq
            }
            
            // Update currentSum frequency
            sumFrequencies[currentSum, default: 0] += 1
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
print("Subarrays summing to 2 in [1, 1, 1]: \(sol.subarraySum([1, 1, 1], 2))") // Expected: 2 ([1,1] at index 0,1 and 1,2)
print("Subarrays summing to 3 in [1, 2, 3]: \(sol.subarraySum([1, 2, 3], 3))") // Expected: 2 ([1,2] and [3])

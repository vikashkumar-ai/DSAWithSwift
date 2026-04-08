/**
 * Problem: Maximum Gap (using Radix Sort Pattern)
 * Topic: Sorting Algorithms / RadixSort
 * 
 * Description:
 * Given an integer array nums, return the maximum difference between 
 * two successive elements in its sorted form. If the array contains 
 * less than two elements, return 0.
 * You must write an algorithm that runs in linear time and uses 
 * linear extra space.
 * 
 * Pattern: Radix Sort or Bucket Sort. The problem can be solved by 
 * placing numbers into n-1 buckets and finding the maximum difference 
 * between the minimum of one bucket and the maximum of the previous 
 * non-empty bucket.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the maximum gap between elements in sorted form.
     * - Parameters:
     *   - nums: Input integer array.
     * - Returns: The maximum gap found.
     */
    func maximumGap(_ nums: [Int]) -> Int {
        let n = nums.count
        if n < 2 { return 0 }
        
        let minVal = nums.min() ?? 0
        let maxVal = nums.max() ?? 0
        
        if minVal == maxVal { return 0 }
        
        // n elements, n-1 buckets
        let bucketSize = max(1, (maxVal - minVal) / (n - 1))
        let bucketCount = (maxVal - minVal) / bucketSize + 1
        
        var bucketMins = Array(repeating: Int.max, count: bucketCount)
        var bucketMaxs = Array(repeating: Int.min, count: bucketCount)
        var bucketFilled = Array(repeating: false, count: bucketCount)
        
        for num in nums {
            let idx = (num - minVal) / bucketSize
            bucketMins[idx] = min(bucketMins[idx], num)
            bucketMaxs[idx] = max(bucketMaxs[idx], num)
            bucketFilled[idx] = true
        }
        
        var maxGap = 0
        var prevMax = minVal
        
        for i in 0..<bucketCount {
            if !bucketFilled[i] { continue }
            
            // Gap is between current bucket's minimum and previous bucket's maximum
            maxGap = max(maxGap, bucketMins[i] - prevMax)
            prevMax = bucketMaxs[i]
        }
        
        return maxGap
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max Gap in [3, 6, 9, 1]: \(sol.maximumGap([3, 6, 9, 1]))") // Expected: 3
print("Max Gap in [10]:       \(sol.maximumGap([10]))")       // Expected: 0

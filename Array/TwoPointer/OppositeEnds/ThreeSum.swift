/**
 * Problem: 3Sum
 * Topic: Array / Two Pointer / Opposite Ends
 * 
 * Description:
 * Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] 
 * such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
 * 
 * Time Complexity: O(n²) where n is the length of the array.
 * Space Complexity: O(log n) or O(n) depending on the sorting algorithm.
 */

import Foundation

class Solution {
    /**
     * Finds all unique triplets that sum to zero.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: A 2D array of unique triplets.
     */
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var sortedNums = nums.sorted()
        
        for i in 0..<sortedNums.count {
            // Skip duplicate elements for the first position
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            
            // Use Two Pointer (Opposite Ends) for the remaining two sum
            var left = i + 1
            var right = sortedNums.count - 1
            let target = -sortedNums[i]
            
            while left < right {
                let currentSum = sortedNums[left] + sortedNums[right]
                
                if currentSum == target {
                    result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                    
                    // Skip duplicates for left
                    while left < right && sortedNums[left] == sortedNums[left + 1] {
                        left += 1
                    }
                    
                    // Skip duplicates for right
                    while left < right && sortedNums[right] == sortedNums[right - 1] {
                        right -= 1
                    }
                    
                    // Move both pointers
                    left += 1
                    right -= 1
                } else if currentSum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [-1, 0, 1, 2, -1, -4]
print("3Sum All Unique Triplets for \(testArr): \(sol.threeSum(testArr))") // Expected: [[-1, -1, 2], [-1, 0, 1]]

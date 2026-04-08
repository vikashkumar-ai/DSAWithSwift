/**
 * Problem: Median of Two Sorted Arrays (Divide and Conquer)
 * Topic: Recursion / Divide_Conquer
 * 
 * Description:
 * Given two sorted arrays nums1 and nums2 of size m and n 
 * respectively, return the median of the two sorted arrays.
 * The overall run time complexity should be O(log (m+n)).
 * 
 * Pattern: Binary Search / Divide and Conquer on the smaller array. 
 * Find a partition point such that elements on the left side of 
 * both arrays are smaller than elements on the right side.
 * 
 * Time Complexity: O(log(min(m, n))).
 * Space Complexity: O(1) iterative.
 */

import Foundation

class Solution {
    /**
     * Finds the median of two sorted arrays.
     * - Parameters:
     *   - nums1: First sorted array.
     *   - nums2: Second sorted array.
     * - Returns: Median value.
     */
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // Ensure nums1 is the smaller array
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let m = nums1.count
        let n = nums2.count
        var low = 0
        var high = m
        
        while low <= high {
            let partitionX = (low + high) / 2
            let partitionY = (m + n + 1) / 2 - partitionX
            
            let maxLeftX = (partitionX == 0) ? Int.min : nums1[partitionX - 1]
            let minRightX = (partitionX == m) ? Int.max : nums1[partitionX]
            
            let maxLeftY = (partitionY == 0) ? Int.min : nums2[partitionY - 1]
            let minRightY = (partitionY == n) ? Int.max : nums2[partitionY]
            
            if maxLeftX <= minRightY && maxLeftY <= minRightX {
                if (m + n) % 2 == 0 {
                    return Double(max(maxLeftX, maxLeftY) + min(minRightX, minRightY)) / 2.0
                } else {
                    return Double(max(maxLeftX, maxLeftY))
                }
            } else if maxLeftX > minRightY {
                high = partitionX - 1
            } else {
                low = partitionX + 1
            }
        }
        
        return 0.0
    }
}

// --- Test Cases ---
let sol = Solution()
print("Median of [1, 3] and [2]: \(sol.findMedianSortedArrays([1, 3], [2]))") 
// Expected: 2.0
print("Median of [1, 2] and [3, 4]: \(sol.findMedianSortedArrays([1, 2], [3, 4]))")
// Expected: 2.5

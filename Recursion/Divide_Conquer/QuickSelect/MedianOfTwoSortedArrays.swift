/**
 * Problem: Median of Two Sorted Arrays (Divide & Conquer)
 * Topic: Recursion / Divide_Conquer / QuickSelect
 * 
 * Description:
 * Given two sorted arrays nums1 and nums2 of size m and n respectively, 
 * return the median of the two sorted arrays.
 * 
 * Pattern: Binary Search / Divide & Conquer on indices. Instead of 
 * merging, we find the kth element among two sorted arrays by 
 * comparing their middle elements.
 * 
 * Time Complexity: O(log(min(m, n))).
 * Space Complexity: O(log(min(m, n))) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Finds the median of two sorted arrays.
     * - Parameters:
     *   - nums1: First sorted array.
     *   - nums2: Second sorted array.
     * - Returns: The median value.
     */
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let totalCount = nums1.count + nums2.count
        
        if totalCount % 2 == 1 {
            // Odd total count: find the exact middle element
            return Double(findKth(nums1, 0, nums2, 0, totalCount / 2 + 1))
        } else {
            // Even total count: average of two middle elements
            let left = findKth(nums1, 0, nums2, 0, totalCount / 2)
            let right = findKth(nums1, 0, nums2, 0, totalCount / 2 + 1)
            return Double(left + right) / 2.0
        }
    }
    
    /**
     * Helper to find the kth smallest element in two sorted arrays.
     */
    private func findKth(_ nums1: [Int], _ start1: Int, _ nums2: [Int], _ start2: Int, _ k: Int) -> Int {
        // Base case: if one array is empty
        if start1 >= nums1.count { return nums2[start2 + k - 1] }
        if start2 >= nums2.count { return nums1[start1 + k - 1] }
        if k == 1 { return min(nums1[start1], nums2[start2]) }
        
        // Pick the (k/2)-th elements for comparison
        let mid1 = start1 + k/2 - 1 < nums1.count ? nums1[start1 + k/2 - 1] : Int.max
        let mid2 = start2 + k/2 - 1 < nums2.count ? nums2[start2 + k/2 - 1] : Int.max
        
        if mid1 < mid2 {
            // Discard the first k/2 elements of nums1
            return findKth(nums1, start1 + k/2, nums2, start2, k - k/2)
        } else {
            // Discard the first k/2 elements of nums2
            return findKth(nums1, start1, nums2, start2 + k/2, k - k/2)
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Median of [1, 3] and [2]: \(sol.findMedianSortedArrays([1, 3], [2]))") // Expected: 2.0
print("Median of [1, 2] and [3, 4]: \(sol.findMedianSortedArrays([1, 2], [3, 4]))") // Expected: 2.5

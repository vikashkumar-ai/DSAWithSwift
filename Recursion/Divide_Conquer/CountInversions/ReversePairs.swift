/**
 * Problem: Reverse Pairs (Count Inversions Variant)
 * Topic: Recursion / Divide_Conquer / CountInversions
 * 
 * Description:
 * Given an integer array nums, return the number of reverse pairs 
 * in the array. A reverse pair is a pair (i, j) where 0 <= i < j < nums.count 
 * and nums[i] > 2 * nums[j].
 * 
 * Pattern: Enhanced Merge Sort. While merging two sorted halves, 
 * count the pairs that satisfy the reverse pair condition.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n) for merging.
 */

import Foundation

class Solution {
    /**
     * Counts the number of reverse pairs in an array using D&C.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: Total count of reverse pairs.
     */
    func reversePairs(_ nums: [Int]) -> Int {
        var nums = nums
        return mergeSortAndCount(&nums, 0, nums.count - 1)
    }
    
    private func mergeSortAndCount(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        if left >= right { return 0 }
        
        let mid = left + (right - left) / 2
        var count = mergeSortAndCount(&nums, left, mid) + mergeSortAndCount(&nums, mid + 1, right)
        
        // Count reverse pairs between left and right halves
        var j = mid + 1
        for i in left...mid {
            while j <= right && Double(nums[i]) > 2.0 * Double(nums[j]) {
                j += 1
            }
            count += (j - (mid + 1))
        }
        
        // Internal merge step
        let sortedPart = (nums[left...mid] + nums[mid + 1...right]).sorted()
        for i in 0..<sortedPart.count {
            nums[left + i] = sortedPart[i]
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
print("Reverse Pairs in [1, 3, 2, 3, 1]: \(sol.reversePairs([1, 3, 2, 3, 1]))") // Expected: 2 ([3, 1], [3, 1])
print("Reverse Pairs in [2, 4, 3, 5, 1]: \(sol.reversePairs([2, 4, 3, 5, 1]))") // Expected: 3 ([4, 1], [3, 1], [5, 1])

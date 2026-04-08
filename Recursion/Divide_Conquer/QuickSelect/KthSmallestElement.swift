/**
 * Problem: Kth Smallest Element (using Quick Select)
 * Topic: Recursion / Divide_Conquer / QuickSelect
 * 
 * Description:
 * Given an integer array nums and an integer k, return the kth smallest 
 * element in the array. 
 * Note that it is the kth smallest element in the sorted order, 
 * not the kth distinct element.
 * 
 * Pattern: Quick Select is a selection algorithm that uses the partitioning 
 * logic of Quick Sort to find the kth smallest/largest element in average 
 * linear time.
 * 
 * Time Complexity: O(n) average case. O(n²) worst case.
 * Space Complexity: O(1) iterative or O(log n) recursive.
 */

import Foundation

class Solution {
    /**
     * Finds the kth smallest element in an array using Quick Select.
     * - Parameters:
     *   - nums: The input integer array.
     *   - k: The target rank.
     * - Returns: The kth smallest element.
     */
    func findKthSmallest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        // We need the (k-1)th element in a 0-indexed sorted array.
        return quickSelect(&nums, 0, nums.count - 1, k - 1)
    }
    
    private func quickSelect(_ nums: inout [Int], _ left: Int, _ right: Int, _ k: Int) -> Int {
        if left == right { return nums[left] }
        
        let pivotIndex = partition(&nums, left, right)
        
        if k == pivotIndex {
            return nums[k]
        } else if k < pivotIndex {
            return quickSelect(&nums, left, pivotIndex - 1, k)
        } else {
            return quickSelect(&nums, pivotIndex + 1, right, k)
        }
    }
    
    /**
     * Lomuto partition scheme.
     */
    private func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let pivot = nums[right]
        var i = left
        
        for j in left..<right {
            if nums[j] <= pivot {
                nums.swapAt(i, j)
                i += 1
            }
        }
        
        nums.swapAt(i, right)
        return i
    }
}

// --- Test Cases ---
let sol = Solution()
print("K=3rd Smallest element in [7, 10, 4, 3, 20, 15]: \(sol.findKthSmallest([7, 10, 4, 3, 20, 15], 3))") 
// Expected: 7
print("K=4th Smallest element in [7, 10, 4, 3, 20, 15]: \(sol.findKthSmallest([7, 10, 4, 3, 20, 15], 4))") 
// Expected: 10

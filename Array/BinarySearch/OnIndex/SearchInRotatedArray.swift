/**
 * Problem: Search in Rotated Sorted Array
 * Topic: Array / BinarySearch / OnIndex
 * 
 * Description:
 * There is an integer array nums sorted in ascending order (with distinct 
 * values). Prior to being passed to your function, nums is possibly 
 * rotated at an unknown pivot index k. 
 * For example, [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2].
 * Given the array nums after the possible rotation and an integer target, 
 * return the index of target if it is in nums, or -1 if it is not in nums.
 * 
 * Pattern: Binary Search with a single pass. Determine which half of 
 * the array is sorted at each step and check if the target lies 
 * within the sorted range.
 * 
 * Time Complexity: O(log n).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Searches for a target in a rotated sorted array.
     * - Parameters:
     *   - nums: The input integer array.
     *   - target: The value to search for.
     * - Returns: The index of the target or -1.
     */
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        
        while low <= high {
            let mid = low + (high - low) / 2
            
            if nums[mid] == target { return mid }
            
            // Check if left half is sorted
            if nums[low] <= nums[mid] {
                // Target is in the left sorted half
                if nums[low] <= target && target < nums[mid] {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            } else {
                // Right half must be sorted
                if nums[mid] < target && target <= nums[high] {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
        }
        
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
print("Search 0 in [4,5,6,7,0,1,2]: \(sol.search([4,5,6,7,0,1,2], 0))") // Expected: 4
print("Search 3 in [4,5,6,7,0,1,2]: \(sol.search([4,5,6,7,0,1,2], 3))") // Expected: -1
print("Search 0 in [1]: \(sol.search([1], 0))")                         // Expected: -1

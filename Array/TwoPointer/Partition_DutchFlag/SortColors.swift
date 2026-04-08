/**
 * Problem: Sort Colors (Dutch National Flag Problem)
 * Topic: Array / Two Pointer / Partition (Dutch Flag)
 * 
 * Description:
 * Given an array nums with n objects colored red, white, or blue, 
 * sort them in-place so that objects of the same color are adjacent, 
 * with the colors in the order red (0), white (1), and blue (2).
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(1) as we are modifying the array in-place.
 */

import Foundation

class Solution {
    /**
     * Sorts an array of 0s, 1s, and 2s in-place.
     * - Parameters:
     *   - nums: Reference to the input array.
     */
    func sortColors(_ nums: inout [Int]) {
        var low = 0 // Boundary for 0s
        var mid = 0 // Current element
        var high = nums.count - 1 // Boundary for 2s
        
        while mid <= high {
            if nums[mid] == 0 {
                // Swap mid with low to move 0 to the front
                (nums[mid], nums[low]) = (nums[low], nums[mid])
                low += 1
                mid += 1
            } else if nums[mid] == 1 {
                // If it's a 1, just move mid forward
                mid += 1
            } else {
                // Swap mid with high to move 2 to the end
                (nums[mid], nums[high]) = (nums[high], nums[mid])
                high -= 1
                // Do not increment mid, because the swapped element from high needs to be checked
            }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [2, 0, 2, 1, 1, 0]
sol.sortColors(&testArr)
print("Sort Colors Result for [2, 0, 2, 1, 1, 0]: \(testArr)") // Expected: [0, 0, 1, 1, 2, 2]

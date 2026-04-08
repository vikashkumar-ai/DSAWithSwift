/**
 * Problem: Move Zeroes
 * Topic: Array / Two Pointer / Same Direction
 * 
 * Description:
 * Given an integer array nums, move all 0's to the end of it while maintaining 
 * the relative order of the non-zero elements.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(1) as we are modifying the array in-place.
 */

import Foundation

class Solution {
    /**
     * Moves all zeroes to the end of an array in-place.
     * - Parameters:
     *   - nums: The input integer array.
     */
    func moveZeroes(_ nums: inout [Int]) {
        var slow = 0 // Represents the index of the next non-zero element found
        
        // Find every non-zero element and bring it forward
        for fast in 0..<nums.count {
            if nums[fast] != 0 {
                // If fast and slow are different, swap them
                if fast != slow {
                    // Swift way to swap
                    (nums[slow], nums[fast]) = (nums[fast], nums[slow])
                }
                slow += 1
            }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [0, 1, 0, 3, 12]
sol.moveZeroes(&testArr)
print("Move Zeroes Result for [0, 1, 0, 3, 12]: \(testArr)") // Expected: [1, 3, 12, 0, 0]

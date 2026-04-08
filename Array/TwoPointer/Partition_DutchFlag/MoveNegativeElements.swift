/**
 * Problem: Move All Negative Elements to One Side (Dutch Flag Pattern)
 * Topic: Array / TwoPointer / Partition_DutchFlag
 * 
 * Description:
 * Given an array of positive and negative integers, move all 
 * negative numbers to the beginning and positive numbers to 
 * the end while maintaining the relative order or without using 
 * extra space (if modified as a standard partition).
 * 
 * Pattern: Partitioning (Dutch National Flag variant). Use two 
 * pointers to separate the array based on a pivot (0).
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1) in-place.
 */

import Foundation

class Solution {
    /**
     * Moves negative numbers to the front using two pointers.
     * - Parameters:
     *   - nums: Pointer to an array reflecting in-place changes.
     */
    func moveNegatives(_ nums: inout [Int]) {
        var j = 0
        for i in 0..<nums.count {
            if nums[i] < 0 {
                if i != j {
                    nums.swapAt(i, j)
                }
                j += 1
            }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [-12, 11, -13, -5, 6, -7, 5, -3, -6]
sol.moveNegatives(&testArr)
print("Negative Move Result: \(testArr)") 
// Expected: Negative elements moved to the front.

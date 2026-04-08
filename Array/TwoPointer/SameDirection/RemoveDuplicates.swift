/**
 * Problem: Remove Duplicates from Sorted Array
 * Topic: Array / Two Pointer / Same Direction
 * 
 * Description:
 * Given a sorted array in non-decreasing order, remove duplicates in-place so that 
 * each unique element appears only once.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(1) as we are modifying the array in-place.
 */

import Foundation

class Solution {
    /**
     * Removes duplicates from a sorted array in-place.
     * - Parameters:
     *   - nums: Pointer to an array reflecting in-place changes.
     * - Returns: The number of unique elements.
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        // Use Slow and Fast pointer technique (Same Direction)
        var slow = 0 // Represents index of last unique element found
        
        for fast in 1..<nums.count {
            // Find a new unique element
            if nums[fast] != nums[slow] {
                slow += 1
                nums[slow] = nums[fast]
            }
        }
        
        return slow + 1
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [1, 1, 2, 2, 3, 4, 4]
let k = sol.removeDuplicates(&testArr)
print("Remove Duplicates (unique count \(k)) in \(testArr.prefix(k)): \(testArr)") // Expected: [1, 2, 3, 4, ...]

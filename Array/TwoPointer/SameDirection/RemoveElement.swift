/**
 * Problem: Remove Element
 * Topic: Array / Two Pointer / Same Direction
 * 
 * Description:
 * Given an integer array nums and an integer val, remove all occurrences of val 
 * in nums in-place. The order of elements may be changed. 
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(1) as we are modifying the array in-place.
 */

import Foundation

class Solution {
    /**
     * Removes all instances of val from an array in-place.
     * - Parameters:
     *   - nums: Reference to the input array.
     *   - val: The value to remove.
     * - Returns: The number of remaining elements.
     */
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var slow = 0
        
        for fast in 0..<nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
        }
        
        return slow
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [3, 2, 2, 3]
let k = sol.removeElement(&testArr, 3)
print("Remove Element val=3 from \(testArr.prefix(k)): \(testArr)") // Expected: [2, 2, ...]

/**
 * Problem: Find the Duplicate Number
 * Topic: HashMap / Index Mapping
 * 
 * Description:
 * Given an array of integers nums containing n + 1 integers where each integer 
 * is in the range [1, n] inclusive. There is only one repeated number in nums, 
 * return this repeated number.
 * 
 * Time Complexity: O(n) where n is length of the array.
 * Space Complexity: O(1) by modifying the input array in-place or O(n) using a hash map.
 */

import Foundation

class Solution {
    /**
     * Finds the single repeated number in a constant-space array.
     * - Parameters:
     *   - nums: A mutable array reflecting in-place changes.
     * - Returns: The duplicate number found.
     */
    func findDuplicate(_ nums: inout [Int]) -> Int {
        // Step 1: Use index mapping (treating values as indices)
        for i in 0..<nums.count {
            let index = abs(nums[i])
            
            // If the element at index is already negative, we found a duplicate
            if nums[index] < 0 {
                return index
            }
            
            // Mark the element at index as negative
            nums[index] = -nums[index]
        }
        
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [1, 3, 4, 2, 2]
print("Duplicate Number in [1, 3, 4, 2, 2]: \(sol.findDuplicate(&testArr))") // Expected: 2
var testArr2 = [3, 1, 3, 4, 2]
print("Duplicate Number in [3, 1, 3, 4, 2]: \(sol.findDuplicate(&testArr2))") // Expected: 3

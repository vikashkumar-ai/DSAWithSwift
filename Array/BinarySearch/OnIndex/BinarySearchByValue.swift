/**
 * Problem: Binary Search by Value
 * Topic: Array / Binary Search / On Index
 * 
 * Description:
 * Given a sorted array of integers nums and a target integer, 
 * find the index of the target in nums. Return -1 if not found.
 * 
 * Time Complexity: O(log n) where n is the length of the array.
 * Space Complexity: O(1) as we are only using two pointers.
 */

import Foundation

class Solution {
    /**
     * Searches for target in a sorted array using Binary Search.
     * - Parameters:
     *   - nums: The input sorted integer array.
     *   - target: The target integer to find.
     * - Returns: The index of the target or -1.
     */
    func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        
        while low <= high {
            let mid = low + (high - low) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [-1, 0, 3, 5, 9, 12]
let target = 9
print("Binary Search index for target \(target) in \(testArr): \(sol.binarySearch(testArr, target))") // Expected: 4

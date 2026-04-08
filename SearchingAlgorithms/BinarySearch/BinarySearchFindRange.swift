/**
 * Problem: Find First and Last Position of Element (Binary Search Range)
 * Topic: Searching Algorithms / BinarySearch
 * 
 * Description:
 * Given an array of integers nums sorted in non-decreasing order, 
 * find the starting and ending position of a given target value. 
 * If the target is not found, return [-1, -1].
 * 
 * Pattern: Binary Search for Boundaries.
 * 1. Binary search to find the 'first' occurrence: If target == mid, 
 *    record mid as first and then search in left (high = mid - 1).
 * 2. Binary search to find the 'last' occurrence: If target == mid, 
 *    record mid as last and then search in right (low = mid + 1).
 * 
 * Time Complexity: O(log n).
 * Space Complexity: O(1).
 */

import Foundation

class BinarySearchRange {
    /**
     * Finds the [first, last] index of target.
     * - Parameters:
     *   - nums: Sorted array.
     *   - target: Value.
     * - Returns: Range.
     */
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return [findBound(nums, target, true), findBound(nums, target, false)]
    }
    
    private func findBound(_ nums: [Int], _ target: Int, _ isFirst: Bool) -> Int {
        var low = 0
        var high = nums.count - 1
        var result = -1
        
        while low <= high {
            let mid = low + (high - low) / 2
            
            if nums[mid] == target {
                result = mid
                if isFirst {
                    high = mid - 1 // Narrow search to left
                } else {
                    low = mid + 1 // Narrow search to right
                }
            } else if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let solver = BinarySearchRange()
let testArr = [5, 7, 7, 8, 8, 10]
print("Range for 8: \(solver.searchRange(testArr, 8))") // Expected: [3, 4]
print("Range for 6: \(solver.searchRange(testArr, 6))") // Expected: [-1, -1]

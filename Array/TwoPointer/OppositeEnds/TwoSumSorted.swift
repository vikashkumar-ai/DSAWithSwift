/**
 * Problem: Two Sum II - Input Array Is Sorted
 * Topic: Array / Two Pointer / Opposite Ends
 * 
 * Description:
 * Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, 
 * find two numbers such that they add up to a specific target number.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(1) as we are only using two pointers.
 */

import Foundation

class Solution {
    /**
     * Finds the indices of two numbers that sum up to target in a sorted array.
     * - Parameters:
     *   - numbers: The input sorted array.
     *   - target: The target sum.
     * - Returns: A 1-indexed array of two indices.
     */
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let currentSum = numbers[left] + numbers[right]
            
            if currentSum == target {
                return [left + 1, right + 1] // 1-indexed
            } else if currentSum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return []
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [2, 7, 11, 15]
let target = 9
print("Two Sum II (target \(target)) in \(testArr): \(sol.twoSum(testArr, target))") // Expected: [1, 2]

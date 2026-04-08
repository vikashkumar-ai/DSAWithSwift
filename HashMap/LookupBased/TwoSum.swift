/**
 * Problem: Two Sum
 * Topic: HashMap / Lookup Based
 * 
 * Description:
 * Given an array of integers nums and an integer target, return indices 
 * of the two numbers such that they add up to target. Each input must 
 * have exactly one solution, and you may not use the same element twice.
 * 
 * Time Complexity: O(n) where n is length of the array.
 * Space Complexity: O(n) for the hash map.
 */

import Foundation

class Solution {
    /**
     * Finds the indices of two numbers that sum up to target using a HashMap.
     * - Parameters:
     *   - nums: Pointer to an array reflecting in-place changes.
     *   - target: The target sum.
     * - Returns: A 1-indexed array of two indices.
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]() // Stores the number and its index
        
        for (index, num) in nums.enumerated() {
            let complement = target - num
            
            // Check if the complement of the current number is in the map
            if let complementIndex = map[complement] {
                // Return the index of the complement and the current number
                return [complementIndex, index]
            }
            
            // Store the current number and its index in the map
            map[num] = index
        }
        
        return []
    }
}

// --- Test Cases ---
let sol = Solution()
print("Two Sum for [2, 7, 11, 15] (target=9): \(sol.twoSum([2, 7, 11, 15], 9))") // Expected: [0, 1]
print("Two Sum for [3, 2, 4] (target=6): \(sol.twoSum([3, 2, 4], 6))")           // Expected: [1, 2]

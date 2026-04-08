/**
 * Problem: Contains Duplicate
 * Topic: HashMap / Set Based
 * 
 * Description:
 * Given an integer array nums, return true if any value appears at least 
 * twice in the array, and return false if every element is distinct.
 * 
 * Time Complexity: O(n) where n is length of the array.
 * Space Complexity: O(n) for the hash set.
 */

import Foundation

class Solution {
    /**
     * Determines if any element appears more than once in an array.
     * - Parameters:
     *   - nums: Pointer to an array reflecting in-place changes.
     * - Returns: A boolean value of true if any element is repeated.
     */
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>() // Hash set for constant-time membership testing
        
        for num in nums {
            // If the element is already in the set, we found a duplicate
            if set.contains(num) {
                return true
            }
            
            // Insert the current element into the set
            set.insert(num)
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
print("Contains Duplicate in [1, 2, 3, 1]: \(sol.containsDuplicate([1, 2, 3, 1]))") // Expected: true
print("Contains Duplicate in [1, 2, 3, 4]: \(sol.containsDuplicate([1, 2, 3, 4]))") // Expected: false

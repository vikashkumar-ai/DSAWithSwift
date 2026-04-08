/**
 * Problem: Intersection of Two Arrays
 * Topic: HashMap / SetBased
 * 
 * Description:
 * Given two integer arrays nums1 and nums2, return an array of 
 * their intersection. Each element in the result must be unique 
 * and you may return the result in any order.
 * 
 * Pattern: Set intersection. Store nums1 elements in a set and 
 * check if each element in nums2 exists in that set.
 * 
 * Time Complexity: O(n + m) where n and m are array lengths.
 * Space Complexity: O(n) for the set.
 */

import Foundation

class Solution {
    /**
     * Finds the intersection of two arrays.
     * - Parameters:
     *   - nums1: First input array.
     *   - nums2: Second input array.
     * - Returns: Array of unique common elements.
     */
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set1 = Set(nums1)
        var result = Set<Int>()
        
        for num in nums2 {
            if set1.contains(num) {
                result.insert(num)
            }
        }
        
        return Array(result)
    }
}

// --- Test Cases ---
let sol = Solution()
print("Intersection of [1,2,2,1] and [2,2]: \(sol.intersection([1,2,2,1], [2,2]))") // Expected: [2]
print("Intersection of [4,9,5] and [9,4,9,8,4]: \(sol.intersection([4,9,5], [9,4,9,8,4]))") // Expected: [4, 9] (any order)

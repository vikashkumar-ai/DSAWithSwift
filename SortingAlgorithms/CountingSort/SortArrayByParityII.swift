/**
 * Problem: Sort Array By Parity II (Counting Pattern)
 * Topic: Sorting Algorithms / CountingSort
 * 
 * Description:
 * Given an array of integers nums, half of the integers in nums are odd, 
 * and half are even. 
 * Sort the array so that whenever nums[i] is odd, i is odd, and 
 * whenever nums[i] is even, i is even.
 * 
 * Pattern: Two Pointers or Counting. Iterate with even and odd 
 * indices and place the appropriate numbers in their correct targets.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n) for the result array.
 */

import Foundation

class Solution {
    /**
     * Sorts an array such that index and value parity match.
     * - Parameters:
     *   - nums: Pointer to an array of integers.
     * - Returns: A sorted result array.
     */
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: nums.count)
        var evenIndex = 0
        var oddIndex = 1
        
        for num in nums {
            if num % 2 == 0 {
                result[evenIndex] = num
                evenIndex += 2
            } else {
                result[oddIndex] = num
                oddIndex += 2
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Sort By Parity for [4, 2, 5, 7]: \(sol.sortArrayByParityII([4, 2, 5, 7]))") 
// Expected: [4, 5, 2, 7] (or another parity-matched order)
print("Sort By Parity for [2, 3]:       \(sol.sortArrayByParityII([2, 3]))")       
// Expected: [2, 3]

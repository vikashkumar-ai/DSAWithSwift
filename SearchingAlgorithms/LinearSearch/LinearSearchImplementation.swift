/**
 * Problem: Linear Search Implementation (Standard)
 * Topic: Searching Algorithms / LinearSearch
 * 
 * Description:
 * Linear Search is a simple search algorithm that sequentialy 
 * checks each element of the list until a match is found or 
 * the whole list has been searched.
 * 
 * Pattern: Sequential Traversal.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Finds the index of a target using linear search.
     * - Parameters:
     *   - arr: Integer array.
     *   - target: Value.
     * - Returns: Index or -1 if not found.
     */
    func linearSearch(_ arr: [Int], _ target: Int) -> Int {
        for i in 0..<arr.count {
            if arr[i] == target {
                return i
            }
        }
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
print("Index of 5 in [2, 3, 4, 10, 40]: \(sol.linearSearch([2, 3, 4, 10, 40], 5))") 
// Expected: -1
print("Index of 10 in [2, 3, 4, 10, 40]: \(sol.linearSearch([2, 3, 4, 10, 40], 10))") 
// Expected: 3

/**
 * Problem: Jump Search (Square Root Search)
 * Topic: Searching Algorithms / OtherSearch
 * 
 * Description:
 * Jump Search is a search algorithm for sorted arrays. The basic 
 * idea is to check fewer elements (than linear search) by jumping 
 * ahead by fixed steps or skipping some elements in place of 
 * searching all elements.
 * 
 * Pattern: Step-based search. Jump forward by sqrt(n) steps until 
 * the target is potentially in the current block, then perform 
 * linear search within that block.
 * 
 * Time Complexity: O(√n).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Finds the index of a target using jump search.
     * - Parameters:
     *   - arr: Sorted integer array.
     *   - target: Value.
     * - Returns: Index or -1 if not found.
     */
    func jumpSearch(_ arr: [Int], _ target: Int) -> Int {
        let n = arr.count
        if n == 0 { return -1 }
        
        var step = Int(sqrt(Double(n)))
        var prev = 0
        
        // Finding the block where element is present
        while arr[min(step, n) - 1] < target {
            prev = step
            step += Int(sqrt(Double(n)))
            if prev >= n { return -1 }
        }
        
        // Doing a linear search for target in block starting with prev
        while arr[prev] < target {
            prev += 1
            // If we reached next block or end of array, target is not present
            if prev == min(step, n) { return -1 }
        }
        
        // If element is found
        if arr[prev] == target {
            return prev
        }
        
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
print("Index of 55 in [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]: \(sol.jumpSearch([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610], 55))") 
// Expected: 10
print("Index of 100 in [0, 1, 1, 2, 3, 5, 8]: \(sol.jumpSearch([0, 1, 1, 2, 3, 5, 8], 100))") 
// Expected: -1

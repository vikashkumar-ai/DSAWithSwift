/**
 * Problem: Sentinel Linear Search
 * Topic: Searching Algorithms / LinearSearch
 * 
 * Description:
 * Sentinel linear search is a variation of linear search where the 
 * number of comparisons is reduced by placing the target value 
 * at the end of the array to act as a sentinel. It ensures that 
 * the target will always be found, eliminating the boundary 
 * check (i < n) in every iteration.
 * 
 * Pattern: One extra comparison at the end to check if the target 
 * was found before the sentinel.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1) if modified in-place or O(1) space overhead.
 */

import Foundation

class Solution {
    /**
     * Finds the index of a target using sentinel linear search.
     * - Parameters:
     *   - arr: Integer array.
     *   - target: Value.
     * - Returns: Index or -1 if not found.
     */
    func sentinelSearch(_ arr: inout [Int], _ target: Int) -> Int {
        let n = arr.count
        if n == 0 { return -1 }
        
        let last = arr[n - 1]
        arr[n - 1] = target // Set sentinel
        
        var i = 0
        while arr[i] != target {
            i += 1
        }
        
        arr[n - 1] = last // Restore last element
        
        // If target was the last element or found before last
        if i < n - 1 || last == target {
            return i
        }
        
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [10, 20, 180, 30, 60, 50, 110, 100, 70]
print("Index of 180: \(sol.sentinelSearch(&testArr, 180))") // Expected: 2
print("Index of 90:  \(sol.sentinelSearch(&testArr, 90))")  // Expected: -1

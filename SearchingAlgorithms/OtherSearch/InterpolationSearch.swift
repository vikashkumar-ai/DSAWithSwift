/**
 * Problem: Interpolation Search
 * Topic: Searching Algorithms / OtherSearch
 * 
 * Description:
 * Interpolation search is an improvement over Binary Search 
 * for instances where the values in a sorted array are 
 * uniformly distributed.
 * 
 * Pattern: Formula-based position estimation. The position is 
 * estimated using the value and the array range.
 * 
 * Time Complexity: O(log log n) average, O(n) worst.
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Finds the index of a target using interpolation search.
     * - Parameters:
     *   - arr: Sorted and uniformly distributed integer array.
     *   - target: Value.
     * - Returns: Index or -1 if not found.
     */
    func interpolationSearch(_ arr: [Int], _ target: Int) -> Int {
        var low = 0
        var high = arr.count - 1
        
        while low <= high && target >= arr[low] && target <= arr[high] {
            if low == high {
                if arr[low] == target { return low }
                return -1
            }
            
            // Formula for interpolation position
            let pos = low + Int(Double(high - low) / Double(arr[high] - arr[low]) * Double(target - arr[low]))
            
            if arr[pos] == target {
                return pos
            }
            
            if arr[pos] < target {
                low = pos + 1
            } else {
                high = pos - 1
            }
        }
        
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
print("Index of 18 in [10, 12, 13, 16, 18, 19, 20]: \(sol.interpolationSearch([10, 12, 13, 16, 18, 19, 20], 18))") 
// Expected: 4
print("Index of 10 in [2, 4, 6, 8, 10]: \(sol.interpolationSearch([2, 4, 6, 8, 10], 10))") 
// Expected: 4

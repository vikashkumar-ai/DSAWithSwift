/**
 * Problem: Recursive Binary Search (Standard)
 * Topic: Searching Algorithms / BinarySearch
 * 
 * Description:
 * Binary Search is a fast search algorithm with runtime complexity 
 * of O(log n). This search algorithm works on the principle of 
 * divide and conquer. For this algorithm to work properly, 
 * the data collection should be in sorted form.
 * 
 * Pattern: Divide and Conquer. Compare target with middle element 
 * and reduce search space by half in each step.
 * 
 * Time Complexity: O(log n).
 * Space Complexity: O(log n) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Finds the index of a target using recursive binary search.
     * - Parameters:
     *   - arr: Sorted integer array.
     *   - target: Value.
     *   - low: Start index.
     *   - high: End index.
     * - Returns: Index or -1 if not found.
     */
    func binarySearch(_ arr: [Int], _ low: Int, _ high: Int, _ target: Int) -> Int {
        if low > high { return -1 }
        
        let mid = low + (high - low) / 2
        
        if arr[mid] == target {
            return mid
        } else if arr[mid] > target {
            // Target is in left half
            return binarySearch(arr, low, mid - 1, target)
        } else {
            // Target is in right half
            return binarySearch(arr, mid + 1, high, target)
        }
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [3, 4, 5, 6, 7, 8, 9]
print("Index of 4: \(sol.binarySearch(testArr, 0, testArr.count - 1, 4))") 
// Expected: 1
print("Index of 2: \(sol.binarySearch(testArr, 0, testArr.count - 1, 2))") 
// Expected: -1

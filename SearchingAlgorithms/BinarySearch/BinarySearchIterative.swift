/**
 * Problem: Iterative Binary Search (Standard)
 * Topic: Searching Algorithms / BinarySearch
 * 
 * Description:
 * Binary Search is an efficient searching algorithm for sorted 
 * data. It works by repeatedly dividing the search space in 
 * half until the target is found or determined to be absent.
 * 
 * Pattern: Iterative Search with Low and High pointers.
 * 1. Initialize low = 0, high = n - 1.
 * 2. Calculate mid = low + (high - low) / 2.
 * 3. Update low or high based on comparison.
 * 
 * Time Complexity: O(log n).
 * Space Complexity: O(1).
 */

import Foundation

class BinarySearchIterative {
    /**
     * Finds the index of a target using iterative binary search.
     * - Parameters:
     *   - arr: Sorted integer array.
     *   - target: Value.
     * - Returns: Index or -1 if not found.
     */
    func search(_ arr: [Int], _ target: Int) -> Int {
        var low = 0
        var high = arr.count - 1
        
        while low <= high {
            let mid = low + (high - low) / 2
            
            if arr[mid] == target {
                return mid
            } else if arr[mid] < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return -1
    }
}

// --- Test Cases ---
let solver = BinarySearchIterative()
let testArr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print("Index of 4: \(solver.search(testArr, 4))") // Expected: 3
print("Index of 10: \(solver.search(testArr, 10))") // Expected: -1

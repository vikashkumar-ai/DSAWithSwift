/**
 * Problem: Insertion Sort
 * Topic: Sorting Algorithms / ComparisonSorts
 * 
 * Description:
 * Insertion Sort builds the final sorted array one item at a time. It 
 * is much less efficient on large lists than more advanced algorithms 
 * like quicksort, heapsort, or merge sort.
 * 
 * Pattern: Move each element to its correct position in the sorted 
 * portion to its left.
 * 
 * Time Complexity: O(n²) worst case, O(n) best case (nearly sorted).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Sorts an array using Insertion Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func insertionSort(_ array: inout [Int]) {
        if array.isEmpty { return }
        
        for i in 1..<array.count {
            let key = array[i]
            var j = i - 1
            
            // Move elements of array[0...i-1] that are greater than key 
            // to one position ahead of their current position.
            while j >= 0 && array[j] > key {
                array[j + 1] = array[j]
                j -= 1
            }
            array[j + 1] = key
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [12, 11, 13, 5, 6]
sol.insertionSort(&testArr)
print("Insertion Sort Result: \(testArr)") // Expected: [5, 6, 11, 12, 13]

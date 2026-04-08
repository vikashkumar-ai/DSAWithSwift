/**
 * Problem: Stable Selection Sort
 * Topic: Sorting Algorithms / SelectionSort
 * 
 * Description:
 * Selection Sort is typically not stable (elements with equal 
 * values might change their relative order). However, it can be 
 * made stable by shifting elements rather than swapping.
 * 
 * Pattern: Instead of swapping the minimum element with the 
 * element at the beginning, move all elements between them 
 * one position forward.
 * 
 * Time Complexity: O(n²) all cases.
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Sorts an array using a stable version of Selection Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func stableSelectionSort(_ array: inout [Int]) {
        let n = array.count
        for i in 0..<n - 1 {
            var minIndex = i
            // Find the minimum element in unsorted array
            for j in i + 1..<n {
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            
            // Move minimum element to current position by shifting 
            // the intermediate elements.
            let key = array[minIndex]
            while minIndex > i {
                array[minIndex] = array[minIndex - 1]
                minIndex -= 1
            }
            array[i] = key
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [4, 5, 3, 2, 4, 1]
sol.stableSelectionSort(&testArr)
print("Stable Selection Sort Result: \(testArr)") 
// Expected: [1, 2, 3, 4, 4, 5]

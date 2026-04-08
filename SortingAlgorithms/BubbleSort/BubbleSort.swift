/**
 * Problem: Bubble Sort
 * Topic: Sorting Algorithms / ComparisonSorts
 * 
 * Description:
 * Bubble Sort is an intuitive sorting algorithm that repeatedly steps 
 * through the list, compares adjacent elements and swaps them if 
 * they are in the wrong order.
 * 
 * Time Complexity: O(n²) worst case, O(n) best case (if already sorted).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Sorts an array using the Bubble Sort algorithm.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func bubbleSort(_ array: inout [Int]) {
        let n = array.count
        for i in 0..<n {
            var swapped = false
            for j in 0..<n - i - 1 {
                if array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                    swapped = true
                }
            }
            // If no elements were swapped in current pass, array is sorted
            if !swapped { break }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [64, 34, 25, 12, 22, 11, 90]
sol.bubbleSort(&testArr)
print("Bubble Sort Result: \(testArr)") // Expected: [11, 12, 22, 25, 34, 64, 90]

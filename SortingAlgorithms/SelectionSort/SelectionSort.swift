/**
 * Problem: Selection Sort
 * Topic: Sorting Algorithms / ComparisonSorts
 * 
 * Description:
 * Selection Sort is an in-place comparison-based sorting algorithm. 
 * It has an O(n²) time complexity, making it inefficient for 
 * large lists, and generally performs worse than insertion sort.
 * 
 * Pattern: Divide the input array into two parts: a sorted part and 
 * an unsorted part. Repeatedly pick the minimum element from the 
 * unsorted part and move it to the end of the sorted part.
 * 
 * Time Complexity: O(n²) all cases.
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Sorts an array using Selection Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func selectionSort(_ array: inout [Int]) {
        let n = array.count
        for i in 0..<n - 1 {
            var minIndex = i
            // Find the minimum element in unsorted array
            for j in i + 1..<n {
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            // Swap the found minimum element with the first element
            if minIndex != i {
                array.swapAt(i, minIndex)
            }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [64, 25, 12, 22, 11]
sol.selectionSort(&testArr)
print("Selection Sort Result: \(testArr)") // Expected: [11, 12, 22, 25, 64]

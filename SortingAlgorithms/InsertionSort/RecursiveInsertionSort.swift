/**
 * Problem: Recursive Insertion Sort
 * Topic: Sorting Algorithms / InsertionSort
 * 
 * Description:
 * Standard Insertion Sort can be implemented recursively. Sort 
 * the first n-1 elements and then insert the nth element in 
 * its correct position in the sorted sub-array.
 * 
 * Pattern: Base case (size 1). Recursive step: sort the first n-1 
 * elements, then place the nth element accordingly.
 * 
 * Time Complexity: O(n²) all cases.
 * Space Complexity: O(n) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Sorts an array using recursive Insertion Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     *   - n: Number of elements to consider.
     */
    func recursiveInsertionSort(_ array: inout [Int], _ n: Int) {
        // Base case
        if n <= 1 { return }
        
        // Sort first n-1 elements
        recursiveInsertionSort(&array, n - 1)
        
        // Insert last element at its correct position in sorted array
        let last = array[n-1]
        var j = n - 2
        
        // Shift elements to make space for last
        while j >= 0 && array[j] > last {
            array[j + 1] = array[j]
            j -= 1
        }
        array[j + 1] = last
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [12, 11, 13, 5, 6]
sol.recursiveInsertionSort(&testArr, testArr.count)
print("Recursive Insertion Sort Result: \(testArr)") 
// Expected: [5, 6, 11, 12, 13]

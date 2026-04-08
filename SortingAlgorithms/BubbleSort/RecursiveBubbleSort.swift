/**
 * Problem: Recursive Bubble Sort
 * Topic: Sorting Algorithms / BubbleSort
 * 
 * Description:
 * Standard Bubble Sort can be implemented recursively. After each 
 * pass, the largest element is "bubbled" to the end. The 
 * recursive call handles the remaining sub-array.
 * 
 * Pattern: Base case (size 1). Recursive step: perform one pass 
 * and call recursively for n-1 elements.
 * 
 * Time Complexity: O(n²) all cases.
 * Space Complexity: O(n) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Sorts an array using recursive Bubble Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     *   - n: Number of elements to consider.
     */
    func recursiveBubbleSort(_ array: inout [Int], _ n: Int) {
        // Base case
        if n == 1 { return }
        
        // One pass of bubble sort. After this, the largest element 
        // is moved to the end.
        for i in 0..<n - 1 {
            if array[i] > array[i + 1] {
                array.swapAt(i, i + 1)
            }
        }
        
        // Largest element is fixed, recur for the remaining array
        recursiveBubbleSort(&array, n - 1)
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [64, 34, 25, 12, 22, 11, 90]
sol.recursiveBubbleSort(&testArr, testArr.count)
print("Recursive Bubble Sort Result: \(testArr)") 
// Expected: [11, 12, 22, 25, 34, 64, 90]

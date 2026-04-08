/**
 * Problem: Iterative Merge Sort (Bottom-Up)
 * Topic: Sorting Algorithms / MergeSort
 * 
 * Description:
 * Standard Merge Sort is typically implemented recursively (Top-Down). 
 * Iterative Merge Sort is a Bottom-Up approach that starts merging 
 * arrays of size 1, then 2, 4, 8, etc.
 * 
 * Pattern: Bottom-Up Merge Sort. Use a width starting from 1 and 
 * double it each pass.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Sorts an array using iterative Merge Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func iterativeMergeSort(_ array: inout [Int]) {
        let n = array.count
        if n <= 1 { return }
        
        var width = 1
        while width < n {
            var i = 0
            while i < n {
                let left = i
                let mid = min(i + width, n)
                let right = min(i + 2 * width, n)
                
                merge(&array, left, mid, right)
                i += 2 * width
            }
            width *= 2
        }
    }
    
    private func merge(_ array: inout [Int], _ left: Int, _ mid: Int, _ right: Int) {
        let n1 = mid - left
        let n2 = right - mid
        
        let leftArr = Array(array[left..<mid])
        let rightArr = Array(array[mid..<right])
        
        var i = 0, j = 0, k = left
        while i < n1 && j < n2 {
            if leftArr[i] <= rightArr[j] {
                array[k] = leftArr[i]
                i += 1
            } else {
                array[k] = rightArr[j]
                j += 1
            }
            k += 1
        }
        
        while i < n1 {
            array[k] = leftArr[i]
            i += 1
            k += 1
        }
        
        while j < n2 {
            array[k] = rightArr[j]
            j += 1
            k += 1
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [12, 11, 13, 5, 6, 7]
sol.iterativeMergeSort(&testArr)
print("Iterative Merge Sort Result: \(testArr)") // Expected: [5, 6, 7, 11, 12, 13]

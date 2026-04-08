/**
 * Problem: Merge Sort
 * Topic: Sorting Algorithms / MergeSort
 * 
 * Description:
 * Merge Sort is an efficient, stable, comparison-based, 
 * divide-and-conquer sorting algorithm.
 * 
 * Pattern: Recursively divide the array into halves, sort them, 
 * and then merge the sorted halves.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n) for merging.
 */

import Foundation

class Solution {
    /**
     * Sorts an array using Merge Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func mergeSort(_ array: inout [Int]) {
        if array.count <= 1 { return }
        
        let mid = array.count / 2
        var left = Array(array[0..<mid])
        var right = Array(array[mid..<array.count])
        
        mergeSort(&left)
        mergeSort(&right)
        
        array = merge(left, right)
    }
    
    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var merged = [Int]()
        var i = 0
        var j = 0
        
        while i < left.count && j < right.count {
            if left[i] <= right[j] {
                merged.append(left[i])
                i += 1
            } else {
                merged.append(right[j])
                j += 1
            }
        }
        
        merged.append(contentsOf: left[i...])
        merged.append(contentsOf: right[j...])
        
        return merged
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [38, 27, 43, 3, 9, 82, 10]
sol.mergeSort(&testArr)
print("Merge Sort Result: \(testArr)") // Expected: [3, 9, 10, 27, 38, 43, 82]

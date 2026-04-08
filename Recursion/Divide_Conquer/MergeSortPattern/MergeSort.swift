/**
 * Problem: Merge Sort
 * Topic: Recursion / Divide_Conquer / MergeSortPattern
 * 
 * Description:
 * Implements the Merge Sort algorithm using a divide and conquer strategy. 
 * The algorithm divides the input array into two halves, calls itself for 
 * the two halves, and then merges the two sorted halves.
 * 
 * Time Complexity: O(n log n) in all cases (best, average, worst).
 * Space Complexity: O(n) for the auxiliary array used during merging.
 */

import Foundation

class Solution {
    /**
     * Sorts an array using the Merge Sort algorithm.
     * - Parameters:
     *   - array: The input array to be sorted.
     * - Returns: A new sorted array.
     */
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let mid = array.count / 2
        let left = mergeSort(Array(array[0..<mid]))
        let right = mergeSort(Array(array[mid..<array.count]))
        
        return merge(left, right)
    }
    
    /**
     * Helper to merge two sorted arrays into one.
     */
    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var result = [Int]()
        var i = 0
        var j = 0
        
        while i < left.count && j < right.count {
            if left[i] < right[j] {
                result.append(left[i])
                i += 1
            } else {
                result.append(right[j])
                j += 1
            }
        }
        
        // Append any remaining elements
        result.append(contentsOf: left[i...])
        result.append(contentsOf: right[j...])
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [38, 27, 43, 3, 9, 82, 10]
print("Merge Sort Result for \(testArr): \(sol.mergeSort(testArr))") 
// Expected: [3, 9, 10, 27, 38, 43, 82]

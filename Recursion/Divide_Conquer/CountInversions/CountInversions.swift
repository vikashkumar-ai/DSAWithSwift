/**
 * Problem: Count Inversions in an Array
 * Topic: Recursion / Divide_Conquer / CountInversions
 * 
 * Description:
 * Inversion Count for an array indicates how far the array is from 
 * being sorted. If the array is already sorted, then the inversion 
 * count is 0. If an array is sorted in reverse order, then the 
 * inversion count is the maximum. 
 * Formally, two elements a[i] and a[j] form an inversion if a[i] > a[j] 
 * and i < j.
 * 
 * Pattern: Enhanced Merge Sort. While merging two sorted halves, if 
 * an element from the right half is smaller than the element from 
 * the left half, it forms an inversion with all remaining elements 
 * in the left half.
 * 
 * Time Complexity: O(n log n) where n is length of the array.
 * Space Complexity: O(n) for merging.
 */

import Foundation

class Solution {
    /**
     * Counts inversions in an array using a divide and conquer strategy.
     * - Parameters:
     *   - array: The input integer array.
     * - Returns: The total count of inversions.
     */
    func countInversions(_ array: [Int]) -> Int {
        var arr = array
        return mergeSortAndCount(&arr, 0, arr.count - 1)
    }
    
    private func mergeSortAndCount(_ arr: inout [Int], _ left: Int, _ right: Int) -> Int {
        var count = 0
        if left < right {
            let mid = left + (right - left) / 2
            
            // Count inversions in left and right halves
            count += mergeSortAndCount(&arr, left, mid)
            count += mergeSortAndCount(&arr, mid + 1, right)
            
            // Count merge inversions
            count += mergeAndCount(&arr, left, mid, right)
        }
        return count
    }
    
    private func mergeAndCount(_ arr: inout [Int], _ left: Int, _ mid: Int, _ right: Int) -> Int {
        var leftArr = Array(arr[left...mid])
        var rightArr = Array(arr[mid + 1...right])
        
        var i = 0, j = 0, k = left, swaps = 0
        
        while i < leftArr.count && j < rightArr.count {
            if leftArr[i] <= rightArr[j] {
                arr[k] = leftArr[i]
                i += 1
            } else {
                arr[k] = rightArr[j]
                j += 1
                // Formation of inversions
                swaps += (mid + 1) - (left + i)
            }
            k += 1
        }
        
        while i < leftArr.count {
            arr[k] = leftArr[i]
            i += 1
            k += 1
        }
        
        while j < rightArr.count {
            arr[k] = rightArr[j]
            j += 1
            k += 1
        }
        
        return swaps
    }
}

// --- Test Cases ---
let sol = Solution()
print("Inversion Count for [2, 4, 1, 3, 5]: \(sol.countInversions([2, 4, 1, 3, 5]))") // Expected: 3 ([4,1], [4,3], [2,1])
print("Inversion Count for [1, 2, 3, 4, 5]: \(sol.countInversions([1, 2, 3, 4, 5]))") // Expected: 0
print("Inversion Count for [5, 4, 3, 2, 1]: \(sol.countInversions([5, 4, 3, 2, 1]))") // Expected: 10

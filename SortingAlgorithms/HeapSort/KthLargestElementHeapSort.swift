/**
 * Problem: Kth Largest Element (using Heapify)
 * Topic: Sorting Algorithms / HeapSort
 * 
 * Description:
 * Given an integer array nums and an integer k, return the kth largest 
 * element in the array. 
 * Note that it is the kth largest element in the sorted order, 
 * not the kth distinct element.
 * 
 * Pattern: Building a Max-Heap takes O(n) time. Extracting k elements 
 * from the Max-Heap takes O(k log n).
 * 
 * Time Complexity: O(n + k log n).
 * Space Complexity: O(1) in-place.
 */

import Foundation

class Solution {
    /**
     * Finds the kth largest element using heapify.
     * - Parameters:
     *   - nums: Input integer array.
     *   - k: Rank.
     * - Returns: The kth largest element.
     */
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var array = nums
        let n = array.count
        
        // Build Max-Heap
        for i in (0..<n/2).reversed() {
            heapify(&array, n, i)
        }
        
        // Extract k-1 elements
        for i in (1..<k).reversed() {
            array.swapAt(0, n - i)
            heapify(&array, n - i, 0)
        }
        
        return array[0]
    }
    
    private func heapify(_ array: inout [Int], _ n: Int, _ i: Int) {
        var largest = i
        let left = 2 * i + 1
        let right = 2 * i + 2
        
        if left < n && array[left] > array[largest] {
            largest = left
        }
        
        if right < n && array[right] > array[largest] {
            largest = right
        }
        
        if largest != i {
            array.swapAt(i, largest)
            heapify(&array, n, largest)
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("3rd Largest in [3, 2, 3, 1, 2, 4, 5, 5, 6]: \(sol.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 3))") 
// Expected: 5
print("2nd Largest in [3, 2, 1, 5, 6, 4]: \(sol.findKthLargest([3, 2, 1, 5, 6, 4], 2))") 
// Expected: 5

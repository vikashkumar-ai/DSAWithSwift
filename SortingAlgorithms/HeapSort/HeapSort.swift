/**
 * Problem: Heap Sort
 * Topic: Sorting Algorithms / HeapSort
 * 
 * Description:
 * Heap Sort is a comparison-based sorting technique based on 
 * Binary Heap data structure. It is similar to selection sort where 
 * we first find the maximum element and place the maximum element 
 * at the end.
 * 
 * Pattern: Binary Heap. Build a Max-Heap (for ascending order) and 
 * repeatedly extract the maximum element to the end of the array.
 * 
 * Time Complexity: O(n log n) for all cases.
 * Space Complexity: O(1) in-place.
 */

import Foundation

class Solution {
    /**
     * Sorts an array using Heap Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func heapSort(_ array: inout [Int]) {
        let n = array.count
        if n <= 1 { return }
        
        // Build Max-Heap (start from the last non-leaf node)
        for i in (0..<n/2).reversed() {
            heapify(&array, n, i)
        }
        
        // Extract elements from heap one by one
        for i in (1..<n).reversed() {
            // Swap current root to end
            array.swapAt(0, i)
            // Call max heapify on the reduced heap
            heapify(&array, i, 0)
        }
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
var testArr = [12, 11, 13, 5, 6, 7]
sol.heapSort(&testArr)
print("Heap Sort Result: \(testArr)") // Expected: [5, 6, 7, 11, 12, 13]

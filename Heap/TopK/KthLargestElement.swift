/**
 * Problem: Kth Largest Element in an Array
 * Topic: Heap / TopK
 * 
 * Description:
 * Given an integer array nums and an integer k, return the kth 
 * largest element in the array. Note that it is the kth largest 
 * element in the sorted order, not the kth distinct element.
 * 
 * Pattern: Min-Heap of size K.
 * 1. Build a Min-Heap of the first k elements.
 * 2. For the remaining n - k elements:
 *    - If the current element is greater than the heap root, 
 *      replace the root and heapify.
 * 3. Root of the heap is the kth largest element.
 * 
 * Time Complexity: O(n log k).
 * Space Complexity: O(k).
 */

import Foundation

class KthLargestSolver {
    /**
     * Finds the kth largest element.
     * - Parameters:
     *   - nums: Input array.
     *   - k: Path index.
     * - Returns: K-th largest value.
     */
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // Min-Heap (using sorted array as simplified Priority Queue)
        var minHeap = [Int]()
        
        for num in nums {
            if minHeap.count < k {
                // Initial building
                minHeap.append(num)
                minHeap.sort()
            } else if num > minHeap[0] {
                // Replacement and re-sort
                minHeap[0] = num
                minHeap.sort()
            }
        }
        
        return minHeap[0]
    }
}

// --- Test Cases ---
let solver = KthLargestSolver()
print("3rd largest in [3,2,3,1,2,4,5,5,6]: \(solver.findKthLargest([3,2,3,1,2,4,5,5,6], 4))") 
// Expected: 4
print("2nd largest in [3,2,1,5,6,4]: \(solver.findKthLargest([3,2,1,5,6,4], 2))") 
// Expected: 5

/**
 * Problem: Kth Largest Element (using Min-Heap)
 * Topic: Heap / Kth_Element
 * 
 * Description:
 * Given an integer array nums and an integer k, return the kth largest 
 * element in the array. 
 * Note that it is the kth largest element in the sorted order, 
 * not the kth distinct element.
 * 
 * Pattern: Maintaining a min-heap of size k. If we have a min-heap 
 * containing k elements, its root will be the smallest among them, 
 * which is the kth largest element overall.
 * 
 * Time Complexity: O(n log k) where n is length of the array.
 * Space Complexity: O(k) for the heap.
 */

import Foundation

class PriorityQueue<T> {
    private var heap: [T]
    private let compare: (T, T) -> Bool
    
    init(compare: @escaping (T, T) -> Bool) {
        self.heap = []
        self.compare = compare
    }
    
    var count: Int { heap.count }
    var isEmpty: Bool { heap.isEmpty }
    var peek: T? { heap.first }
    
    func push(_ element: T) {
        heap.append(element)
        siftUp(heap.count - 1)
    }
    
    func pop() -> T? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        
        let result = heap[0]
        heap[0] = heap.removeLast()
        siftDown(0)
        return result
    }
    
    private func siftUp(_ index: Int) {
        var child = index
        while child > 0 {
            let parent = (child - 1) / 2
            if compare(heap[child], heap[parent]) {
                heap.swapAt(child, parent)
                child = parent
            } else {
                break
            }
        }
    }
    
    private func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            
            if left < heap.count && compare(heap[left], heap[candidate]) {
                candidate = left
            }
            if right < heap.count && compare(heap[right], heap[candidate]) {
                candidate = right
            }
            
            if candidate != parent {
                heap.swapAt(parent, candidate)
                parent = candidate
            } else {
                break
            }
        }
    }
}

class Solution {
    /**
     * Finds the kth largest element in an array using a Min-Heap.
     * - Parameters:
     *   - nums: The input integer array.
     *   - k: The target rank.
     * - Returns: The kth largest element.
     */
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // Create a min-heap
        let minHeap = PriorityQueue<Int>(compare: <)
        
        for num in nums {
            minHeap.push(num)
            // If heap size exceeds k, remove the smallest element
            if minHeap.count > k {
                _ = minHeap.pop()
            }
        }
        
        // The root of the min-heap is the kth largest element
        return minHeap.peek ?? 0
    }
}

// --- Test Cases ---
let sol = Solution()
print("K=2nd Largest element in [3, 2, 3, 1, 2, 4, 5, 5, 6]: \(sol.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4))") 
// Expected: 4
print("K=2nd Largest element in [3, 2, 1, 5, 6, 4]: \(sol.findKthLargest([3, 2, 1, 5, 6, 4], 2))") 
// Expected: 5

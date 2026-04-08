/**
 * Problem: Top K Frequent Elements
 * Topic: Heap / TopK_Frequent
 * 
 * Description:
 * Given an integer array nums and an integer k, return the k most 
 * frequent elements. You may return the answer in any order.
 * 
 * Pattern:
 * 1. Count frequencies using a hash map.
 * 2. Maintain a min-heap of size k based on the frequency. 
 * If a new element's frequency is higher than the root of the min-heap, 
 * pop the root and push the new element.
 * 
 * Time Complexity: O(n log k) where n is number of elements in array.
 * Space Complexity: O(n) for the frequency map.
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
     * Finds the k most frequent elements in an array.
     * - Parameters:
     *   - nums: The input integer array.
     *   - k: The target count of frequent elements.
     * - Returns: An array of top k frequent elements.
     */
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // Step 1: Count frequency
        var counts = [Int: Int]()
        for num in nums { counts[num, default: 0] += 1 }
        
        // Step 2: Use a min-heap to keep track of top K elements
        // The comparison is based on frequencies
        let minHeap = PriorityQueue<(element: Int, frequency: Int)>(compare: { $0.frequency < $1.frequency })
        
        for (num, count) in counts {
            minHeap.push((num, count))
            if minHeap.count > k {
                _ = minHeap.pop()
            }
        }
        
        // Step 3: Extract elements from the heap
        var result = [Int]()
        while !minHeap.isEmpty {
            result.append(minHeap.pop()!.element)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Top 2 Frequent in [1, 1, 1, 2, 2, 3]: \(sol.topKFrequent([1, 1, 1, 2, 2, 3], 2))") // Expected: [1, 2]
print("Top 1 Frequent in [1]: \(sol.topKFrequent([1], 1))")                             // Expected: [1]

/**
 * Problem: Kth Largest Element in a Stream
 * Topic: Heap / Kth_Element
 * 
 * Description:
 * Design a class to find the kth largest element in a stream. Note 
 * that it is the kth largest element in the sorted order, not the 
 * kth distinct element.
 * 
 * Pattern: Min-Heap of size k. The smallest element in the heap 
 * will be the kth largest element of the stream.
 * 
 * Time Complexity: O(log k) for each add.
 * Space Complexity: O(k).
 */

import Foundation

class KthLargest {
    private var heap: [Int] = []
    private let k: Int
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            add(num)
        }
    }
    
    /**
     * Adds an element into the stream and returns the kth largest.
     * - Parameters:
     *   - val: New element.
     * - Returns: The kth largest element.
     */
    func add(_ val: Int) -> Int {
        if heap.count < k {
            heap.append(val)
            heap.sort()
        } else if val > heap[0] {
            // Replace the smallest if the new value is larger
            heap[0] = val
            heap.sort()
        }
        
        return heap[0]
    }
}

// --- Test Cases ---
let kthLargest = KthLargest(3, [4, 5, 8, 2])
print("Add 3: \(kthLargest.add(3))") // Expected: 4
print("Add 5: \(kthLargest.add(5))") // Expected: 5
print("Add 10: \(kthLargest.add(10))") // Expected: 5
print("Add 9: \(kthLargest.add(9))") // Expected: 8
print("Add 4: \(kthLargest.add(4))") // Expected: 8

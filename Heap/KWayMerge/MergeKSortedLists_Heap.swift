/**
 * Problem: Merge K Sorted Lists (using Min Heap)
 * Topic: Heap / KWayMerge
 * 
 * Description:
 * You are given an array of k linked-lists lists, each linked-list is 
 * sorted in ascending order. Merge all the linked-lists into one 
 * sorted linked-list and return it.
 * 
 * Pattern: K-Way Merge. Use a Min-Heap (Priority Queue) to store 
 * the heads of all K lists. Repeatedly pop the minimum node and 
 * push its next node into the heap.
 * 
 * Time Complexity: O(N log k) where N is total nodes and k is number 
 * of lists.
 * Space Complexity: O(k) for the priority queue.
 */

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int = 0, _ next: ListNode? = nil) { self.val = val; self.next = next; }
}

class Solution {
    class NodeWrapper: Comparable {
        let node: ListNode
        init(_ node: ListNode) { self.node = node }
        
        static func < (lhs: NodeWrapper, rhs: NodeWrapper) -> Bool {
            return lhs.node.val < rhs.node.val
        }
        
        static func == (lhs: NodeWrapper, rhs: NodeWrapper) -> Bool {
            return lhs.node.val == rhs.node.val
        }
    }
    
    /**
     * Merges k sorted linked lists using a Priority Queue.
     * - Parameters:
     *   - lists: Array of heads of k sorted linked lists.
     * - Returns: The head of the single merged sorted list.
     */
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let dummy = ListNode(0)
        var current = dummy
        
        // Priority Queue implementation (simulation using sorted array for simplicity)
        var heap = [NodeWrapper]()
        
        for list in lists {
            if let node = list {
                heap.append(NodeWrapper(node))
            }
        }
        
        // Initial sort for simulation
        heap.sort()
        
        while !heap.isEmpty {
            // Simulate heap extraction (pop min)
            let minWrapper = heap.removeFirst()
            let minNode = minWrapper.node
            
            current.next = minNode
            current = current.next!
            
            // Push next node of the list into heap simulation
            if let nextNode = minNode.next {
                heap.append(NodeWrapper(nextNode))
                heap.sort() // Re-sort for simulation
            }
        }
        
        return dummy.next
    }
}

// --- Test Cases ---
let sol = Solution()
let l1 = ListNode(1, ListNode(4, ListNode(5)))
let l2 = ListNode(1, ListNode(3, ListNode(4)))
let l3 = ListNode(2, ListNode(6))

let merged = sol.mergeKLists([l1, l2, l3])
print("Merged result: \(merged?.val ?? -1)")

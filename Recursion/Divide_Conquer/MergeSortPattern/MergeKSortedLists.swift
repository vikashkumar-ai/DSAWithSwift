/**
 * Problem: Merge K Sorted Lists (Divide & Conquer)
 * Topic: Recursion / Divide_Conquer / MergeSortPattern
 * 
 * Description:
 * You are given an array of k linked-lists lists, each linked-list is 
 * sorted in ascending order. Merge all the linked-lists into one 
 * sorted linked-list and return it.
 * 
 * Pattern: Divide and Conquer. Merge pairs of lists recursively until 
 * only one list remains.
 * 
 * Time Complexity: O(N log k) where N is total nodes and k is number 
 * of lists.
 * Space Complexity: O(log k) for recursion stack.
 */

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int = 0, _ next: ListNode? = nil) { self.val = val; self.next = next; }
}

class Solution {
    /**
     * Merges k sorted linked lists using Divide and Conquer.
     * - Parameters:
     *   - lists: Array of heads of k sorted linked lists.
     * - Returns: The head of the single merged sorted list.
     */
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        return mergeSort(lists, 0, lists.count - 1)
    }
    
    private func mergeSort(_ lists: [ListNode?], _ left: Int, _ right: Int) -> ListNode? {
        if left == right { return lists[left] }
        
        let mid = left + (right - left) / 2
        let l1 = mergeSort(lists, left, mid)
        let l2 = mergeSort(lists, mid + 1, right)
        
        return mergeTwoLists(l1, l2)
    }
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var current = dummy
        
        var left = l1
        var right = l2
        while left != nil && right != nil {
            if left!.val < right!.val {
                current.next = left
                left = left?.next
            } else {
                current.next = right
                right = right?.next
            }
            current = current.next!
        }
        
        current.next = left ?? right
        return dummy.next
    }
}

// --- Test Cases ---
let sol = Solution()
let l1 = ListNode(1, ListNode(4, ListNode(5)))
let l2 = ListNode(1, ListNode(3, ListNode(4)))
let l3 = ListNode(2, ListNode(6))

let merged = sol.mergeKLists([l1, l2, l3])
print("Merged K Sorted Lists: \(merged?.val ?? -1)")
// Expected result would be 1 -> 1 -> 2 -> 3 -> 4 -> 4 -> 5 -> 6

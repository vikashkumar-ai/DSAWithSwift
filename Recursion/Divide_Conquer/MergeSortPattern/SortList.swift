/**
 * Problem: Sort List (using Merge Sort)
 * Topic: Recursion / Divide_Conquer / MergeSortPattern
 * 
 * Description:
 * Given the head of a linked list, return the list after sorting it 
 * in ascending order.
 * 
 * Pattern: Divide and Conquer. Use fast/slow pointers to find the 
 * middle node. Sort left and right halves recursively, then merge 
 * them in O(n) time.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(log n) for recursion stack.
 */

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) { self.val = val; self.next = nil; }
}

class Solution {
    /**
     * Sorts a linked list using Merge Sort.
     * - Parameters:
     *   - head: The head of the unsorted linked list.
     * - Returns: The head of the sorted linked list.
     */
    func sortList(_ head: ListNode?) -> ListNode? {
        // Base case: null or single node
        if head == nil || head?.next == nil { return head }
        
        // Step 1: Split the list into two halves
        let prev = findMid(head)
        let mid = prev?.next
        prev?.next = nil // Cut the connection
        
        let left = sortList(head)
        let right = sortList(mid)
        
        // Step 2: Merge the sorted halves
        return merge(left, right)
    }
    
    /**
     * Finds the middle node of the linked list using fast/slow pointers.
     */
    private func findMid(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head?.next
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    /**
     * Merges two sorted linked lists.
     */
    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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
let head = ListNode(4); head.next = ListNode(2); head.next?.next = ListNode(1); head.next?.next?.next = ListNode(3)
let sorted = sol.sortList(head)
print("Sorted Linked List: \(sorted?.val ?? -1) -> \(sorted?.next?.val ?? -1) -> \(sorted?.next?.next?.val ?? -1) -> \(sorted?.next?.next?.next?.val ?? -1)")
// Expected: 1 -> 2 -> 3 -> 4

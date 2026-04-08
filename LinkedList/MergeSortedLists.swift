/**
 * Problem: Merge Two Sorted Lists
 * Topic: Linked List / Merging
 * 
 * Description:
 * Merge two sorted linked lists and return it as a new sorted list. 
 * The new list should be made by splicing together the nodes of 
 * the first two lists.
 * 
 * Time Complexity: O(n + m) where n and m are lengths of l1 and l2.
 * Space Complexity: O(1) as we are only changing pointers.
 */

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) { self.val = val; self.next = nil; }
}

class Solution {
    /**
     * Merges two sorted lists in non-decreasing order.
     * - Parameters:
     *   - l1: The head of the first sorted list.
     *   - l2: The head of the second sorted list.
     * - Returns: The head of the merged list.
     */
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // Step 1: Create a dummy node to simplify return of the merged list
        let dummy = ListNode(0)
        var current = dummy
        
        var p1 = l1
        var p2 = l2
        
        // Step 2: Iterate while both lists have elements
        while p1 != nil && p2 != nil {
            if p1!.val <= p2!.val {
                current.next = p1
                p1 = p1?.next
            } else {
                current.next = p2
                p2 = p2?.next
            }
            current = current.next!
        }
        
        // Step 3: Append the remaining elements of the list that was not exhausted
        current.next = (p1 != nil) ? p1 : p2
        
        return dummy.next
    }
}

// --- Helper Functions for testing ---
func printList(_ head: ListNode?) {
    var current = head
    var result = [Int]()
    while current != nil {
        result.append(current!.val)
        current = current?.next
    }
    print(result.map { String($0) }.joined(separator: " -> "))
}

// --- Test Cases ---
let sol = Solution()
let l1 = ListNode(1); l1.next = ListNode(2); l1.next?.next = ListNode(4)
let l2 = ListNode(1); l2.next = ListNode(3); l2.next?.next = ListNode(4)

print("List 1: 1 -> 2 -> 4")
print("List 2: 1 -> 3 -> 4")
let merged = sol.mergeTwoLists(l1, l2)
print("Merged Sorted Lists:")
printList(merged) // Expected: 1 -> 1 -> 2 -> 3 -> 4 -> 4

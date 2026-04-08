/**
 * Problem: Reverse Linked List
 * Topic: Linked List / Patterns
 * 
 * Description:
 * Given the head of a singly linked list, reverse the list, and return 
 * the reversed list.
 * 
 * Time Complexity: O(n) where n is length of the linked list.
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
     * Reverses a linked list in-place (iterative approach).
     * - Parameters:
     *   - head: The starting node of the list.
     * - Returns: The new head of the reversed list.
     */
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var current = head
        
        while current != nil {
            let nextTemp = current?.next // Temporarily store the next node
            current?.next = prev         // Reverse the pointer
            prev = current               // Move prev forward
            current = nextTemp           // Move current forward
        }
        
        return prev
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
    print(result.isEmpty ? "Empty" : result.map { String($0) }.joined(separator: " -> "))
}

// --- Test Cases ---
let sol = Solution()
let head = ListNode(1); head.next = ListNode(2); head.next?.next = ListNode(3); head.next?.next?.next = ListNode(4)
print("Original List:")
printList(head) // Expected: 1 -> 2 -> 3 -> 4
let reversed = sol.reverseList(head)
print("Reversed List:")
printList(reversed) // Expected: 4 -> 3 -> 2 -> 1

/**
 * Problem: Linked List Cycle
 * Topic: Linked List / Detection (Floyd's Tortoise and Hare)
 * 
 * Description:
 * Given head, the head of a linked list, determine if the linked list has 
 * a cycle in it.
 * 
 * Time Complexity: O(n) where n is length of the linked list.
 * Space Complexity: O(1) as we are only using two pointers.
 */

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) { self.val = val; self.next = nil; }
}

class Solution {
    /**
     * Detects if a cycle exists in a linked list using slow and fast pointers.
     * - Parameters:
     *   - head: The starting node of the list.
     * - Returns: A boolean value of true if a cycle is present.
     */
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            // Move slow pointer by 1 step
            slow = slow?.next
            // Move fast pointer by 2 steps
            fast = fast?.next?.next
            
            // If they meet, a cycle exists
            if slow === fast {
                return true
            }
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
let head = ListNode(3)
let cycleNode = ListNode(2)
head.next = cycleNode
head.next?.next = ListNode(0)
head.next?.next?.next = ListNode(-4)
head.next?.next?.next?.next = cycleNode // Create cycle back to index 1

print("Has Cycle in [3,2,0,-4] with cycle back to 2: \(sol.hasCycle(head))") // Expected: true
let head2 = ListNode(1)
print("Has Cycle in [1]: \(sol.hasCycle(head2))") // Expected: false

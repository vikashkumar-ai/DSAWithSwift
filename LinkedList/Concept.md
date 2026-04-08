# Linked List

A linked list is a linear data structure where elements are not stored at contiguous memory locations. Instead, each element (node) points to the next, forming a chain.

## Common Patterns

1. **Reverse Linked List**: Changing the `next` pointers to point in the opposite direction.
2. **Cycle Detection (Slow/Fast Pointers)**: Floyd's Cycle-Finding Algorithm (Tortoise and Hare).
3. **Merging Lists**: Combining two sorted lists into one.
4. **Middle of List**: Finding the middle node using slow and fast pointers.
5. **K-th Node from End**: Using two pointers with a fixed gap.

## Node Structure in Swift
```swift
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) { 
        self.val = val
        self.next = nil 
    }
}
```
Linked lists in Swift often use `Optional` types (`ListNode?`) to handle the end of the list.

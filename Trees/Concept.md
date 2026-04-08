# Tree Data Structure

A tree is a non-linear hierarchical data structure that consists of nodes connected by edges. The top-most node is called the root, and each node can have zero or more child nodes.

## Common Tree Types
1. **Binary Tree**: Each node has at most two children.
2. **Binary Search Tree (BST)**: A binary tree where the left child's value < parent's value < right child's value.
3. **Balanced Tree**: A tree where the height of the left and right subtrees of every node differs by no more than one.

## Common Patterns

1. **Traversal**: Visiting every node in a specific order.
   - **DFS**: Preorder (Root, L, R), Inorder (L, Root, R), Postorder (L, R, Root).
   - **BFS**: Level-order visiting.
2. **Recursion Patterns**: Most tree problems are solved recursively.
   - **Top-Down**: Passing values from parent to child (e.g., maximum depth).
   - **Bottom-Up**: Returning values from child to parent (e.g., balanced tree).
3. **Path Based**: Finding paths that sum to a target or determining the diameter.
4. **BST Specific**: Leveraging the sorting property for fast search/insert.

## Node Structure in Swift
```swift
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) { 
        self.val = val
        self.left = nil 
        self.right = nil
    }
}
```
Tree nodes in Swift typically use `Optional` types for children.

/**
 * Problem: Search in a Binary Search Tree
 * Topic: Trees / BST
 * 
 * Description:
 * You are given the root of a binary search tree (BST) and an integer val.
 * Find the node in the BST that the node's value equals val and return 
 * the subtree rooted with that node. If such a node does not exist, 
 * return null.
 * 
 * Time Complexity: O(h) where h is the height of the BST.
 * Space Complexity: O(h) for recursion stack or O(1) for iterative approach.
 */

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
}

class Solution {
    /**
     * Searches for a value in a BST recursively.
     * - Parameters:
     *   - root: The root node of the binary search tree.
     *   - val: The target value to find.
     * - Returns: The node matching val or nil.
     */
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        // Base case: root is nil or we found the value
        guard let root = root else { return nil }
        if root.val == val { return root }
        
        // Search in subtrees based on BST property
        if val < root.val {
            return searchBST(root.left, val)
        } else {
            return searchBST(root.right, val)
        }
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(4)
root.left = TreeNode(2); root.right = TreeNode(7)
root.left?.left = TreeNode(1); root.left?.right = TreeNode(3)

print("Search in BST Result for val=2: \(sol.searchBST(root, 2)?.val ?? -1)") // Expected: 2
print("Search in BST Result for val=5: \(sol.searchBST(root, 5)?.val ?? -1)") // Expected: -1

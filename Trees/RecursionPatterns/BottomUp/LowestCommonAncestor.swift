/**
 * Problem: Lowest Common Ancestor of a Binary Tree
 * Topic: Trees / Recursion Patterns / Bottom Up
 * 
 * Description:
 * Given a binary tree, find the lowest common ancestor (LCA) of two given 
 * nodes in the tree. The LCA is defined between two nodes p and q as the 
 * lowest node in T that has both p and q as descendants.
 * 
 * Bottom-up technique: Returning the found nodes (p or q) up to the parent, 
 * until a node is found that has p in one subtree and q in the other.
 * 
 * Time Complexity: O(n) where n is number of nodes in the binary tree.
 * Space Complexity: O(h) for recursion stack.
 */

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
}

extension TreeNode: Equatable {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs // Reference equality
    }
}

class Solution {
    /**
     * Finds the lowest common ancestor of nodes p and q.
     * - Parameters:
     *   - root: The root node of the binary tree.
     *   - p: First node to search for.
     *   - q: Second node to search for.
     * - Returns: The LCA node of p and q.
     */
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // Base cases: root is nil or we found one of the nodes
        if root == nil || root == p || root == q {
            return root
        }
        
        // Search in left and right subtrees
        let leftResult = lowestCommonAncestor(root?.left, p, q)
        let rightResult = lowestCommonAncestor(root?.right, p, q)
        
        // If both subtrees returned a non-nil value, root is the LCA
        if leftResult != nil && rightResult != nil {
            return root
        }
        
        // Otherwise, return the non-nil result from either subtree
        return leftResult ?? rightResult
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(3)
let node5 = TreeNode(5); let node1 = TreeNode(1)
root.left = node5; root.right = node1
node5.left = TreeNode(6); node5.right = TreeNode(2)
node5.right?.left = TreeNode(7); node5.right?.right = TreeNode(4)

print("LCA of 5 and 1: \(sol.lowestCommonAncestor(root, node5, node1)?.val ?? -1)") // Expected: 3
let node4 = node5.right?.right
print("LCA of 5 and 4: \(sol.lowestCommonAncestor(root, node5, node4)?.val ?? -1)") // Expected: 5

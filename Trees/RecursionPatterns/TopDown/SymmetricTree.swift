/**
 * Problem: Symmetric Tree
 * Topic: Trees / Recursion Patterns / Top Down
 * 
 * Description:
 * Given the root of a binary tree, check whether it is a mirror 
 * of itself (i.e., symmetric around its center).
 * 
 * Top-down technique: Comparing two nodes (left and right) at each level 
 * from root down to its children.
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

class Solution {
    /**
     * Checks if a binary tree is symmetric.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: A boolean value of true if the tree is symmetric.
     */
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    
    /**
     * Helper to compare two nodes as mirrors of each other.
     * - Parameters:
     *   - t1: Left node.
     *   - t2: Right node.
     */
    private func isMirror(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
        // Both are nil
        if t1 == nil && t2 == nil { return true }
        // One is nil
        if t1 == nil || t2 == nil { return false }
        
        // Values must be equal and children must be mirrors
        return (t1!.val == t2!.val) && isMirror(t1?.right, t2?.left) && isMirror(t1?.left, t2?.right)
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(1)
root.left = TreeNode(2); root.right = TreeNode(2)
root.left?.left = TreeNode(3); root.left?.right = TreeNode(4)
root.right?.left = TreeNode(4); root.right?.right = TreeNode(3)

print("Is Symmetric [1,2,2,3,4,4,3]: \(sol.isSymmetric(root))") // Expected: true
let root2 = TreeNode(1)
root2.left = TreeNode(2); root2.right = TreeNode(2)
root2.left?.right = TreeNode(3); root2.right?.right = TreeNode(3)
print("Is Symmetric [1,2,2,null,3,null,3]: \(sol.isSymmetric(root2))") // Expected: false

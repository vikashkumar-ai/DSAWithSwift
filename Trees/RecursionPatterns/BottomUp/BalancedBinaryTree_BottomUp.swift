/**
 * Problem: Balanced Binary Tree (Bottom-Up Approach)
 * Topic: Trees / Recursion Patterns / Bottom Up
 * 
 * Description:
 * Given a binary tree, determine if it is height-balanced. 
 * A binary tree is height-balanced if the left and right subtrees 
 * of every node differ in height by no more than one.
 * 
 * Bottom-up technique: Returning the height of each subtree up to the 
 * parent, while checking the balanced condition at each step.
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
     * Checks if a binary tree is balanced using bottom-up recursion.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: A boolean value of true if the tree is balanced.
     */
    func isBalanced(_ root: TreeNode?) -> Bool {
        // We use -1 as a flag to indicate the subtree is unbalanced.
        return checkHeight(root) != -1
    }
    
    /**
     * Helper to return the height of each node or -1 if unbalanced.
     */
    private func checkHeight(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        let leftHeight = checkHeight(node.left)
        if leftHeight == -1 { return -1 }
        
        let rightHeight = checkHeight(node.right)
        if rightHeight == -1 { return -1 }
        
        // If current node's subtrees are unbalanced, return -1
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        
        // Return actual height for parent
        return max(leftHeight, rightHeight) + 1
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(1)
root.left = TreeNode(2); root.right = TreeNode(2)
root.left?.left = TreeNode(3); root.left?.right = TreeNode(3)
root.left?.left?.left = TreeNode(4); root.left?.left?.right = TreeNode(4)

print("Is Balanced [1,2,2,3,3,null,null,4,4]: \(sol.isBalanced(root))") // Expected: false
let root2 = TreeNode(3); root2.left = TreeNode(9); root2.right = TreeNode(20)
print("Is Balanced [3,9,20]: \(sol.isBalanced(root2))")                // Expected: true

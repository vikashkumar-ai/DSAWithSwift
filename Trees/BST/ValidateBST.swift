/**
 * Problem: Validate Binary Search Tree
 * Topic: Trees / BST
 * 
 * Description:
 * Given the root of a binary tree, determine if it is a valid binary 
 * search tree (BST).
 * 
 * BST Condition:
 * 1. The left subtree of a node contains only nodes with keys less than the node's key.
 * 2. The right subtree of a node contains only nodes with keys greater than the node's key.
 * 3. Both the left and right subtrees must also be binary search trees.
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
     * Checks if a binary tree is a valid BST.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: A boolean value of true if the tree is a valid BST.
     */
    func isValidBST(_ root: TreeNode?) -> Bool {
        return validate(root, nil, nil)
    }
    
    /**
     * Helper to validate BST using range constraints.
     * - Parameters:
     *   - node: Current node.
     *   - min: Minimum allowed value for current node (exclusive).
     *   - max: Maximum allowed value for current node (exclusive).
     */
    private func validate(_ node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let node = node else { return true }
        
        // If current value violates the range constraints
        if let min = min, node.val <= min { return false }
        if let max = max, node.val >= max { return false }
        
        // Recursively validate subtrees with updated ranges
        return validate(node.left, min, node.val) && validate(node.right, node.val, max)
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(2); root.left = TreeNode(1); root.right = TreeNode(3)
print("Is Valid BST [2,1,3]: \(sol.isValidBST(root))") // Expected: true

let root2 = TreeNode(5); root2.left = TreeNode(1); root2.right = TreeNode(4)
root2.right?.left = TreeNode(3); root2.right?.right = TreeNode(6)
print("Is Valid BST [5,1,4,null,null,3,6]: \(sol.isValidBST(root2))") // Expected: false

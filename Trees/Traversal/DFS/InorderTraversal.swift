/**
 * Problem: Binary Tree Inorder Traversal
 * Topic: Trees / Traversal / DFS
 * 
 * Description:
 * Given the root of a binary tree, return the inorder traversal 
 * of its nodes' values. (Left -> Root -> Right).
 * 
 * Time Complexity: O(n) where n is number of nodes in the binary tree.
 * Space Complexity: O(h) where h is height of the tree for recursion stack.
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
     * Performs an inorder traversal recursively.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: An array of values in inorder.
     */
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        traverse(root, &result)
        return result
    }
    
    private func traverse(_ node: TreeNode?, _ result: inout [Int]) {
        guard let node = node else { return }
        
        // Left -> Root -> Right
        traverse(node.left, &result)
        result.append(node.val)
        traverse(node.right, &result)
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(1); root.right = TreeNode(2); root.right?.left = TreeNode(3)
print("Binary Tree Inorder Traversal [1,null,2,3]: \(sol.inorderTraversal(root))") // Expected: [1, 3, 2]

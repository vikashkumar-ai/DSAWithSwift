/**
 * Problem: Binary Tree Postorder Traversal
 * Topic: Trees / Traversal / DFS
 * 
 * Description:
 * Given the root of a binary tree, return the postorder traversal 
 * of its nodes' values. (Left -> Right -> Root).
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
     * Performs a postorder traversal recursively.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: An array of values in postorder.
     */
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        traverse(root, &result)
        return result
    }
    
    private func traverse(_ node: TreeNode?, _ result: inout [Int]) {
        guard let node = node else { return }
        
        // Left -> Right -> Root
        traverse(node.left, &result)
        traverse(node.right, &result)
        result.append(node.val)
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(1); root.right = TreeNode(2); root.right?.left = TreeNode(3)
print("Binary Tree Postorder Traversal [1,null,2,3]: \(sol.postorderTraversal(root))") // Expected: [3, 2, 1]

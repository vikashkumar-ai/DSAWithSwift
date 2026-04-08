/**
 * Problem: Maximum Depth of Binary Tree (Top-Down Approach)
 * Topic: Trees / Recursion Patterns / Top Down
 * 
 * Description:
 * Given the root of a binary tree, return its maximum depth. 
 * A binary tree's maximum depth is the number of nodes along the 
 * longest path from the root node down to the farthest leaf node.
 * 
 * Top-down technique: Passing current state (depth) from root down 
 * to its children as an argument.
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
    private var maxDepth = 0
    
    /**
     * Calculates the maximum depth using top-down recursion.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: The maximum depth found.
     */
    func maxDepth(_ root: TreeNode?) -> Int {
        traverse(root, 1)
        return maxDepth
    }
    
    /**
     * Helper to traverse and update maxDepth.
     * - Parameters:
     *   - node: Current node being visited.
     *   - currentDepth: The depth at which current node resides.
     */
    private func traverse(_ node: TreeNode?, _ currentDepth: Int) {
        guard let node = node else { return }
        
        // If current node is a leaf, update the global maxDepth
        if node.left == nil && node.right == nil {
            maxDepth = max(maxDepth, currentDepth)
        }
        
        // Pass currentDepth + 1 down to children
        traverse(node.left, currentDepth + 1)
        traverse(node.right, currentDepth + 1)
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(3); root.left = TreeNode(9); root.right = TreeNode(20)
root.right?.left = TreeNode(15); root.right?.right = TreeNode(7)

print("Maximum Depth [3,9,20,null,null,15,7]: \(sol.maxDepth(root))") // Expected: 3

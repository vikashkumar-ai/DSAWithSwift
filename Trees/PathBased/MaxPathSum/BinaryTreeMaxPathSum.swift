/**
 * Problem: Binary Tree Maximum Path Sum
 * Topic: Trees / Path Based / Max Path Sum
 * 
 * Description:
 * A path in a binary tree is a sequence of nodes where each pair of 
 * adjacent nodes in the sequence has an edge connecting them. 
 * The path sum of a path is the sum of the node's values in the path.
 * return the maximum path sum of any non-empty path.
 * 
 * Pattern: Updating a global maximum while returning the max single-path 
 * sum at each node back to its parent.
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
    private var maxSum = Int.min
    
    /**
     * Calculates the maximum path sum of any path in a binary tree.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: The overall maximum path sum found.
     */
    func maxPathSum(_ root: TreeNode?) -> Int {
        _ = calculateMaxPathDown(root)
        return maxSum
    }
    
    /**
     * Helper to return the max sum of a path starting from current node 
     * down to its children, while updating the global maxSum.
     */
    private func calculateMaxPathDown(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        // Calculate max path sum on left and right subtrees.
        // We take max(0, ...) to effectively ignore negative paths.
        let leftMax = max(0, calculateMaxPathDown(node.left))
        let rightMax = max(0, calculateMaxPathDown(node.right))
        
        // Update the global maximum path sum found so far.
        // The path could involve both left and right subtrees passing through current node.
        maxSum = max(maxSum, node.val + leftMax + rightMax)
        
        // Return the maximum sum of a path starting at node and going down 
        // through only one of its subtrees back to the parent.
        return node.val + max(leftMax, rightMax)
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(-10); root.left = TreeNode(9); root.right = TreeNode(20)
root.right?.left = TreeNode(15); root.right?.right = TreeNode(7)

print("Max Path Sum [-10,9,20,null,null,15,7]: \(sol.maxPathSum(root))") // Expected: 42 (15 + 20 + 7)

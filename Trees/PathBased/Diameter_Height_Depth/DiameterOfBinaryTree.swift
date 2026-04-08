/**
 * Problem: Diameter of Binary Tree
 * Topic: Trees / Path Based / Diameter_Height_Depth
 * 
 * Description:
 * The diameter of a binary tree is the length of the longest path 
 * between any two nodes in a tree. This path may or may not pass 
 * through the root.
 * 
 * Pattern: At each node, calculate the height of its left and right 
 * subtrees. The diameter passing through this node is (leftHeight + rightHeight).
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
    private var maxDiameter = 0
    
    /**
     * Calculates the diameter of a binary tree.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: The longest diameter found.
     */
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = calculateHeight(root)
        return maxDiameter
    }
    
    /**
     * Helper to return the height of each node, while updating maxDiameter.
     */
    private func calculateHeight(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        let leftHeight = calculateHeight(node.left)
        let rightHeight = calculateHeight(node.right)
        
        // Update the maximum diameter encountered so far
        maxDiameter = max(maxDiameter, leftHeight + rightHeight)
        
        // Return height back to the parent
        return max(leftHeight, rightHeight) + 1
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(1); root.left = TreeNode(2); root.right = TreeNode(3)
root.left?.left = TreeNode(4); root.left?.right = TreeNode(5)

print("Diameter of Binary Tree [1,2,3,4,5]: \(sol.diameterOfBinaryTree(root))") // Expected: 3 ([4,2,5] or [4,2,1,3])

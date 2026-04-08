/**
 * Problem: Binary Tree Paths
 * Topic: Recursion / Backtracking / Exploration / DecisionTree
 * 
 * Description:
 * Given the root of a binary tree, return all root-to-leaf paths 
 * in any order. A leaf is a node with no children.
 * 
 * Pattern: At each node, explore the decision to go left or right. 
 * This effectively forms a decision tree that reaches all leaf nodes.
 * 
 * Time Complexity: O(n) where n is total nodes in the binary tree.
 * Space Complexity: O(h) for recursion stack, where h is height.
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
     * Finds all root-to-leaf paths.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: Array of all path strings.
     */
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var paths = [String]()
        backtrack(root, "", &paths)
        return paths
    }
    
    private func backtrack(_ node: TreeNode?, _ currentPath: String, _ paths: inout [String]) {
        guard let node = node else { return }
        
        // Append current node value to path
        let newPath = currentPath.isEmpty ? "\(node.val)" : "\(currentPath)->\(node.val)"
        
        // If leaf, add path to final result
        if node.left == nil && node.right == nil {
            paths.append(newPath)
            return
        }
        
        // Explore decisions (left and right branches)
        backtrack(node.left, newPath, &paths)
        backtrack(node.right, newPath, &paths)
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(1); root.left = TreeNode(2); root.right = TreeNode(3)
root.left?.right = TreeNode(5)

print("Binary Tree Paths: \(sol.binaryTreePaths(root))")
// Expected: ["1->2->5", "1->3"]

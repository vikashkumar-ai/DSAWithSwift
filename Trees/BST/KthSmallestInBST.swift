/**
 * Problem: Kth Smallest Element in a BST
 * Topic: Trees / BST
 * 
 * Description:
 * Given the root of a binary search tree and an integer k, return 
 * the kth smallest value (1-indexed) of all the values of the nodes 
 * in the tree.
 * 
 * Pattern: In-order traversal. Since in-order traversal of a BST 
 * yields nodes in ascending order, the kth node visited is the 
 * kth smallest element.
 * 
 * Time Complexity: O(h + k).
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
    private var count = 0
    private var result = -1
    
    /**
     * Finds the kth smallest value in a BST.
     * - Parameters:
     *   - root: The root of the BST.
     *   - k: The target rank.
     * - Returns: The kth smallest value.
     */
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        count = k
        inorder(root)
        return result
    }
    
    private func inorder(_ node: TreeNode?) {
        guard let node = node else { return }
        
        // Explore left
        inorder(node.left)
        
        // Process current
        count -= 1
        if count == 0 {
            result = node.val
            return
        }
        
        // If result already found, shortcircuit
        if result != -1 { return }
        
        // Explore right
        inorder(node.right)
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(3)
root.left = TreeNode(1); root.left?.right = TreeNode(2)
root.right = TreeNode(4)

print("K=1st Smallest: \(sol.kthSmallest(root, 1))") // Expected: 1
print("K=3rd Smallest: \(sol.kthSmallest(root, 3))") // Expected: 3

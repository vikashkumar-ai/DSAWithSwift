/**
 * Problem: Height of Binary Tree
 * Topic: Trees / Path Based / Diameter_Height_Depth
 * 
 * Description:
 * Given the root of a binary tree, return its height. 
 * The height of a binary tree is the length of the longest path 
 * from the root node down to the farthest leaf node.
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
     * Calculates the height of a binary tree recursively.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: The height found.
     */
    func calculateHeight(_ root: TreeNode?) -> Int {
        // Base case: nil node has height 0
        guard let root = root else { return 0 }
        
        // Recursive step: 1 + max(height of left, height of right)
        return 1 + max(calculateHeight(root.left), calculateHeight(root.right))
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(3); root.left = TreeNode(9); root.right = TreeNode(20)
root.right?.left = TreeNode(15); root.right?.right = TreeNode(7)

print("Height of Binary Tree [3,9,20,null,null,15,7]: \(sol.calculateHeight(root))") // Expected: 3

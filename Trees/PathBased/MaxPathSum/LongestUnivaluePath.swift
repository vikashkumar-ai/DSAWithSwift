/**
 * Problem: Longest Univalue Path
 * Topic: Trees / PathBased / MaxPathSum
 * 
 * Description:
 * Given the root of a binary tree, return the length of the longest 
 * path, where each node in the path has the same value. 
 * This path may or may not pass through the root.
 * 
 * Pattern: Modified DFS. At each node, calculate the extension lengths 
 * of the same-value paths to the left and right. Update a global maximum.
 * 
 * Time Complexity: O(n).
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
    private var maxPath = 0
    
    /**
     * Finds the length of the longest univalue path.
     * - Parameters:
     *   - root: The root of the binary tree.
     * - Returns: The length of the longest path.
     */
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        _ = calculateLen(root)
        return maxPath
    }
    
    private func calculateLen(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        let leftLen = calculateLen(node.left)
        let rightLen = calculateLen(node.right)
        
        var leftExtend = 0
        var rightExtend = 0
        
        // If left child exists and has same value, extend path
        if let left = node.left, left.val == node.val {
            leftExtend = leftLen + 1
        }
        
        // If right child exists and has same value, extend path
        if let right = node.right, right.val == node.val {
            rightExtend = rightLen + 1
        }
        
        // Update global max with current combined path
        maxPath = max(maxPath, leftExtend + rightExtend)
        
        // Return the longer leg for the parent to use
        return max(leftExtend, rightExtend)
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(5)
root.left = TreeNode(4); root.left?.left = TreeNode(1); root.left?.right = TreeNode(1)
root.right = TreeNode(5); root.right?.right = TreeNode(5)

print("Longest Univalue Path: \(sol.longestUnivaluePath(root))")
// Expected: 2 (Path 5-5-5)

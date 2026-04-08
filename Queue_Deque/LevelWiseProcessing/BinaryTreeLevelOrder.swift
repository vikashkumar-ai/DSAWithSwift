/**
 * Problem: Binary Tree Level Order Traversal
 * Topic: Queue / Level Wise Processing
 * 
 * Description:
 * Given the root of a binary tree, return the level order traversal of 
 * its nodes' values. (i.e., from left to right, level by level).
 * 
 * Time Complexity: O(n) where n is number of nodes in the binary tree.
 * Space Complexity: O(w) where w is the maximum width of the tree.
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
     * Performs a level-order traversal (BFS) using a Queue.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: A 2D array representing nodes at each level.
     */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            let levelSize = queue.count
            var currentLevelNodes = [Int]()
            
            // Process all nodes at the current level
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                currentLevelNodes.append(node.val)
                
                // Add children to the queue for the next level
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            
            result.append(currentLevelNodes)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

print("Binary Tree Level Order Traversal [3,9,20,null,null,15,7]: \(sol.levelOrder(root))") 
// Expected: [[3], [9, 20], [15, 7]]

/**
 * Problem: Binary Tree Zigzag Level Order Traversal
 * Topic: Queue_Deque / LevelWiseProcessing
 * 
 * Description:
 * Given the root of a binary tree, return the zigzag level order 
 * traversal of its nodes' values. (i.e., from left to right, 
 * then right to left for the next level and alternate between).
 * 
 * Pattern: Level-wise processing using a Queue (BFS). For each level, 
 * decide whether to append or prepend the current node's value 
 * based on the level's parity.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n) for the queue.
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
     * Traverses a binary tree in zigzag level order.
     * - Parameters:
     *   - root: The root of the tree.
     * - Returns: A 2D array representing zigzag levels.
     */
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result = [[Int]]()
        var queue = [root]
        var leftToRight = true
        
        while !queue.isEmpty {
            let levelSize = queue.count
            var currentLevel = [Int]()
            
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                
                // Add value according to current direction
                if leftToRight {
                    currentLevel.append(node.val)
                } else {
                    currentLevel.insert(node.val, at: 0)
                }
                
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            
            result.append(currentLevel)
            // Flip direction for the next level
            leftToRight = !leftToRight
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

print("Zigzag Level Order: \(sol.zigzagLevelOrder(root))")
// Expected: [[3], [20, 9], [15, 7]]

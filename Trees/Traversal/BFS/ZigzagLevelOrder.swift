/**
 * Problem: Binary Tree Zigzag Level Order Traversal
 * Topic: Trees / Traversal / BFS
 * 
 * Description:
 * Given the root of a binary tree, return the zigzag level order 
 * traversal of its nodes' values. (i.e., from left to right, then 
 * right to left for the next level and alternate between).
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
     * Performs a zigzag level-order traversal using a Queue.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: A 2D array of values in zigzag order.
     */
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        var leftToRight = true
        
        while !queue.isEmpty {
            let levelSize = queue.count
            var currentLevel = [Int]()
            
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                
                // Add node value based on current direction
                if leftToRight {
                    currentLevel.append(node.val)
                } else {
                    currentLevel.insert(node.val, at: 0)
                }
                
                // Add children to queue for next level
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            
            result.append(currentLevel)
            leftToRight.toggle() // Switch direction for next level
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

print("Binary Tree Zigzag Level Order [3,9,20,null,null,15,7]: \(sol.zigzagLevelOrder(root))") 
// Expected: [[3], [20, 9], [15, 7]]

/**
 * Problem: Binary Tree Right Side View
 * Topic: Trees / Traversal / BFS
 * 
 * Description:
 * Given the root of a binary tree, imagine yourself standing on the right 
 * side of it, return the values of the nodes you can see ordered from 
 * top to bottom.
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
     * Performs a level-order traversal and extracts the last node of each level.
     * - Parameters:
     *   - root: The root node of the binary tree.
     * - Returns: An array of values in right side view order.
     */
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result = [Int]()
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            let levelSize = queue.count
            
            for index in 0..<levelSize {
                let node = queue.removeFirst()
                
                // If current node is the last node in the current level
                if index == levelSize - 1 {
                    result.append(node.val)
                }
                
                // Add children to queue for next level
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let root = TreeNode(1); root.left = TreeNode(2); root.right = TreeNode(3)
root.left?.right = TreeNode(5); root.right?.right = TreeNode(4)

print("Binary Tree Right Side View [1,2,3,null,5,null,4]: \(sol.rightSideView(root))") 
// Expected: [1, 3, 4]

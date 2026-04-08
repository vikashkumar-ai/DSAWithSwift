/**
 * Problem: All Paths From Source to Target
 * Topic: Graphs / Traversal / DFS
 * 
 * Description:
 * Given a directed acyclic graph (DAG) of n nodes labeled from 0 to n - 1, 
 * find all possible paths from node 0 to node n - 1 and return 
 * them in any order.
 * 
 * Pattern: Deep-First Search (DFS). At each node, explore all possible 
 * paths starting from it to the target node.
 * 
 * Time Complexity: O(2ⁿ * n).
 * Space Complexity: O(n) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Finds all possible paths from source to target.
     * - Parameters:
     *   - graph: A directed acyclic graph where graph[i] is a list 
     *     of nodes you can visit from node i.
     * - Returns: A 2D array representing all paths.
     */
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        var currentPath = [Int]()
        
        // Start DFS from node 0
        dfs(graph, 0, &currentPath, &result)
        
        return result
    }
    
    private func dfs(_ u: Int, _ graph: [[Int]], _ current: inout [Int], _ result: inout [[Int]]) {
        // Choose candidate
        current.append(u)
        
        // Base case: we reached the target node (n-1)
        if u == graph.count - 1 {
            result.append(current)
        } else {
            // Explore
            for neighbor in graph[u] {
                dfs(neighbor, graph, &current, &result)
            }
        }
        
        // Unchoose (Backtrack)
        current.removeLast()
    }
}

// --- Test Cases ---
let sol = Solution()
print("All paths for [[1,2],[3],[3],[]]: \(sol.allPathsSourceTarget([[1,2],[3],[3],[]]))") 
// Expected: [[0, 1, 3], [0, 2, 3]]
print("All paths for [[4,3,1],[3,2,4],[3],[4],[]]: \(sol.allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]]))") 
// Expected: [[0, 4], [0, 3, 4], [0, 1, 3, 4], [0, 1, 2, 3, 4], [0, 1, 4]]

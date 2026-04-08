/**
 * Problem: Cycle Detection in Undirected Graph (DFS)
 * Topic: Graphs / CycleDetection / Undirected
 * 
 * Description:
 * Given an undirected graph, determine if it contains any cycle 
 * using Depth-First Search.
 * 
 * Pattern: DFS traversal. An undirected graph has a cycle if during 
 * DFS, we encounter a visited node that is not the parent of 
 * the current node.
 * 
 * Time Complexity: O(V + E).
 * Space Complexity: O(V) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Detects if an undirected graph has a cycle using DFS.
     * - Parameters:
     *   - n: Number of vertices.
     *   - adj: Adjacency list representation.
     * - Returns: True if a cycle is detected.
     */
    func hasCycle(_ n: Int, _ adj: [[Int]]) -> Bool {
        var visited = Array(repeating: false, count: n)
        
        for i in 0..<n {
            if !visited[i] {
                if dfs(i, -1, adj, &visited) {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func dfs(_ u: Int, _ parent: Int, _ adj: [[Int]], _ visited: inout [Bool]) -> Bool {
        visited[u] = true
        
        for v in adj[u] {
            if !visited[v] {
                if dfs(v, u, adj, &visited) {
                    return true
                }
            } else if v != parent {
                // If adjacent node is visited and not the parent, a cycle exists
                return true
            }
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
print("Has Cycle (DFS) in [[1,2],[0,2],[0,1]]: \(sol.hasCycle(3, [[1,2],[0,2],[0,1]]))") // Expected: true
print("Has Cycle (DFS) in [[1],[0,2],[1]]: \(sol.hasCycle(3, [[1],[0,2],[1]]))")          // Expected: false

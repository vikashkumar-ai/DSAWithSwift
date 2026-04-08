/**
 * Problem: Cycle Detection in Undirected Graph (BFS)
 * Topic: Graphs / CycleDetection / Undirected
 * 
 * Description:
 * Given an undirected graph, determine if it contains any cycle. 
 * A cycle exists if we visit a node that has already been visited 
 * and it's not the immediate parent of the current node.
 * 
 * Pattern: Breadth-First Search (BFS). Keep track of the parent of 
 * each node to avoid considering moving back to the parent as a cycle.
 * 
 * Time Complexity: O(V + E).
 * Space Complexity: O(V).
 */

import Foundation

class Solution {
    /**
     * Detects if an undirected graph has a cycle using BFS.
     * - Parameters:
     *   - n: Number of vertices.
     *   - adj: Adjacency list representation of the graph.
     * - Returns: True if a cycle is detected.
     */
    func hasCycle(_ n: Int, _ adj: [[Int]]) -> Bool {
        var visited = Array(repeating: false, count: n)
        
        for i in 0..<n {
            if !visited[i] {
                if bfs(i, n, adj, &visited) {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func bfs(_ startNode: Int, _ n: Int, _ adj: [[Int]], _ visited: inout [Bool]) -> Bool {
        // Queue stores (currentNode, parentNode)
        var queue = [(startNode, -1)]
        visited[startNode] = true
        
        var head = 0
        while head < queue.count {
            let (u, parent) = queue[head]
            head += 1
            
            for v in adj[u] {
                if !visited[v] {
                    visited[v] = true
                    queue.append((v, u))
                } else if v != parent {
                    // Visited node that is not the parent implies a cycle
                    return true
                }
            }
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
// Graph with cycle: 0-1, 1-2, 2-0
print("Has Cycle in [[1,2],[0,2],[0,1]]: \(sol.hasCycle(3, [[1,2],[0,2],[0,1]]))") // Expected: true
// Graph without cycle: 0-1, 1-2
print("Has Cycle in [[1],[0,2],[1]]: \(sol.hasCycle(3, [[1],[0,2],[1]]))")          // Expected: false

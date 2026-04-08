/**
 * Problem: Topological Sort (DFS Implementation)
 * Topic: Graphs / TopologicalSort / DFSBasedTopoSort
 * 
 * Description:
 * Given a Directed Acyclic Graph (DAG) with V vertices and E edges, 
 * find a topological sort of the graph.
 * 
 * Pattern: DFS with Post-Order Stack.
 * 1. Visit DFS recursively for each unvisited node.
 * 2. Mark the node as visited.
 * 3. After visiting all its neighbors, push the current node to 
 *    a stack (or append to a result array and reverse at the end).
 * 
 * Time Complexity: O(V + E).
 * Space Complexity: O(V + E).
 */

import Foundation

class TopologicalSortDFS {
    /**
     * Finds a topological ordering of the graph.
     * - Parameters:
     *   - n: Number of vertices (0 to n-1).
     *   - adj: Adjacency list representation.
     * - Returns: Topological ordering or empty if not possible.
     */
    func topoSort(_ n: Int, _ adj: [[Int]]) -> [Int] {
        var visited = Array(repeating: false, count: n)
        var stack = [Int]()
        
        for i in 0..<n {
            if !visited[i] {
                dfs(i, adj, &visited, &stack)
            }
        }
        
        // Post-order stack needs to be reversed
        return stack.reversed()
    }
    
    private func dfs(_ u: Int, _ adj: [[Int]], _ visited: inout [Int: Bool], _ stack: inout [Int]) {
        visited[u] = true
        
        for v in adj[u] ?? [] {
            if !visited[v] {
                dfs(v, adj, &visited, &stack)
            }
        }
        
        // Pushing to stack after visiting all descendants
        stack.append(u)
    }
}

// Fixed-implementation to match the logic (Dict version for ease)
extension TopologicalSortDFS {
    private func dfs(_ u: Int, _ adj: [[Int]], _ visited: inout [Bool], _ stack: inout [Int]) {
        visited[u] = true
        
        for v in adj[u] {
            if !visited[v] {
                dfs(v, adj, &visited, &stack)
            }
        }
        
        stack.append(u)
    }
}

// --- Test Cases ---
let solver = TopologicalSortDFS()
let adj1 = [[], [], [3], [1], [0, 1], [0, 2]]
let result = solver.topoSort(6, adj1)
print("Topological Order (DFS-based): \(result)")
// Expected: [5, 4, 2, 3, 1, 0] (one possible ordering)

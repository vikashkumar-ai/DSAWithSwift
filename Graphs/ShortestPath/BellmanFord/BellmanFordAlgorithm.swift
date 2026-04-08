/**
 * Problem: Bellman-Ford Algorithm (Shortest Path with Negative Edges)
 * Topic: Graphs / Shortest Path / BellmanFord
 * 
 * Description:
 * Given a weighted directed graph with n nodes and a source node src, 
 * find the shortest path from src to all other nodes. Unlike Dijkstra, 
 * Bellman-Ford can handle negative edge weights and can also detect 
 * negative cycles.
 * 
 * Pattern: Relax all E edges exactly V-1 times. After V-1 iterations, 
 * if any edge can still be relaxed, a negative cycle exists.
 * 
 * Time Complexity: O(V * E) where V is nodes and E is edges.
 * Space Complexity: O(V) for the distance array.
 */

import Foundation

class Solution {
    /**
     * Finds shortest paths and detects negative cycles using Bellman-Ford.
     * - Parameters:
     *   - n: Total number of nodes (labeled 0 to n-1).
     *   - edges: Array of directed weighted edges [source, target, weight].
     *   - src: Starting node index.
     * - Returns: Array of shortest distances or nil if negative cycle exists.
     */
    func bellmanFord(_ n: Int, _ edges: [[Int]], _ src: Int) -> [Int]? {
        var dist = Array(repeating: Int.max, count: n)
        dist[src] = 0
        
        // Step 1: Relax all edges n-1 times
        for _ in 0..<n - 1 {
            for edge in edges {
                let u = edge[0], v = edge[1], w = edge[2]
                if dist[u] != Int.max && dist[u] + w < dist[v] {
                    dist[v] = dist[u] + w
                }
            }
        }
        
        // Step 2: Check for negative cycles
        for edge in edges {
            let u = edge[0], v = edge[1], w = edge[2]
            if dist[u] != Int.max && dist[u] + w < dist[v] {
                print("Graph contains negative cycle!")
                return nil
            }
        }
        
        return dist
    }
}

// --- Test Cases ---
let sol = Solution()
let edges = [[0, 1, -1], [0, 2, 4], [1, 2, 3], [1, 3, 2], [1, 4, 2], [3, 2, 5], [3, 1, 1], [4, 3, -3]]
if let result = sol.bellmanFord(5, edges, 0) {
    print("Bellman-Ford Result for 5 nodes starting from 0: \(result)")
    // Expected distances: [0, -1, 2, -2, 1]
}

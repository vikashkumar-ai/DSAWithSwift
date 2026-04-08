/**
 * Problem: Bellman-Ford Algorithm (Shortest Path with Negative Edges)
 * Topic: Graphs / ShortestPath / BellmanFord
 * 
 * Description:
 * The Bellman-Ford algorithm finds the shortest path from a starting 
 * node to all other nodes in a graph that may have negative edge 
 * weights.
 * 
 * Pattern: Relax all edges (n-1) times. For each relaxation pass, 
 * update distances if a shorter path is found via an edge.
 * 
 * Time Complexity: O(V * E).
 * Space Complexity: O(V).
 */

import Foundation

class Solution {
    struct Edge {
        let u: Int
        let v: Int
        let weight: Int
    }
    
    /**
     * Finds the shortest path costs from a source node.
     * - Parameters:
     *   - n: Number of nodes.
     *   - edges: Array of Edge structs.
     *   - src: Starting node.
     * - Returns: Array of distances or nil if negative cycle found.
     */
    func bellmanFord(_ n: Int, _ edges: [Edge], _ src: Int) -> [Int]? {
        var dist = Array(repeating: Int.max, count: n)
        dist[src] = 0
        
        // Relax all edges V-1 times
        for _ in 0..<n-1 {
            for edge in edges {
                if dist[edge.u] != Int.max && dist[edge.u] + edge.weight < dist[edge.v] {
                    dist[edge.v] = dist[edge.u] + edge.weight
                }
            }
        }
        
        // Check for negative weight cycles
        for edge in edges {
            if dist[edge.u] != Int.max && dist[edge.u] + edge.weight < dist[edge.v] {
                print("Negative weight cycle detected!")
                return nil
            }
        }
        
        return dist
    }
}

// --- Test Cases ---
let sol = Solution()
let edges = [
    Solution.Edge(u: 0, v: 1, weight: -1),
    Solution.Edge(u: 0, v: 2, weight: 4),
    Solution.Edge(u: 1, v: 2, weight: 3),
    Solution.Edge(u: 1, v: 3, weight: 2),
    Solution.Edge(u: 1, v: 4, weight: 2),
    Solution.Edge(u: 3, v: 2, weight: 5),
    Solution.Edge(u: 3, v: 1, weight: 1),
    Solution.Edge(u: 4, v: 3, weight: -3)
]
if let result = sol.bellmanFord(5, edges, 0) {
    print("Shortest paths from 0: \(result)")
    // Expected: [0, -1, 2, -2, 1]
}

/**
 * Problem: Floyd-Warshall Algorithm (All-Pairs Shortest Path)
 * Topic: Graphs / ShortestPath / FloydWarshall
 * 
 * Description:
 * Given a weighted graph, the Floyd-Warshall algorithm finds the 
 * shortest distances between all pairs of vertices. It can handle 
 * negative weights but not negative cycles.
 * 
 * Pattern: Dynamic Programming. For every pair (i, j), check if a 
 * path through an intermediate vertex k is shorter:
 * dp[i][j] = min(dp[i][j], dp[i][k] + dp[k][j])
 * 
 * Time Complexity: O(V³) where V is number of vertices.
 * Space Complexity: O(V²) for the distance matrix.
 */

import Foundation

class Solution {
    private let inf = Int.max / 2
    
    /**
     * Computes all-pairs shortest paths using Floyd-Warshall.
     * - Parameters:
     *   - n: Number of vertices.
     *   - edges: Weighted edges [u, v, w].
     * - Returns: A distance matrix.
     */
    func floydWarshall(n: Int, edges: [[Int]]) -> [[Int]] {
        var dist = Array(repeating: Array(repeating: inf, count: n), count: n)
        
        // Base case: distance to self is 0
        for i in 0..<n {
            dist[i][i] = 0
        }
        
        // Initial distances from edges
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            let w = edge[2]
            dist[u][v] = w
        }
        
        // Triple loop for all intermediate nodes k
        for k in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    if dist[i][k] != inf && dist[k][j] != inf {
                        dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
                    }
                }
            }
        }
        
        return dist
    }
}

// --- Test Cases ---
let sol = Solution()
let edges = [[0, 1, 3], [1, 2, 1], [0, 2, 10]]
let result = sol.floydWarshall(n: 3, edges: edges)
print("Distance Matrix (0 to 2): \(result[0][2])") // Expected: 4 (0->1->2)
print("Distance Matrix (0 to 1): \(result[0][1])") // Expected: 3

/**
 * Problem: Negative Cycle Detection (using Bellman-Ford)
 * Topic: Graphs / ShortestPath / BellmanFord
 * 
 * Description:
 * Check if a given graph contains a negative loop that allows moving 
 * infinitely in shorter paths.
 * 
 * Pattern: Relax edges one extra time (N times). If any distance 
 * update occurs after the N-1 pass, a negative cycle is present.
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
     * Detects if any negative weight cycles exist in the graph.
     * - Parameters:
     *   - n: Number of nodes.
     *   - edges: Array of Edge structs.
     * - Returns: A boolean value of true if a cycle is found.
     */
    func hasNegativeCycle(_ n: Int, _ edges: [Edge]) -> Bool {
        var dist = Array(repeating: 0, count: n)
        
        // Step 1: Run Bellman-Ford relaxation for n-1 times
        for _ in 0..<n-1 {
            for edge in edges {
                if dist[edge.u] + edge.weight < dist[edge.v] {
                    dist[edge.v] = dist[edge.u] + edge.weight
                }
            }
        }
        
        // Step 2: Run relaxation for n-th time
        for edge in edges {
            if dist[edge.u] + edge.weight < dist[edge.v] {
                return true // A shorter path found after V-1 passes
            }
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
let edgesWithCycle = [
    Solution.Edge(u: 0, v: 1, weight: 1),
    Solution.Edge(u: 1, v: 2, weight: -1),
    Solution.Edge(u: 2, v: 0, weight: -1) // Cycle: 0->1->2->0 has weight -1
]
print("Has Negative Cycle (Cycle): \(sol.hasNegativeCycle(3, edgesWithCycle))") 
// Expected: true

let edgesNoCycle = [
    Solution.Edge(u: 0, v: 1, weight: 1),
    Solution.Edge(u: 1, v: 2, weight: -1)
]
print("Has Negative Cycle (No Cycle): \(sol.hasNegativeCycle(3, edgesNoCycle))") 
// Expected: false

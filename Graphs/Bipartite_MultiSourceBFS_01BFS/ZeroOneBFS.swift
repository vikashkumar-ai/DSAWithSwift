/**
 * Problem: 0-1 BFS for Shortest Path
 * Topic: Graphs / Bipartite_MultiSourceBFS_01BFS
 * 
 * Description:
 * Given a graph where edge weights are either 0 or 1, find 
 * the shortest path from a given source node to all other nodes.
 * 
 * Pattern: Deque-based BFS.
 * 1. Initialize 'dist' array with infinity, dist[source] = 0.
 * 2. Use a Deque to manage nodes.
 * 3. Pop front: For each neighbor 'v' with edge weight 'w':
 *    - If dist[v] > dist[u] + w:
 *      - dist[v] = dist[u] + w
 *      - If w == 0, push to 'front' of Deque.
 *      - If w == 1, push to 'back' of Deque.
 * 
 * Time Complexity: O(V + E).
 * Space Complexity: O(V).
 */

import Foundation

class ZeroOneBFS {
    struct Edge {
        let to: Int
        let weight: Int
    }
    
    /**
     * Finds the shortest path to all nodes in a 0-1 graph.
     * - Parameters:
     *   - n: Number of vertices.
     *   - adj: Adjacency list representation.
     *   - source: Start node.
     * - Returns: Minimum distances.
     */
    func shortestPath(_ n: Int, _ adj: [[Edge]], _ source: Int) -> [Int] {
        var dist = Array(repeating: Int.max, count: n)
        dist[source] = 0
        
        // Simple Deque implementation using two pointers
        var deque = [source]
        var head = 0
        
        while head < deque.count {
            let u = deque[head]
            head += 1
            
            for edge in adj[u] {
                if dist[edge.to] > dist[u] + edge.weight {
                    dist[edge.to] = dist[u] + edge.weight
                    
                    if edge.weight == 0 {
                        // Push front
                        deque.insert(edge.to, at: head)
                    } else {
                        // Push back
                        deque.append(edge.to)
                    }
                }
            }
        }
        
        return dist
    }
}

// --- Test Cases ---
let solver = ZeroOneBFS()
let adj: [[ZeroOneBFS.Edge]] = [
    [ZeroOneBFS.Edge(to: 1, weight: 1), ZeroOneBFS.Edge(to: 2, weight: 0)],
    [ZeroOneBFS.Edge(to: 2, weight: 1)],
    [ZeroOneBFS.Edge(to: 3, weight: 1)],
    []
]
print("Distances from Node 0: \(solver.shortestPath(4, adj, 0))") 
// Expected: [0, 1, 0, 1]

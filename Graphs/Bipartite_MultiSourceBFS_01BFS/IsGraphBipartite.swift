/**
 * Problem: Is Graph Bipartite?
 * Topic: Graphs / Bipartite_MultiSourceBFS_01BFS
 * 
 * Description:
 * There is an undirected graph with n nodes, where each node is numbered 
 * between 0 and n-1. You are given a 2D array graph, where graph[u] 
 * is an array of nodes that node u is adjacent to.
 * Return true if the graph is bipartite, and false otherwise.
 * 
 * Pattern: BFS Coloring.
 * 1. Initialize an array 'colors' with -1 (not colored).
 * 2. Start BFS from each uncolored node. 
 * 3. Color current node with 0, and all neighbors with 1.
 * 4. If a neighbor is already colored with the same color as 
 *    the current node, return false.
 * 
 * Time Complexity: O(V + E).
 * Space Complexity: O(V).
 */

import Foundation

class BipartiteSolver {
    /**
     * Determines if a graph is bipartite using BFS.
     * - Parameters:
     *   - graph: Adjacency list representation.
     * - Returns: Boolean value true if bipartite.
     */
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let n = graph.count
        var colors = Array(repeating: -1, count: n) // -1: uncolored, 0, 1: colors
        
        for i in 0..<n {
            if colors[i] == -1 {
                // BFS to color this component
                var queue = [i]
                colors[i] = 0 // Start coloring with 0
                
                var head = 0
                while head < queue.count {
                    let u = queue[head]
                    head += 1
                    
                    for v in graph[u] {
                        if colors[v] == -1 {
                            // Assign opposite color
                            colors[v] = 1 - colors[u]
                            queue.append(v)
                        } else if colors[v] == colors[u] {
                            // Adjacent nodes have same color
                            return false
                        }
                    }
                }
            }
        }
        
        return true
    }
}

// --- Test Cases ---
let solver = BipartiteSolver()
let graph1 = [[1, 2, 3], [0, 2], [0, 1, 3], [0, 2]]
let graph2 = [[1, 3], [0, 2], [1, 3], [0, 2]]
print("Graph 1 is Bipartite: \(solver.isBipartite(graph1))") // Expected: false
print("Graph 2 is Bipartite: \(solver.isBipartite(graph2))") // Expected: true

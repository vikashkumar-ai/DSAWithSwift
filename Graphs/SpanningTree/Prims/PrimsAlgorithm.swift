/**
 * Problem: Prim's Algorithm for Minimum Spanning Tree (MST)
 * Topic: Graphs / SpanningTree / Prims
 * 
 * Description:
 * Given a connected, undirected, weighted graph, find the 
 * Minimum Spanning Tree (MST) using Prim's algorithm. 
 * Starting from an arbitrary vertex, we greedily pick the smallest 
 * edge connecting a vertex in the MST to a vertex outside.
 * 
 * Pattern: Greedy with Priority Queue.
 * 1. Initialize result with any arbitrary node.
 * 2. Maintain a Min-Heap of edges connecting MST to non-MST nodes.
 * 3. Pop the smallest edge and add it to the MST if it doesn't 
 *    connect to an already-visited vertex.
 * 
 * Time Complexity: O(E log V) or O(E log E).
 * Space Complexity: O(V + E).
 */

import Foundation

class PrimMST {
    struct Edge {
        let to: Int
        let weight: Int
    }
    
    struct PQNode: Comparable {
        let node: Int
        let weight: Int
        
        static func < (lhs: PQNode, rhs: PQNode) -> Bool {
            return lhs.weight < rhs.weight
        }
    }
    
    /**
     * Finds the MST weight using Prim's algorithm.
     * - Parameters:
     *   - n: Number of vertices (0 to n-1).
     *   - adj: Adjacency list representation.
     * - Returns: Minimum total edge weight sum.
     */
    func findMST(_ n: Int, _ adj: [[Edge]]) -> Int {
        var visited = Array(repeating: false, count: n)
        // Min-Heap (weight, node)
        var minHeap = [PQNode(node: 0, weight: 0)]
        var mstSum = 0
        var edgesCount = 0
        
        while !minHeap.isEmpty {
            // Priority Queue Pop (manual simplified implementation for test)
            minHeap.sort()
            let current = minHeap.removeFirst()
            
            if visited[current.node] { continue }
            
            visited[current.node] = true
            mstSum += current.weight
            edgesCount += 1
            
            if edgesCount == n { break }
            
            for edge in adj[current.node] {
                if !visited[edge.to] {
                    minHeap.append(PQNode(node: edge.to, weight: edge.weight))
                }
            }
        }
        
        return mstSum
    }
}

// --- Test Cases ---
let solver = PrimMST()
let adj: [[PrimMST.Edge]] = [
    [PrimMST.Edge(to: 1, weight: 10), PrimMST.Edge(to: 2, weight: 6), PrimMST.Edge(to: 3, weight: 5)],
    [PrimMST.Edge(to: 0, weight: 10), PrimMST.Edge(to: 3, weight: 15)],
    [PrimMST.Edge(to: 0, weight: 6), PrimMST.Edge(to: 3, weight: 4)],
    [PrimMST.Edge(to: 0, weight: 5), PrimMST.Edge(to: 1, weight: 15), PrimMST.Edge(to: 2, weight: 4)]
]
let mst = solver.findMST(4, adj)
print("Minimum Weight Sum (Prim): \(mst)") // Expected: 19 (5 + 4 + 10)

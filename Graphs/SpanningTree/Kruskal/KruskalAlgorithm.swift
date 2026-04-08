/**
 * Problem: Kruskal's Algorithm for Minimum Spanning Tree (MST)
 * Topic: Graphs / SpanningTree / Kruskal
 * 
 * Description:
 * Given a connected, undirected, weighted graph, find the 
 * Minimum Spanning Tree (MST) using Kruskal's algorithm. 
 * An MST is a subset of edges that connects all vertices 
 * with the minimum total edge weight, without cycles.
 * 
 * Pattern: Greedy with Disjoint Set Union (DSU). 
 * 1. Sort all edges by weight.
 * 2. Iteratively pick the smallest edge and add it to the MST 
 *    if it doesn't form a cycle (using DSU find).
 * 
 * Time Complexity: O(E log E) for sorting, plus O(E * α(V)) for DSU operations.
 * Space Complexity: O(V + E).
 */

import Foundation

class KruskalMST {
    struct Edge {
        let u: Int
        let v: Int
        let weight: Int
    }
    
    class DSU {
        private var parent: [Int]
        private var rank: [Int]
        
        init(_ n: Int) {
            parent = Array(0...n)
            rank = Array(repeating: 0, count: n + 1)
        }
        
        func find(_ i: Int) -> Int {
            if parent[i] == i { return i }
            parent[i] = find(parent[i]) // Path compression
            return parent[i]
        }
        
        func union(_ i: Int, _ j: Int) -> Bool {
            let rootI = find(i)
            let rootJ = find(j)
            
            if rootI != rootJ {
                // Union by rank
                if rank[rootI] < rank[rootJ] {
                    parent[rootI] = rootJ
                } else if rank[rootI] > rank[rootJ] {
                    parent[rootJ] = rootI
                } else {
                    parent[rootI] = rootJ
                    rank[rootJ] += 1
                }
                return true
            }
            return false // Already in the same component
        }
    }
    
    /**
     * Computes the MST using Kruskal's algorithm.
     * - Parameters:
     *   - n: Number of vertices (0 to n-1).
     *   - edges: Array of weighted edges.
     * - Returns: Minimum weight sum of the MST.
     */
    func findMST(_ n: Int, _ edges: [Edge]) -> Int {
        // Step 1: Sort edges by weight
        let sortedEdges = edges.sorted { $0.weight < $1.weight }
        
        let dsu = DSU(n)
        var mstWeight = 0
        var edgesCount = 0
        
        for edge in sortedEdges {
            // Step 2: Try to union vertices of the edge
            if dsu.union(edge.u, edge.v) {
                mstWeight += edge.weight
                edgesCount += 1
                
                // If we found n-1 edges, MST is complete
                if edgesCount == n - 1 { break }
            }
        }
        
        return mstWeight
    }
}

// --- Test Cases ---
let solver = KruskalMST()
let edges = [
    KruskalMST.Edge(u: 0, v: 1, weight: 10),
    KruskalMST.Edge(u: 0, v: 2, weight: 6),
    KruskalMST.Edge(u: 0, v: 3, weight: 5),
    KruskalMST.Edge(u: 1, v: 3, weight: 15),
    KruskalMST.Edge(u: 2, v: 3, weight: 4)
]
let mst = solver.findMST(4, edges)
print("Minimum Weight Sum (Kruskal): \(mst)") // Expected: 19 (5 + 4 + 10)

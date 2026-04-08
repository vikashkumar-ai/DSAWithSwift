/**
 * Problem: Redundant Connection (Cycle Detection)
 * Topic: Graphs / UnionFind_DSU
 * 
 * Description:
 * In this problem, a tree is an undirected graph that is connected 
 * and has no cycles. You are given a graph that started as a tree 
 * with n nodes (from 1 to n), with one additional edge added. 
 * Find the redundant edge that, if removed, would return the 
 * graph to its tree state. 
 * 
 * Pattern: Cycle Detection with DSU.
 * 1. For each edge (u, v):
 *    - Check if root(u) == root(v) using DSU find.
 *    - If they are already in the same set, this edge is redundant.
 *    - Otherwise, union(u, v) and proceed.
 * 
 * Time Complexity: O(N * α(N)).
 * Space Complexity: O(N).
 */

import Foundation

class RedundantConnectionSolver {
    class DSU {
        private var parent: [Int]
        
        init(_ n: Int) {
            parent = Array(0...n)
        }
        
        func find(_ i: Int) -> Int {
            if parent[i] == i { return i }
            parent[i] = find(parent[i])
            return parent[i]
        }
        
        func union(_ i: Int, _ j: Int) -> Bool {
            let rootI = find(i)
            let rootJ = find(j)
            
            if rootI != rootJ {
                parent[rootI] = rootJ
                return true
            }
            return false // Already connected, this edge forms a cycle
        }
    }
    
    /**
     * Finds the redundant edge to restore a tree.
     * - Parameters:
     *   - edges: Adjacency list representation.
     * - Returns: Edge forming the cycle.
     */
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        let dsu = DSU(n)
        
        for edge in edges {
            if !dsu.union(edge[0], edge[1]) {
                // If union failed, we found the redundant edge
                return edge
            }
        }
        
        return []
    }
}

// --- Test Cases ---
let solver = RedundantConnectionSolver()
let edges1 = [[1, 2], [1, 3], [2, 3]]
let edges2 = [[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]
print("Redundant edge 1: \(solver.findRedundantConnection(edges1))") // Expected: [2, 3]
print("Redundant edge 2: \(solver.findRedundantConnection(edges2))") // Expected: [1, 4]

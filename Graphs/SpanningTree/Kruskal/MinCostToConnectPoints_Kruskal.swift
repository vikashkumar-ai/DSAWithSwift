/**
 * Problem: Min Cost to Connect All Points (Kruskal's Algorithm)
 * Topic: Graphs / MST / Kruskal
 * 
 * Description:
 * You are given an array points representing integer coordinates of 
 * some points on a 2D-plane. Return the minimum cost to make all points 
 * connected.
 * 
 * Pattern: Kruskal's algorithm sorts all edges by weight and adds 
 * them to the MST one by one, using Disjoint Set Union (DSU) to 
 * avoid cycles.
 * 
 * Time Complexity: O(E log E) or O(n² log n) where n is points.
 * Space Complexity: O(n²) for all possible edges.
 */

import Foundation

class DSU {
    private var parent: [Int]
    
    init(_ n: Int) {
        self.parent = Array(0..<n)
    }
    
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x]) // Path compression
        }
        return parent[x]
    }
    
    func union(_ x: Int, _ y: Int) -> Bool {
        let rootX = find(x)
        let rootY = find(y)
        if rootX != rootY {
            parent[rootX] = rootY
            return true
        }
        return false
    }
}

class Solution {
    struct Edge {
        let u: Int
        let v: Int
        let weight: Int
    }
    
    /**
     * Calculates MST for set of points using Kruskal's Algorithm.
     * - Parameters:
     *   - points: Array of coordinates [x, y].
     * - Returns: Total minimum cost.
     */
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        var edges = [Edge]()
        
        // Step 1: Create all possible edges
        for i in 0..<n {
            for j in i + 1..<n {
                let weight = abs(points[i][0] - points[j][0]) + abs(points[i][1] - points[j][1])
                edges.append(Edge(u: i, v: j, weight: weight))
            }
        }
        
        // Step 2: Sort edges by weight
        edges.sort { $0.weight < $1.weight }
        
        // Step 3: Use DSU to pick edges without forming cycles
        let dsu = DSU(n)
        var minCost = 0
        var edgesUsed = 0
        
        for edge in edges {
            if dsu.union(edge.u, edge.v) {
                minCost += edge.weight
                edgesUsed += 1
                if edgesUsed == n - 1 { break }
            }
        }
        
        return minCost
    }
}

// --- Test Cases ---
let sol = Solution()
print("Kruskal's Min cost: \(sol.minCostConnectPoints([[0,0],[2,2],[3,10],[5,2],[7,0]]))") // Expected: 20

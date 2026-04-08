/**
 * Problem: Number of Provinces (using DSU)
 * Topic: Graphs / DSU
 * 
 * Description:
 * There are n cities. Some of them are connected, while some are not. 
 * If city a is connected directly with city b, and city b is connected 
 * directly with city c, then city a is connected indirectly with city c.
 * A province is a group of directly or indirectly connected cities and 
 * no other cities outside of the group.
 * 
 * Pattern: Disjoint Set Union (DSU) efficiently tracks connected 
 * components. Each union operation potentially reduces the number of 
 * disjoint sets (provinces).
 * 
 * Time Complexity: O(n²) to process all edges in the adjacency matrix. 
 * DSU operations are nearly O(1).
 * Space Complexity: O(n) for the parent array.
 */

import Foundation

class DSU {
    private var parent: [Int]
    private(set) var setsCount: Int
    
    init(_ n: Int) {
        self.parent = Array(0..<n)
        self.setsCount = n
    }
    
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x]) // Path compression
        }
        return parent[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        if rootX != rootY {
            parent[rootX] = rootY
            setsCount -= 1
        }
    }
}

class Solution {
    /**
     * Determines the number of provinces (connected components) using DSU.
     * - Parameters:
     *   - isConnected: n x n adjacency matrix.
     * - Returns: Total number of provinces.
     */
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        let dsu = DSU(n)
        
        for i in 0..<n {
            for j in i + 1..<n {
                if isConnected[i][j] == 1 {
                    dsu.union(i, j)
                }
            }
        }
        
        return dsu.setsCount
    }
}

// --- Test Cases ---
let sol = Solution()
let connected1 = [[1,1,0],[1,1,0],[0,0,1]]
print("Provinces in [[1,1,0],[1,1,0],[0,0,1]]: \(sol.findCircleNum(connected1))") // Expected: 2

let connected2 = [[1,0,0],[0,1,0],[0,0,1]]
print("Provinces in [[1,0,0],[0,1,0],[0,0,1]]: \(sol.findCircleNum(connected2))") // Expected: 3

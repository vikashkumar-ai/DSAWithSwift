/**
 * Problem: Disjoint Set Union (DSU) Implementation
 * Topic: Graphs / UnionFind_DSU
 * 
 * Description:
 * Implement a robust Disjoint Set Union data structure with 
 * Path Compression and Union by Rank/Size optimizations. 
 * This is used for find and union operations on disjoint sets.
 * 
 * Pattern: Union-Find with optimizations.
 * 1. Initialize 'parent' to self and 'rank' to 0.
 * 2. Find: Recursively find parent and apply path compression.
 * 3. Union: Compare ranks and attach smaller tree under larger tree.
 * 
 * Time Complexity: O(α(N)) for both operations.
 * Space Complexity: O(N).
 */

import Foundation

class DSU {
    private var parent: [Int]
    private var rank: [Int]
    private(set) var count: Int // Number of components
    
    /**
     * Initializes DSU with n elements (0 to n-1).
     * - Parameters:
     *   - n: Size of the system.
     */
    init(_ n: Int) {
        self.parent = Array(0..<n)
        self.rank = Array(repeating: 0, count: n)
        self.count = n
    }
    
    /**
     * Finds the representative/root of the set containing i.
     * - Parameters:
     *   - i: Element index.
     * - Returns: Root index.
     */
    func find(_ i: Int) -> Int {
        if parent[i] == i { return i }
        parent[i] = find(parent[i]) // Path Compression
        return parent[i]
    }
    
    /**
     * Merges sets containing i and j.
     * - Parameters:
     *   - i: First element index.
     *   - j: Second element index.
     * - Returns: True if merged, false if already in the same set.
     */
    func union(_ i: Int, _ j: Int) -> Bool {
        let rootI = find(i)
        let rootJ = find(j)
        
        if rootI != rootJ {
            // Union by Rank
            if rank[rootI] < rank[rootJ] {
                parent[rootI] = rootJ
            } else if rank[rootI] > rank[rootJ] {
                parent[rootJ] = rootI
            } else {
                parent[rootI] = rootJ
                rank[rootJ] += 1
            }
            count -= 1
            return true
        }
        return false // Cycle detected in undirected context
    }
    
    /**
     * Checks if i and j are in the same set.
     */
    func connected(_ i: Int, _ j: Int) -> Bool {
        return find(i) == find(j)
    }
}

// --- Test Cases ---
let dsu = DSU(10)
dsu.union(1, 2)
dsu.union(2, 3)
dsu.union(4, 5)
print("1 and 3 connected: \(dsu.connected(1, 3))") // Expected: true
print("1 and 4 connected: \(dsu.connected(1, 4))") // Expected: false
print("Component count: \(dsu.count)")           // Expected: 8

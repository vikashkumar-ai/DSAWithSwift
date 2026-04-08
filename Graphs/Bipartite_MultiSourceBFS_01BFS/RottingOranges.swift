/**
 * Problem: Rotting Oranges (Multi-Source BFS)
 * Topic: Graphs / Bipartite_MultiSourceBFS_01BFS
 * 
 * Description:
 * You are given an m x n grid where each cell can have one of three values:
 * 0: empty, 1: fresh orange, 2: rotten orange.
 * Every minute, any fresh orange that is 4-directionally adjacent to 
 * a rotten orange becomes rotten. Return the minimum number of 
 * minutes that must elapse until no cell has a fresh orange. 
 * If impossible, return -1.
 * 
 * Pattern: Multi-Source BFS.
 * 1. Add all initial rotten oranges to a queue with time 0.
 * 2. Maintain a count of fresh oranges.
 * 3. Standard BFS layer-by-layer: for each rotten orange, infect its 
 *    fresh neighbors, decrement the fresh count, and add them to the queue.
 * 
 * Time Complexity: O(M * N).
 * Space Complexity: O(M * N).
 */

import Foundation

class RottingOranges {
    /**
     * Calculates the minimum time for all oranges to rot.
     * - Parameters:
     *   - grid: Input grid values.
     * - Returns: Minimum minutes or -1.
     */
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var grid = grid
        var queue = [(r: Int, c: Int, t: Int)]()
        var freshCount = 0
        
        // Step 1: Initial state
        for r in 0..<m {
            for c in 0..<n {
                if grid[r][c] == 2 {
                    queue.append((r, c, 0))
                } else if grid[r][c] == 1 {
                    freshCount += 1
                }
            }
        }
        
        if freshCount == 0 { return 0 }
        
        var maxTime = 0
        var head = 0
        let dirs = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        
        // Step 2: Multi-Source BFS
        while head < queue.count {
            let (r, c, t) = queue[head]
            head += 1
            maxTime = max(maxTime, t)
            
            for d in dirs {
                let nr = r + d.0
                let nc = c + d.1
                
                if nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] == 1 {
                    grid[nr][nc] = 2 // Rot the orange
                    freshCount -= 1
                    queue.append((nr, nc, t + 1))
                }
            }
        }
        
        return (freshCount == 0) ? maxTime : -1
    }
}

// --- Test Cases ---
let solver = RottingOranges()
let grid1 = [[2, 1, 1], [1, 1, 0], [0, 1, 1]]
let grid2 = [[2, 1, 1], [0, 1, 1], [1, 0, 1]]
print("Time for Grid 1: \(solver.orangesRotting(grid1))") // Expected: 4
print("Time for Grid 2: \(solver.orangesRotting(grid2))") // Expected: -1

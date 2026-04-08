/**
 * Problem: Shortest Path in Binary Matrix
 * Topic: Graphs / Traversal / BFS
 * 
 * Description:
 * Given an n x n binary matrix grid, return the length of the shortest clear 
 * path in the matrix. If there is no clear path, return -1. 
 * A clear path is a path from (0,0) to (n-1, n-1) such that all cells are 0 
 * and connected in 8 directions.
 * 
 * Pattern: Since all edge weights are equal (each step is 1), BFS is 
 * guaranteed to find the shortest path.
 * 
 * Time Complexity: O(n²) where n is dimension of the grid (number of cells).
 * Space Complexity: O(n²) for the queue and visited set.
 */

import Foundation

class Solution {
    /**
     * Finds the shortest path in an n x n binary matrix using BFS.
     * - Parameters:
     *   - grid: The input 2D binary matrix.
     * - Returns: Length of the shortest path or -1.
     */
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let n = grid.count
        // Check if start or end are blocked
        if grid[0][0] == 1 || grid[n - 1][n - 1] == 1 { return -1 }
        
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var queue = [(r: Int, c: Int, dist: Int)]()
        
        queue.append((0, 0, 1))
        visited[0][0] = true
        
        // 8 possible directions
        let directions = [
            (1, 0), (-1, 0), (0, 1), (0, -1),
            (1, 1), (1, -1), (-1, 1), (-1, -1)
        ]
        
        while !queue.isEmpty {
            let (r, c, dist) = queue.removeFirst()
            
            // Check if we reached the target
            if r == n - 1 && c == n - 1 {
                return dist
            }
            
            // Explore all 8 neighbors
            for (dr, dc) in directions {
                let nr = r + dr
                let nc = c + dc
                
                if nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0 && !visited[nr][nc] {
                    visited[nr][nc] = true
                    queue.append((nr, nc, dist + 1))
                }
            }
        }
        
        return -1
    }
}

// --- Test Cases ---
let sol = Solution()
let grid1 = [[0,1],[1,0]]
print("Shortest Path in Grid 1 [[0,1],[1,0]]: \(sol.shortestPathBinaryMatrix(grid1))") // Expected: 2

let grid2 = [[0,0,0],[1,1,0],[1,1,0]]
print("Shortest Path in Grid 2 [[0,0,0],[1,1,0],[1,1,0]]: \(sol.shortestPathBinaryMatrix(grid2))") // Expected: 4

let grid3 = [[1,0,0],[1,1,0],[1,1,0]]
print("Shortest Path in Grid 3 (blocked start): \(sol.shortestPathBinaryMatrix(grid3))") // Expected: -1

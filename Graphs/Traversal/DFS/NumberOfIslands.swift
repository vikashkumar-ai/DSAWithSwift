/**
 * Problem: Number of Islands
 * Topic: Graphs / Traversal / DFS
 * 
 * Description:
 * Given an m x n 2D binary grid which represents a map of '1's (land) 
 * and '0's (water), return the number of islands. An island is 
 * surrounded by water and is formed by connecting adjacent lands 
 * horizontally or vertically.
 * 
 * Pattern: At each cell with '1', start a DFS to visit all connected 
 * land cells and mark them as visited ('0' or '#') to avoid re-counting.
 * 
 * Time Complexity: O(m * n) where m and n are dimensions of the grid.
 * Space Complexity: O(m * n) in worst case (recursion stack for a grid full of land).
 */

import Foundation

class Solution {
    /**
     * Finds the number of islands in a binary grid using DFS.
     * - Parameters:
     *   - grid: The input 2D binary grid.
     * - Returns: The total count of islands.
     */
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        
        var grid = grid // Mutable copy to mark visited cells
        let rows = grid.count
        let cols = grid[0].count
        var islandCount = 0
        
        for r in 0..<rows {
            for c in 0..<cols {
                // If we find land, it's a new island
                if grid[r][c] == "1" {
                    islandCount += 1
                    dfs(&grid, r, c)
                }
            }
        }
        
        return islandCount
    }
    
    /**
     * Helper to visit all connected land cells recursively.
     */
    private func dfs(_ grid: inout [[Character]], _ r: Int, _ c: Int) {
        let rows = grid.count
        let cols = grid[0].count
        
        // Out of bounds or current cell is water
        if r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] == "0" {
            return
        }
        
        // Mark current cell as visited (converting land to water)
        grid[r][c] = "0"
        
        // Visit all 4 adjacent directions
        dfs(&grid, r + 1, c)
        dfs(&grid, r - 1, c)
        dfs(&grid, r, c + 1)
        dfs(&grid, r, c - 1)
    }
}

// --- Test Cases ---
let sol = Solution()
let grid1: [[Character]] = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
print("Number of Islands in Grid 1: \(sol.numIslands(grid1))") // Expected: 1

let grid2: [[Character]] = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
print("Number of Islands in Grid 2: \(sol.numIslands(grid2))") // Expected: 3

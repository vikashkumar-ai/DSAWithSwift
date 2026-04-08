/**
 * Problem: Max Area of Island (Finding Largest Connected Component)
 * Topic: Graphs / ConnectedComponents
 * 
 * Description:
 * You are given an m x n binary matrix grid. An island is a group of 1's 
 * (representing land) connected 4-directionally (horizontal or vertical). 
 * You may assume all four edges of the grid are surrounded by water.
 * The area of an island is the number of cells with value 1 in the island.
 * Return the maximum area of an island in grid. If there is no island, return 0.
 * 
 * Pattern: DFS for Connected Components in Grids.
 * 1. Iterate through each cell of the grid.
 * 2. If the cell contains land (1) and is not visited:
 *    - Start DFS to count all connected land cells.
 *    - To avoid revisiting, sink the land (mark as 0) or use a visited set.
 * 3. Track the maximum area found.
 * 
 * Time Complexity: O(R * C).
 * Space Complexity: O(R * C) for recursion.
 */

import Foundation

class MaxAreaOfIslandSolver {
    /**
     * Finds the maximum island area.
     * - Parameters:
     *   - grid: Input matrix.
     * - Returns: Maximum area.
     */
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        var maxArea = 0
        
        for r in 0..<m {
            for c in 0..<n {
                if grid[r][c] == 1 {
                    maxArea = max(maxArea, dfs(&grid, r, c))
                }
            }
        }
        
        return maxArea
    }
    
    private func dfs(_ grid: inout [[Int]], _ r: Int, _ c: Int) -> Int {
        let m = grid.count
        let n = grid[0].count
        
        // Base case: out of bounds or water
        if r < 0 || r >= m || c < 0 || c >= n || grid[r][c] == 0 {
            return 0
        }
        
        // Sink the island to mark as visited
        grid[r][c] = 0
        
        var area = 1
        // Recursive search in 4 directions
        area += dfs(&grid, r + 1, c)
        area += dfs(&grid, r - 1, c)
        area += dfs(&grid, r, c + 1)
        area += dfs(&grid, r, c - 1)
        
        return area
    }
}

// --- Test Cases ---
let solver = MaxAreaOfIslandSolver()
let grid1 = [
    [0,0,1,0,0,0,0,1,0,0,0,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,1,1,0,1,0,0,0,0,0,0,0,0],
    [0,1,0,0,1,1,0,0,1,0,1,0,0],
    [0,1,0,0,1,1,0,0,1,1,1,0,0]
]
let grid2 = [[0,0,0,0,0,0,0,0]]
print("Max Area 1: \(solver.maxAreaOfIsland(grid1))") // Expected: 6
print("Max Area 2: \(solver.maxAreaOfIsland(grid2))") // Expected: 0

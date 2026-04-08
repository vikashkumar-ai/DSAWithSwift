/**
 * Problem: Flood Fill (Component Traversal and Modification)
 * Topic: Graphs / ConnectedComponents
 * 
 * Description:
 * An image is represented by an m x n integer grid image where 
 * image[i][j] represents the pixel value. You are given a starting 
 * pixel (sr, sc) and a newColor. Perform a flood fill starting 
 * from that pixel.
 * 
 * Pattern: BFS/DFS for a single Connected Component.
 * 1. If starting color is same as newColor, return image (already filled).
 * 2. Start DFS/BFS from (sr, sc).
 * 3. Mark the pixel with newColor.
 * 4. For each 4-directional neighbor:
 *    - If neighbor has initial color, recurse.
 * 
 * Time Complexity: O(M * N).
 * Space Complexity: O(M * N) for recursion or queue.
 */

import Foundation

class FloodFillSolver {
    /**
     * Performs flood fill.
     * - Parameters:
     *   - image: Input matrix.
     *   - sr: Start row.
     *   - sc: Start column.
     *   - newColor: Target color.
     * - Returns: Modified matrix.
     */
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var image = image
        let color = image[sr][sc]
        
        if color != newColor {
            dfs(&image, sr, sc, color, newColor)
        }
        
        return image
    }
    
    private func dfs(_ image: inout [[Int]], _ r: Int, _ c: Int, _ color: Int, _ newColor: Int) {
        let m = image.count
        let n = image[0].count
        
        if r < 0 || r >= m || c < 0 || c >= n || image[r][c] != color {
            return
        }
        
        image[r][c] = newColor
        
        dfs(&image, r + 1, c, color, newColor)
        dfs(&image, r - 1, c, color, newColor)
        dfs(&image, r, c + 1, color, newColor)
        dfs(&image, r, c - 1, color, newColor)
    }
}

// --- Test Cases ---
let solver = FloodFillSolver()
let img = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]
let result = solver.floodFill(img, 1, 1, 2)
print("Flood Fill Result: \n\(result.map { $0.description }.joined(separator: "\n"))")
// Expected: [2, 2, 2], [2, 2, 0], [2, 0, 1]

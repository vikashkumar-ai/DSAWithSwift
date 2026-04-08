/**
 * Problem: Surrounded Regions (Captured Areas)
 * Topic: Graphs / ConnectedComponents
 * 
 * Description:
 * Given an m x n matrix board containing 'X' and 'O', capture all 
 * regions that are 4-directionally surrounded by 'X'. 
 * A region is captured by flipping all 'O's into 'X's in that 
 * surrounded region.
 * 
 * Pattern: Multi-source BFS/DFS from the borders. Any 'O' on the border 
 * and its connected 'O's are not surrounded and should be marked as 
 * safe. All other 'O's are surrounded and should be flipped.
 * 
 * Time Complexity: O(M * N).
 * Space Complexity: O(M * N) for BFS queue.
 */

import Foundation

class Solution {
    /**
     * Captures surrounded regions in place.
     * - Parameters:
     *   - board: 2D character array reflecting in-place changes.
     */
    func solve(_ board: inout [[Character]]) {
        if board.isEmpty { return }
        let m = board.count
        let n = board[0].count
        
        var safe = Array(repeating: Array(repeating: false, count: n), count: m)
        var queue = [(Int, Int)]()
        
        // Edge cases: start BFS from all 'O's on the borders
        for r in 0..<m {
            if board[r][0] == "O" { queue.append((r, 0)); safe[r][0] = true }
            if board[r][n-1] == "O" { queue.append((r, n-1)); safe[r][n-1] = true }
        }
        for c in 0..<n {
            if board[0][c] == "O" && !safe[0][c] { queue.append((0, c)); safe[0][c] = true }
            if board[m-1][c] == "O" && !safe[m-1][c] { queue.append((m-1, c)); safe[m-1][c] = true }
        }
        
        // Mark all 'O's connected to border as safe
        let dirs = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        while !queue.isEmpty {
            let (r, c) = queue.removeFirst()
            for dir in dirs {
                let nr = r + dir.0
                let nc = c + dir.1
                if nr >= 0 && nr < m && nc >= 0 && nc < n && board[nr][nc] == "O" && !safe[nr][nc] {
                    safe[nr][nc] = true
                    queue.append((nr, nc))
                }
            }
        }
        
        // Flip all non-safe 'O's
        for r in 0..<m {
            for c in 0..<n {
                if board[r][c] == "O" && !safe[r][c] {
                    board[r][c] = "X"
                }
            }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var board: [[Character]] = [
  ["X","X","X","X"],
  ["X","O","O","X"],
  ["X","X","O","X"],
  ["X","O","X","X"]
]
sol.solve(&board)
print("Surrounded Board: \n\(board.map { $0.joined() }.joined(separator: "\n"))")
// Expected: Captured 'O's at (1,1), (1,2), (2,2)

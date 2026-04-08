/**
 * Problem: Sudoku Solver (Backtracking with Pruning)
 * Topic: Recursion / Backtracking / Pruning_StateTracking
 * 
 * Description:
 * Write a program to solve a Sudoku puzzle by filling the empty cells.
 * A sudoku solution must satisfy all of the following rules:
 * - Each of the digits 1-9 must occur exactly once in each row.
 * - Each of the digits 1-9 must occur exactly once in each column.
 * - Each of the digits 1-9 must occur exactly once in each of the 
 *   9 3x3 sub-boxes of the grid.
 * 
 * Pattern: Backtracking. Try each possible digit (1-9) for an empty cell 
 * and recurse to check if it leads to a solution. Prune the search 
 * by checking Sudoku rules before each recursive call.
 * 
 * Time Complexity: O(9^81) worst-case.
 * Space Complexity: O(81) for board.
 */

import Foundation

class Solution {
    /**
     * Solves a Sudoku board in-place.
     * - Parameters:
     *   - board: 2D character array of the Sudoku puzzle.
     */
    func solveSudoku(_ board: inout [[Character]]) {
        _ = solve(&board)
    }
    
    private func solve(_ board: inout [[Character]]) -> Bool {
        for r in 0..<9 {
            for c in 0..<9 {
                if board[r][c] == "." {
                    // Try each digit 1-9
                    for char in "123456789" {
                        if isValid(board, r, c, char) {
                            board[r][c] = char
                            if solve(&board) { return true }
                            board[r][c] = "." // Backtrack
                        }
                    }
                    return false // No digit works for this empty cell
                }
            }
        }
        return true // All cells filled correctly
    }
    
    private func isValid(_ board: [[Character]], _ r: Int, _ c: Int, _ char: Character) -> Bool {
        for i in 0..<9 {
            // Check row
            if board[r][i] == char { return false }
            // Check column
            if board[i][c] == char { return false }
            // Check 3x3 box
            let boxR = 3 * (r / 3) + i / 3
            let boxC = 3 * (c / 3) + i % 3
            if board[boxR][boxC] == char { return false }
        }
        return true
    }
}

// --- Test Cases ---
let sol = Solution()
var board: [[Character]] = [
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]
sol.solveSudoku(&board)
print("Sudoku solved: \n\(board.map { $0.joined() }.joined(separator: "\n"))")

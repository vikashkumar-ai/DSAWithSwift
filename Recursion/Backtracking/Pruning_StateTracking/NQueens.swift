/**
 * Problem: N-Queens
 * Topic: Recursion / Backtracking / Pruning_StateTracking
 * 
 * Description:
 * The n-queens puzzle is the problem of placing n queens on an n x n 
 * chessboard such that no two queens attack each other.
 * 
 * Time Complexity: O(n!) as we skip rows/columns/diagonals once a 
 * queen is placed.
 * Space Complexity: O(n) to store the positions of various queens 
 * and recursion depth.
 */

import Foundation

class Solution {
    /**
     * Solves the N-Queens problem and returns all unique board configurations.
     * - Parameters:
     *   - n: The number of queens and board dimension.
     * - Returns: A 2D array of board string representations.
     */
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var queens = Array(repeating: -1, count: n) // stores column index for each row
        
        var columns = Set<Int>()
        var mainDiagonals = Set<Int>() // (row - col) is constant
        var antiDiagonals = Set<Int>() // (row + col) is constant
        
        backtrack(n, 0, &queens, &columns, &mainDiagonals, &antiDiagonals, &result)
        
        return result
    }
    
    /**
     * Helper to place queens row by row.
     */
    private func backtrack(_ n: Int, _ row: Int, _ queens: inout [Int], 
                          _ columns: inout Set<Int>, _ mainDiagonals: inout Set<Int>, 
                          _ antiDiagonals: inout Set<Int>, _ result: inout [[String]]) {
        // Base case: all rows processed
        if row == n {
            result.append(createBoard(queens, n))
            return
        }
        
        for col in 0..<n {
            // Pruning: skip occupied columns and diagonals
            if columns.contains(col) || mainDiagonals.contains(row - col) || antiDiagonals.contains(row + col) {
                continue
            }
            
            // Choose
            queens[row] = col
            columns.insert(col)
            mainDiagonals.insert(row - col)
            antiDiagonals.insert(row + col)
            
            // Explore
            backtrack(n, row + 1, &queens, &columns, &mainDiagonals, &antiDiagonals, &result)
            
            // Unchoose (Backtrack)
            columns.remove(col)
            mainDiagonals.remove(row - col)
            antiDiagonals.remove(row + col)
        }
    }
    
    /**
     * Converts a configuration of queen positions into the required string format.
     */
    private func createBoard(_ queens: [Int], _ n: Int) -> [String] {
        var board = [String]()
        for i in 0..<n {
            var rowChars = Array(repeating: ".", count: n)
            rowChars[queens[i]] = "Q"
            board.append(String(rowChars))
        }
        return board
    }
}

// --- Test Cases ---
let sol = Solution()
let result4 = sol.solveNQueens(4)
print("N-Queens Result for n=4 (Number of solutions: \(result4.count)):")
for (i, board) in result4.enumerated() {
    print("Solution \(i + 1):")
    board.forEach { print($0) }
    print("")
}
// Expected: 2 solutions for n=4.

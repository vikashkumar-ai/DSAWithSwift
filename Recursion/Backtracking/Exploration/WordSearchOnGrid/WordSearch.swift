/**
 * Problem: Word Search
 * Topic: Recursion / Backtracking / Exploration / WordSearchOnGrid
 * 
 * Description:
 * Given an m x n grid of characters board and a string word, return true 
 * if word exists in the grid. The word can be constructed from letters 
 * of sequentially adjacent cells, where adjacent cells are horizontally 
 * or vertically neighboring. The same letter cell may not be used more than once.
 * 
 * Time Complexity: O(m * n * 3ⁿ) where m and n are dimensions of board and 
 * k is the length of the word.
 * Space Complexity: O(k) for the recursion stack.
 */

import Foundation

class Solution {
    /**
     * Searches for a given word in an m x n 2D grid.
     * - Parameters:
     *   - board: The input grid of characters.
     *   - word: The target string to reach.
     * - Returns: A boolean value of true if the word is found.
     */
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.isEmpty || board[0].isEmpty { return false }
        
        var board = board // Mutable copy to mark visited cells
        let chars = Array(word)
        let rows = board.count
        let cols = board[0].count
        
        for r in 0..<rows {
            for c in 0..<cols {
                // If the first character matches, start backtracking from here
                if backtrack(&board, r, c, chars, 0) {
                    return true
                }
            }
        }
        
        return false
    }
    
    /**
     * Helper to navigate the grid and match characters.
     */
    private func backtrack(_ board: inout [[Character]], _ r: Int, _ c: Int, _ chars: [Character], _ index: Int) -> Bool {
        // Base case: we matched all characters in the word
        if index == chars.count { return true }
        
        // Out of bounds or mismatch or cell already visited
        if r < 0 || r >= board.count || c < 0 || c >= board[0].count || board[r][c] != chars[index] {
            return false
        }
        
        // Mark the cell as visited to prevent reuse in current path
        let tempChar = board[r][c]
        board[r][c] = "#" // Use a special marker
        
        // Explore all 4 adjacent directions
        let res = backtrack(&board, r + 1, c, chars, index + 1) ||
                  backtrack(&board, r - 1, c, chars, index + 1) ||
                  backtrack(&board, r, c + 1, chars, index + 1) ||
                  backtrack(&board, r, c - 1, chars, index + 1)
        
        // Unchoose (Backtrack)
        board[r][c] = tempChar
        
        return res
    }
}

// --- Test Cases ---
let sol = Solution()
let board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
print("Word Search \"ABCCED\" in [[\"A\",\"B\",\"C\",\"E\"],[\"S\",\"F\",\"C\",\"S\"],[\"A\",\"D\",\"E\",\"E\"]]: \(sol.exist(board, "ABCCED"))") // Expected: true
print("Word Search \"SEE\" in given board: \(sol.exist(board, "SEE"))")                                                                        // Expected: true
print("Word Search \"ABCB\" in given board: \(sol.exist(board, "ABCB"))")                                                                      // Expected: false

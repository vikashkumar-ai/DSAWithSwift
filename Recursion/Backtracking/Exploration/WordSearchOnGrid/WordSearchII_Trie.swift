/**
 * Problem: Word Search II (using Backtracking + Trie)
 * Topic: Recursion / Backtracking / Exploration / WordSearchOnGrid
 * 
 * Description:
 * Given an m x n board of characters and a list of strings words, 
 * return all words on the board. 
 * Each word must be constructed from letters of sequentially adjacent 
 * cells, where adjacent cells are horizontally or vertically 
 * neighboring. The same letter cell may not be used more than 
 * once in a word.
 * 
 * Pattern: Trie + Backtracking. Store all target words in a Trie. 
 * For each cell on the board, perform DFS and prune the search if 
 * the current prefix doesn't exist in the Trie.
 * 
 * Time Complexity: O(M * N * 4^L) where L is max word length.
 * Space Complexity: O(Sum of Word Lengths) for the Trie.
 */

import Foundation

class Solution {
    class TrieNode {
        var children = [Character: TrieNode]()
        var word: String?
    }
    
    private let root = TrieNode()
    
    /**
     * Finds all words on the board from the given list.
     * - Parameters:
     *   - board: 2D character array.
     *   - words: Array of target strings.
     * - Returns: Array of found words.
     */
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        // Step 1: Build the Trie
        for word in words {
            var curr = root
            for char in word {
                if curr.children[char] == nil {
                    curr.children[char] = TrieNode()
                }
                curr = curr.children[char]!
            }
            curr.word = word
        }
        
        var result = Set<String>()
        var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        
        // Step 2: Explore from each cell
        for r in 0..<board.count {
            for c in 0..<board[0].count {
                backtrack(board, r, c, root, &visited, &result)
            }
        }
        
        return Array(result)
    }
    
    private func backtrack(_ board: [[Character]], _ r: Int, _ c: Int, _ node: TrieNode, _ visited: inout [[Bool]], _ result: inout Set<String>) {
        let char = board[r][c]
        guard let nextNode = node.children[char] else { return }
        
        if let word = nextNode.word {
            result.insert(word)
            // Optimization: Once word found, we don't necessarily stop 
            // since it could be a prefix of another word.
        }
        
        visited[r][c] = true
        
        let dirs = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        for dir in dirs {
            let nr = r + dir.0
            let nc = c + dir.1
            
            if nr >= 0 && nr < board.count && nc >= 0 && nc < board[0].count && !visited[nr][nc] {
                backtrack(board, nr, nc, nextNode, &visited, &result)
            }
        }
        
        visited[r][c] = false // Backtrack state
    }
}

// --- Test Cases ---
let sol = Solution()
let board: [[Character]] = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]]
let words = ["oath","pea","eat","rain"]
print("Found words: \(sol.findWords(board, words))") // Expected: ["oath", "eat"]

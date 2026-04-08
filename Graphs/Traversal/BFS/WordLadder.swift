/**
 * Problem: Word Ladder (Shortest Transformation Sequence)
 * Topic: Graphs / Traversal / BFS
 * 
 * Description:
 * Given two words, beginWord and endWord, and a dictionary wordList, 
 * return the number of words in the shortest transformation 
 * sequence from beginWord to endWord.
 * 
 * Pattern: BFS for Shortest Path in Unweighted Graph.
 * 1. Each word is a node. 
 * 2. Words differ by one character have an edge between them.
 * 3. Use BFS to find the shortest layer-by-layer distance.
 * 
 * Time Complexity: O(M^2 * N), where M is word length and N is word count.
 * Space Complexity: O(M^2 * N).
 */

import Foundation

class WordLadder {
    /**
     * Finds the length of the shortest transformation sequence.
     * - Parameters:
     *   - beginWord: Start.
     *   - endWord: Target.
     *   - wordList: Available words.
     * - Returns: Length of sequence or 0.
     */
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordSet = Set(wordList)
        if !wordSet.contains(endWord) { return 0 }
        
        var queue = [(beginWord, 1)]
        var head = 0
        
        while head < queue.count {
            let (currentWord, level) = queue[head]
            head += 1
            
            if currentWord == endWord { return level }
            
            var chars = Array(currentWord)
            for i in 0..<chars.count {
                let originalChar = chars[i]
                
                // Try all 26 possible characters
                for c in "abcdefghijklmnopqrstuvwxyz" {
                    if c == originalChar { continue }
                    chars[i] = c
                    let nextWord = String(chars)
                    
                    if wordSet.contains(nextWord) {
                        wordSet.remove(nextWord)
                        queue.append((nextWord, level + 1))
                    }
                }
                chars[i] = originalChar
            }
        }
        
        return 0
    }
}

// --- Test Cases ---
let solver = WordLadder()
print("Ladder length (hit -> cog): \(solver.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))") 
// Expected: 5 (hit -> hot -> dot -> dog -> cog)
print("Ladder length (hit -> cog): \(solver.ladderLength("hit", "cog", ["hot","dot","dog","lot","log"]))") 
// Expected: 0

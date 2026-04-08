/**
 * Problem: Design Add and Search Words Data Structure (With Wildcards)
 * Topic: Trie / AutoSuggest
 * 
 * Description:
 * Design a data structure that supports adding new words and finding 
 * if a string matches any previously added string.
 * The search method can contain the dot character '.' to represent any letter.
 * 
 * Time Complexity: O(L) for add, O(26^L) worst case for search (due to wildcards).
 * Space Complexity: O(N * L) for storing words in the trie.
 */

import Foundation

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

class WordDictionary {
    private let root: TrieNode

    /**
     * Initializes the object.
     */
    init() {
        self.root = TrieNode()
    }
    
    /**
     * Adds a word to the trie.
     */
    func addWord(_ word: String) {
        var current = root
        for char in word {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.isEndOfWord = true
    }
    
    /**
     * Returns if the word is in the data structure, supporting wildcards.
     */
    func search(_ word: String) -> Bool {
        return backtrack(Array(word), 0, root)
    }
    
    /**
     * Helper to search with wildcard using DFS/Backtracking.
     */
    private func backtrack(_ chars: [Character], _ index: Int, _ node: TrieNode) -> Bool {
        // Base case: we reached the end of the query string
        if index == chars.count {
            return node.isEndOfWord
        }
        
        let char = chars[index]
        if char == "." {
            // Wildcard: try all possible children
            for child in node.children.values {
                if backtrack(chars, index + 1, child) {
                    return true
                }
            }
            return false
        } else {
            // Precise character: go to the specific child
            guard let next = node.children[char] else {
                return false
            }
            return backtrack(chars, index + 1, next)
        }
    }
}

// --- Test Cases ---
let wordDictionary = WordDictionary()
print("WordDictionary Operations:")
wordDictionary.addWord("bad")
wordDictionary.addWord("dad")
wordDictionary.addWord("mad")
print("search(\"pad\"): \(wordDictionary.search("pad"))") // Expected: false
print("search(\"bad\"): \(wordDictionary.search("bad"))") // Expected: true
print("search(\".ad\"): \(wordDictionary.search(".ad"))") // Expected: true
print("search(\"b..\"): \(wordDictionary.search("b.."))") // Expected: true

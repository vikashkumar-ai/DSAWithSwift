/**
 * Problem: Implement Trie (Prefix Tree)
 * Topic: Trie / Prefix Search
 * 
 * Description:
 * A trie (pronounced as "try") or prefix tree is a tree data structure 
 * used to efficiently store and retrieve keys in a dataset of strings. 
 * Implement the Trie class with insert, search, and startsWith methods.
 * 
 * Time Complexity: O(L) for all operations, where L is the length of the string.
 * Space Complexity: O(N * L) in the worst case, where N is total number of strings.
 */

import Foundation

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

class Trie {
    private let root: TrieNode

    /**
     * Initializes the trie object.
     */
    init() {
        self.root = TrieNode()
    }
    
    /**
     * Inserts a word into the trie.
     */
    func insert(_ word: String) {
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
     * Returns if the word is in the trie.
     */
    func search(_ word: String) -> Bool {
        guard let node = findNode(word) else { return false }
        return node.isEndOfWord
    }
    
    /**
     * Returns if there is any word in the trie that starts with the given prefix.
     */
    func startsWith(_ prefix: String) -> Bool {
        return findNode(prefix) != nil
    }
    
    /**
     * Helper to find the node associated with a given string.
     */
    private func findNode(_ str: String) -> TrieNode? {
        var current = root
        for char in str {
            guard let next = current.children[char] else {
                return nil
            }
            current = next
        }
        return current
    }
}

// --- Test Cases ---
let trie = Trie()
print("Trie Operations:")
trie.insert("apple")
print("search(\"apple\"): \(trie.search("apple"))")   // Expected: true
print("search(\"app\"):   \(trie.search("app"))")     // Expected: false
print("startsWith(\"app\"): \(trie.startsWith("app"))") // Expected: true
trie.insert("app")
print("search(\"app\"):   \(trie.search("app"))")     // Expected: true

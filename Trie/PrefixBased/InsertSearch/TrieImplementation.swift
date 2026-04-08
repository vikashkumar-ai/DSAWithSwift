/**
 * Problem: Implement Trie (Prefix Tree)
 * Topic: Trie / PrefixBased / InsertSearch
 * 
 * Description:
 * A trie (pronounced as "try") or prefix tree is a tree data 
 * structure used to efficiently store and retrieve keys in a 
 * dataset of strings. There are various applications of this 
 * data structure, such as autocomplete and spellchecker.
 * 
 * Pattern: Standard Trie nodes with a dictionary for children 
 * and a boolean flag for the end of a word.
 * 
 * Time Complexity: O(L) for insert/search/startsWith.
 * Space Complexity: O(N * L).
 */

import Foundation

class Trie {
    class Node {
        var children = [Character: Node]()
        var isEndOfWord = false
    }
    
    private let root = Node()
    
    /**
     * Inserts a word into the trie.
     */
    func insert(_ word: String) {
        var curr = root
        for char in word {
            if curr.children[char] == nil {
                curr.children[char] = Node()
            }
            curr = curr.children[char]!
        }
        curr.isEndOfWord = true
    }
    
    /**
     * Returns if the word is in the trie.
     */
    func search(_ word: String) -> Bool {
        var curr = root
        for char in word {
            guard let next = curr.children[char] else { return false }
            curr = next
        }
        return curr.isEndOfWord
    }
    
    /**
     * Returns if there is any word in the trie that starts with 
     * the given prefix.
     */
    func startsWith(_ prefix: String) -> Bool {
        var curr = root
        for char in prefix {
            guard let next = curr.children[char] else { return false }
            curr = next
        }
        return true
    }
}

// --- Test Cases ---
let trie = Trie()
trie.insert("apple")
print("Search \"apple\": \(trie.search("apple"))")   // Expected: true
print("Search \"app\":   \(trie.search("app"))")     // Expected: false
print("Prefix \"app\":   \(trie.startsWith("app"))") // Expected: true
trie.insert("app")
print("Search \"app\" after insert: \(trie.search("app"))") // Expected: true

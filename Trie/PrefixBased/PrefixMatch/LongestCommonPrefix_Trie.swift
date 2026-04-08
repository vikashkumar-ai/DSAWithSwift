/**
 * Problem: Longest Common Prefix (using Trie)
 * Topic: Trie / PrefixBased
 * 
 * Description:
 * Given an array of strings, return the longest common prefix 
 * of all strings.
 * 
 * Pattern: Build a Trie with all strings. The longest common prefix 
 * corresponds to the path from the root until we hit a node 
 * with more than one child or a node that is the end of a word.
 * 
 * Time Complexity: O(N * L) where N is number of strings and L is length.
 * Space Complexity: O(N * L).
 */

import Foundation

class LongestCommonPrefixTrie {
    class Node {
        var children = [Character: Node]()
        var isEndOfWord = false
    }
    
    private let root = Node()
    
    /**
     * Inserts a word into the Trie.
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
     * Finds the longest common prefix by traversing the Trie.
     * - Returns: The prefix string.
     */
    func findLCP() -> String {
        var res = ""
        var curr = root
        
        while curr.children.count == 1 && !curr.isEndOfWord {
            let (char, next) = curr.children.first!
            res.append(char)
            curr = next
        }
        
        return res
    }
}

// --- Test Cases ---
let trie = LongestCommonPrefixTrie()
trie.insert("flower"); trie.insert("flow"); trie.insert("flight")
print("LCP for [flower, flow, flight]: \(trie.findLCP())") // Expected: "fl"

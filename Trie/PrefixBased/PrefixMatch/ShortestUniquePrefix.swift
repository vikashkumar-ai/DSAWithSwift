/**
 * Problem: Shortest Unique Prefix
 * Topic: Trie / PrefixBased
 * 
 * Description:
 * Find the shortest unique prefix for every word in a given list. 
 * Assume that no word is a prefix of another word.
 * 
 * Pattern: Trie with visit count. For each word, insert characters into 
 * the Trie and increment a visit count at each node. To find the unique 
 * prefix for a word, traverse the Trie until a node with a visit 
 * count of 1 is reached.
 * 
 * Time Complexity: O(N * L).
 * Space Complexity: O(N * L).
 */

import Foundation

class ShortestUniquePrefix {
    class Node {
        var children = [Character: Node]()
        var count = 0
    }
    
    private let root = Node()
    
    /**
     * Inserts a word and tracks visit counts.
     */
    func insert(_ word: String) {
        var curr = root
        for char in word {
            if curr.children[char] == nil {
                curr.children[char] = Node()
            }
            curr = curr.children[char]!
            curr.count += 1
        }
    }
    
    /**
     * Finds the shortest unique prefix for a given word.
     * - Parameters:
     *   - word: The target string.
     * - Returns: The shortest unique prefix.
     */
    func findPrefix(_ word: String) -> String {
        var res = ""
        var curr = root
        for char in word {
            res.append(char)
            curr = curr.children[char]!
            if curr.count == 1 {
                return res
            }
        }
        return res
    }
}

// --- Test Cases ---
let solver = ShortestUniquePrefix()
let words = ["zebra", "dog", "duck", "dove"]
for word in words { solver.insert(word) }

print("Prefixes for [zebra, dog, duck, dove]:")
for word in words {
    print("\(word): \(solver.findPrefix(word))")
}
// Expected: zebra: z, dog: dog, duck: du, dove: dov

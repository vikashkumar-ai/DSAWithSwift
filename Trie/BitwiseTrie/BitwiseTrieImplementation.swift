/**
 * Problem: Bitwise Trie (Standard Implementation)
 * Topic: Trie / BitwiseTrie
 * 
 * Description:
 * A Bitwise Trie is a special form of Trie designed to store and 
 * search integers by their bits. Each node in the Trie has two 
 * children: one for bit '0' and one for bit '1'.
 * 
 * Pattern: Binary Tree-like structure where each level corresponds 
 * to a bit position. 
 * 
 * Time Complexity: O(32) for insert/search.
 * Space Complexity: O(N * 32).
 */

import Foundation

class BitwiseTrie {
    class Node {
        var children = [Int: Node]()
    }
    
    private let root = Node()
    
    /**
     * Inserts an integer into the Bitwise Trie.
     * - Parameters:
     *   - num: The integer to insert.
     */
    func insert(_ num: Int) {
        var curr = root
        // Traverse bits from most significant to least significant
        for i in (0..<31).reversed() {
            let bit = (num >> i) & 1
            if curr.children[bit] == nil {
                curr.children[bit] = Node()
            }
            curr = curr.children[bit]!
        }
    }
    
    /**
     * Searches for an integer in the Bitwise Trie.
     * - Parameters:
     *   - num: The integer to search for.
     * - Returns: A boolean value of true if found.
     */
    func search(_ num: Int) -> Bool {
        var curr = root
        for i in (0..<31).reversed() {
            let bit = (num >> i) & 1
            guard let next = curr.children[bit] else { return false }
            curr = next
        }
        return true
    }
    
    /**
     * Finds the maximum XOR sum for a given number with any 
     * number in labels.
     * - Parameters:
     *   - num: The target number.
     * - Returns: The found maximum XOR value.
     */
    func findMaxXorWith(_ num: Int) -> Int {
        var curr = root
        var maxXor = 0
        for i in (0..<31).reversed() {
            let bit = (num >> i) & 1
            // Greedy: prefer the opposite bit if available to maximize XOR
            let targetBit = 1 - bit
            if let nextNode = curr.children[targetBit] {
                maxXor |= (1 << i)
                curr = nextNode
            } else if let nextNode = curr.children[bit] {
                curr = nextNode
            } else {
                return 0 // No path
            }
        }
        return maxXor
    }
}

// --- Test Cases ---
let trie = BitwiseTrie()
trie.insert(3); trie.insert(10); trie.insert(5)
print("Search 10: \(trie.search(10))")      // Expected: true
print("Max XOR with 6: \(trie.findMaxXorWith(6))") // Expected: 12 (6 ^ 10)

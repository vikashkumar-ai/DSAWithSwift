/**
 * Problem: Map Sum Pairs (Trie with cumulative values)
 * Topic: Trie / PrefixBased / InsertSearch
 * 
 * Description:
 * Implement the MapSum class:
 * - MapSum() Initializes the MapSum object.
 * - void insert(String key, int val) Inserts the key-val pair 
 *   into the map. If the key already existed, the original val sum 
 *   will be overwritten to the new one.
 * - int sum(string prefix) Returns the sum of all the pairs' 
 *   value whose key starts with the prefix.
 * 
 * Pattern: Trie with node values. Each node stores the sum of 
 * values of all keys passing through it.
 * 
 * Time Complexity: O(L) for insert and sum.
 * Space Complexity: O(N * L).
 */

import Foundation

class MapSum {
    class Node {
        var children = [Character: Node]()
        var val = 0 // Sum of all words sharing this prefix
    }
    
    private let root = Node()
    private var map = [String: Int]()
    
    /**
     * Inserts a key-value pair.
     */
    func insert(_ key: String, _ val: Int) {
        let delta = val - (map[key] ?? 0)
        map[key] = val
        
        var curr = root
        for char in key {
            if curr.children[char] == nil {
                curr.children[char] = Node()
            }
            curr = curr.children[char]!
            curr.val += delta
        }
    }
    
    /**
     * Returns the sum of values of all keys starting with prefix.
     */
    func sum(_ prefix: String) -> Int {
        var curr = root
        for char in prefix {
            guard let next = curr.children[char] else { return 0 }
            curr = next
        }
        return curr.val
    }
}

// --- Test Cases ---
let mapSum = MapSum()
mapSum.insert("apple", 3)
print("Sum \"ap\": \(mapSum.sum("ap"))")    // Expected: 3
mapSum.insert("app", 2)
print("Sum \"ap\": \(mapSum.sum("ap"))")    // Expected: 5
mapSum.insert("apple", 5) // Overwrite
print("Sum \"ap\": \(mapSum.sum("ap"))")    // Expected: 7 (2 + 5)

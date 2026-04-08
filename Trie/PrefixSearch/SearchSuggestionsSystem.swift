/**
 * Problem: Search Suggestions System
 * Topic: Trie / PrefixSearch
 * 
 * Description:
 * Given an array of strings products and a string searchWord. 
 * Design a system that suggests at most three product names from 
 * products after each character of searchWord is typed. 
 * Suggested products should have common prefix with searchWord. 
 * If there are more than three products with a common prefix 
 * return the three lexicographically minimums products.
 * 
 * Pattern: Store all products in a Trie. At each node, store the 
 * top 3 lexicographical strings that pass through that node.
 * 
 * Time Complexity: O(M * L * log M) where M is number of products 
 * and L is average length.
 * Space Complexity: O(M * L).
 */

import Foundation

class TrieNode {
    var children = [Character: TrieNode]()
    var suggestions = [String]()
}

class Solution {
    /**
     * Recommends up to 3 products after each typed character.
     * - Parameters:
     *   - products: List of product names.
     *   - searchWord: The typed search query.
     * - Returns: A list of recommendations per character.
     */
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let root = TrieNode()
        
        // Step 1: Sort products lexicographically
        let sortedProducts = products.sorted()
        
        // Step 2: Build the Trie
        for product in sortedProducts {
            var curr = root
            for char in product {
                if curr.children[char] == nil {
                    curr.children[char] = TrieNode()
                }
                curr = curr.children[char]!
                
                // If current node has fewer than 3 suggestions, add it
                if curr.suggestions.count < 3 {
                    curr.suggestions.append(product)
                }
            }
        }
        
        // Step 3: Search for suggestions character by character
        var result = [[String]]()
        var curr: TrieNode? = root
        for char in searchWord {
            if curr != nil {
                curr = curr?.children[char]
            }
            // If curr is nil, it means no words match this prefix
            result.append(curr?.suggestions ?? [])
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let products = ["mobile","mouse","moneypot","monitor","mousepad"]
print("Suggestions for \"mouse\":\n\(sol.suggestedProducts(products, "mouse"))")
// Expected: [["mobile","moneypot","monitor"], ["mobile","moneypot","monitor"], ["mouse","mousepad"], ["mouse","mousepad"], ["mouse","mousepad"]]

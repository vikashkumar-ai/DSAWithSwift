/**
 * Problem: Maximum XOR of Two Numbers in an Array
 * Topic: Trie / XOR_Problems
 * 
 * Description:
 * Given an integer array nums, return the maximum result of nums[i] XOR nums[j], 
 * where 0 <= i <= j < n.
 * 
 * Pattern: Binary Trie. Insert all numbers (as bit sequences) into a trie. 
 * For each number, traverse the trie trying to pick the opposite bit at 
 * each level (if 1 is available for bit 0, or 0 for 1) to maximize XOR.
 * 
 * Time Complexity: O(n * log(max_val)) where log(max_val) is typically 31.
 * Space Complexity: O(n * log(max_val)) for the trie.
 */

import Foundation

class BinaryTrieNode {
    var children: [Int: BinaryTrieNode] = [:] // key: 0 or 1
}

class Solution {
    /**
     * Finds the maximum XOR pair using a Binary Trie.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: The overall maximum XOR found.
     */
    func findMaximumXOR(_ nums: [Int]) -> Int {
        let root = BinaryTrieNode()
        
        // Step 1: Insert all numbers into the Binary Trie
        for num in nums {
            var current = root
            for i in (0...31).reversed() {
                let bit = (num >> i) & 1
                if current.children[bit] == nil {
                    current.children[bit] = BinaryTrieNode()
                }
                current = current.children[bit]!
            }
        }
        
        // Step 2: For each number, find the max possible XOR value
        var maxXor = 0
        for num in nums {
            var current = root
            var currentXor = 0
            for i in (0...31).reversed() {
                let bit = (num >> i) & 1
                let toggleBit = bit ^ 1
                
                // If the opposite bit is available, we take it to maximize XOR
                if let next = current.children[toggleBit] {
                    currentXor |= (1 << i)
                    current = next
                } else if let next = current.children[bit] {
                    current = next
                } else {
                    break
                }
            }
            maxXor = max(maxXor, currentXor)
        }
        
        return maxXor
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max XOR for [3, 10, 5, 25, 2, 8]: \(sol.findMaximumXOR([3, 10, 5, 25, 2, 8]))") // Expected: 28 (5 XOR 25)
print("Max XOR for [14, 70, 53, 33, 49, 91, 36, 80, 92, 51, 66, 70]: \(sol.findMaximumXOR([14, 70, 53, 33, 49, 91, 36, 80, 92, 51, 66, 70]))") // Expected: 127

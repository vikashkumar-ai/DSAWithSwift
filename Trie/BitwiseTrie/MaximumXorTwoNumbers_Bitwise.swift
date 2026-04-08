/**
 * Problem: Maximum XOR of Two Numbers in an Array (using Bitwise Trie)
 * Topic: Trie / BitwiseTrie
 * 
 * Description:
 * Given an integer array nums, return the maximum result of 
 * nums[i] ^ nums[j], where 0 <= i <= j < n.
 * 
 * Pattern: Bitwise Trie. Insert all numbers into the Trie. 
 * For each number, traverse the Trie and greedily choose the 
 * opposite bit if available to maximize the XOR sum.
 * 
 * Time Complexity: O(n * 32).
 * Space Complexity: O(n * 32).
 */

import Foundation

class Solution {
    class Node {
        var children = [Int: Node]()
    }
    
    private let root = Node()
    
    /**
     * Inserts an integer into the Bitwise Trie.
     */
    private func insert(_ num: Int) {
        var curr = root
        for i in (0..<31).reversed() {
            let bit = (num >> i) & 1
            if curr.children[bit] == nil {
                curr.children[bit] = Node()
            }
            curr = curr.children[bit]!
        }
    }
    
    /**
     * Finds the maximum XOR possible with target.
     */
    private func findMaxXor(_ target: Int) -> Int {
        var curr = root
        var maxXor = 0
        for i in (0..<31).reversed() {
            let bit = (target >> i) & 1
            let toggledBit = 1 - bit
            if let next = curr.children[toggledBit] {
                maxXor |= (1 << i)
                curr = next
            } else if let next = curr.children[bit] {
                curr = next
            } else {
                break
            }
        }
        return maxXor
    }
    
    /**
     * Finds the maximum XOR of two numbers in an array.
     * - Parameters:
     *   - nums: Input integer array.
     * - Returns: The maximum XOR value.
     */
    func findMaximumXOR(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        // Insert all numbers into Bitwise Trie
        for num in nums {
            insert(num)
        }
        
        var maxResult = 0
        // For each number, query the Trie for its maximum XOR partner
        for num in nums {
            maxResult = max(maxResult, findMaxXor(num))
        }
        
        return maxResult
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max XOR for [3, 10, 5, 25, 2, 8]: \(sol.findMaximumXOR([3, 10, 5, 25, 2, 8]))") 
// Expected: 28 (5 ^ 25)
print("Max XOR for [8, 10, 2]:       \(sol.findMaximumXOR([8, 10, 2]))")       
// Expected: 10 (8 ^ 2)

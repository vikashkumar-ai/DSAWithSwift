/**
 * Problem: Maximum XOR Subarray
 * Topic: Trie / XOR_Problems
 * 
 * Description:
 * Given an array of integers, find the maximum XOR subarray value. 
 * A subarray XOR is the bitwise XOR of all elements in the subarray.
 * 
 * Pattern: Maintain a prefix XOR of the array. The problem then 
 * reduces to finding two prefix XORs (P[i] and P[j]) such that 
 * P[i] ^ P[j] is maximum. Use a Bitwise Trie to store all 
 * prefix XORs.
 * 
 * Time Complexity: O(n * 32).
 * Space Complexity: O(n * 32).
 */

import Foundation

class TrieNode {
    var children = [Int: TrieNode]()
}

class Solution {
    private let root = TrieNode()
    
    /**
     * Finds the maximum XOR value of any subarray.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: The maximum XOR found.
     */
    func maxXorSubarray(_ nums: [Int]) -> Int {
        var maxXor = 0
        var currentXor = 0
        
        // Insert 0 to represent the XOR sum of an empty prefix
        insert(0)
        
        for num in nums {
            currentXor ^= num
            insert(currentXor)
            // Query the Trie to find the max XOR possible with currentXor
            maxXor = max(maxXor, query(currentXor))
        }
        
        return maxXor
    }
    
    private func insert(_ num: Int) {
        var curr = root
        for i in (0..<31).reversed() {
            let bit = (num >> i) & 1
            if curr.children[bit] == nil {
                curr.children[bit] = TrieNode()
            }
            curr = curr.children[bit]!
        }
    }
    
    private func query(_ num: Int) -> Int {
        var curr = root
        var maxXorValue = 0
        for i in (0..<31).reversed() {
            let bit = (num >> i) & 1
            // Greedy: prefer the opposite bit if available to maximize XOR
            let targetBit = 1 - bit
            if let nextNode = curr.children[targetBit] {
                maxXorValue |= (1 << i)
                curr = nextNode
            } else if let nextNode = curr.children[bit] {
                curr = nextNode
            } else {
                break
            }
        }
        return maxXorValue
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max XOR Subarray for [1, 2, 3, 4]: \(sol.maxXorSubarray([1, 2, 3, 4]))") 
// Expected: 7 (3 ^ 4)
print("Max XOR Subarray for [8, 1, 2, 12, 7, 6]: \(sol.maxXorSubarray([8, 1, 2, 12, 7, 6]))") 
// Expected: 15 (8 ^ 1 ^ 2 ^ 12 ^ 7 ^ 6) -> 12 ^ 7 ^ 6? No, 8^7? 

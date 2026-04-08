/**
 * Problem: Binary Indexed Tree (Fenwick Tree)
 * Topic: Range Structures / FenwickTree / PrefixQuery
 * 
 * Description:
 * A Fenwick Tree or Binary Indexed Tree (BIT) is a data structure 
 * that can efficiently update elements and calculate prefix sums 
 * in a table of numbers.
 * 
 * Pattern: Binary representation based indexing. Each node stores 
 * the sum of a specific range determined by its least significant bit.
 * 
 * Time Complexity: O(log n) for update and prefixSum.
 * Space Complexity: O(n).
 */

import Foundation

class FenwickTree {
    private var tree: [Int]
    private var n: Int
    
    init(_ n: Int) {
        self.n = n
        self.tree = Array(repeating: 0, count: n + 1)
    }
    
    /**
     * Adds val to the element at index i (1-indexed).
     * - Parameters:
     *   - i: Index (1 to n).
     *   - val: Value to add.
     */
    func update(_ i: Int, _ val: Int) {
        var idx = i
        while idx <= n {
            tree[idx] += val
            idx += (idx & -idx) // Add LSB
        }
    }
    
    /**
     * Calculates the prefix sum from 1 to i (1-indexed).
     * - Parameters:
     *   - i: Up to index i.
     * - Returns: Sum of elements [1...i].
     */
    func prefixSum(_ i: Int) -> Int {
        var idx = i
        var sum = 0
        while idx > 0 {
            sum += tree[idx]
            idx -= (idx & -idx) // Subtract LSB
        }
        return sum
    }
    
    /**
     * Calculates the range sum [l, r] (1-indexed).
     */
    func rangeSum(_ l: Int, _ r: Int) -> Int {
        return prefixSum(r) - prefixSum(l - 1)
    }
}

// --- Test Cases ---
let bit = FenwickTree(10)
bit.update(1, 5)
bit.update(3, 2)
bit.update(5, 8)
print("Prefix sum up to 4: \(bit.prefixSum(4))") // Expected: 7 (5 + 2)
print("Range sum [2, 5]:  \(bit.rangeSum(2, 5))") // Expected: 10 (2 + 8)

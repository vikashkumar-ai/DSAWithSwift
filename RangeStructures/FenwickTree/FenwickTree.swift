/**
 * Problem: Binary Indexed Tree (Fenwick Tree) Implementation
 * Topic: Range Structures / FenwickTree
 * 
 * Description:
 * A Fenwick Tree (or Binary Indexed Tree) is a data structure that 
 * provides efficient methods for calculation and manipulation of the 
 * prefix sums of a table of values.
 * 
 * Pattern: Each index in the tree stores the sum of a specific range, 
 * determined by the least significant bit (LSB).
 * 
 * Time Complexity: O(log n) for both update and prefix sum query.
 * Space Complexity: O(n) for the tree.
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
     * Updates the element at a given index (1-indexed).
     */
    func update(_ index: Int, _ delta: Int) {
        var idx = index
        while idx <= n {
            tree[idx] += delta
            // Move to the next index using LSB
            idx += idx & -idx
        }
    }
    
    /**
     * Queries the prefix sum from 1 to index (1-indexed).
     */
    func query(_ index: Int) -> Int {
        var idx = index
        var sum = 0
        while idx > 0 {
            sum += tree[idx]
            // Move to the previous index
            idx -= idx & -idx
        }
        return sum
    }
    
    /**
     * Finds the range sum between left and right (1-indexed).
     */
    func queryRange(_ left: Int, _ right: Int) -> Int {
        return query(right) - query(left - 1)
    }
}

// --- Test Cases ---
let ft = FenwickTree(10)
print("Fenwick Tree Operations:")
ft.update(1, 5)
ft.update(3, 10)
ft.update(5, -2)
print("query(5): \(ft.query(5))")           // Expected: 5 + 10 - 2 = 13
print("queryRange(3, 5): \(ft.queryRange(3, 5))") // Expected: 10 - 2 = 8

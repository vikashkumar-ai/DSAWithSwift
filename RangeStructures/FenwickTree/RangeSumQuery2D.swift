/**
 * Problem: 2D Range Sum Query (using Fenwick Tree)
 * Topic: Range Structures / FenwickTree
 * 
 * Description:
 * Given a 2D matrix, design a data structure that supports 
 * prefix sum queries and point updates in O(log n * log m) time.
 * 
 * Pattern: Binary Indexed Tree (Fenwick Tree) in 2D. Each node 
 * in the BIT represents a rectangular area's sum.
 * 
 * Time Complexity: O(log m * log n) for query/update.
 * Space Complexity: O(m * n) for the BIT.
 */

import Foundation

class NumMatrix {
    private var tree: [[Int]]
    private var matrix: [[Int]]
    private var m: Int
    private var n: Int
    
    init(_ matrix: [[Int]]) {
        if matrix.isEmpty { self.m = 0; self.n = 0; self.tree = []; self.matrix = []; return }
        self.m = matrix.count
        self.n = matrix[0].count
        self.matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
        self.tree = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        for i in 0..<m {
            for j in 0..<n {
                update(i, j, matrix[i][j])
            }
        }
    }
    
    /**
     * Updates an element at (row, col) to val. 
     * Since BIT works with deltas, we calculate delta = val - currentVal.
     */
    func update(_ row: Int, _ col: Int, _ val: Int) {
        let delta = val - matrix[row][col]
        matrix[row][col] = val
        
        var i = row + 1
        while i <= m {
            var j = col + 1
            while j <= n {
                tree[i][j] += delta
                j += (j & -j)
            }
            i += (i & -i)
        }
    }
    
    /**
     * Sum the rectangle from (0, 0) to (row, col).
     */
    private func query(_ row: Int, _ col: Int) -> Int {
        var sum = 0
        var i = row + 1
        while i > 0 {
            var j = col + 1
            while j > 0 {
                sum += tree[i][j]
                j -= (j & -j)
            }
            i -= (i & -i)
        }
        return sum
    }
    
    /**
     * Sum the rectangle from (row1, col1) to (row2, col2).
     */
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return query(row2, col2) - query(row1 - 1, col2) - query(row2, col1 - 1) + query(row1 - 1, col1 - 1)
    }
}

// --- Test Cases ---
let matrix = [
  [3, 0, 1, 4, 2],
  [5, 6, 3, 2, 1],
  [1, 2, 0, 1, 5],
  [4, 1, 0, 1, 7],
  [1, 0, 3, 0, 5]
]
let numMatrix = NumMatrix(matrix)
print("Sum Region [2,1] to [4,3]: \(numMatrix.sumRegion(2, 1, 4, 3))") // Expected: 8
numMatrix.update(3, 2, 2)
print("Sum Region [2,1] to [4,3] after update: \(numMatrix.sumRegion(2, 1, 4, 3))") // Expected: 10

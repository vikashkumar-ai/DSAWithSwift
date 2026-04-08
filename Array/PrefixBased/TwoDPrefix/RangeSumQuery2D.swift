/**
 * Problem: Range Sum Query 2D - Immutable
 * Topic: Array / Prefix Based / 2D Prefix Sum
 * 
 * Description:
 * Given a 2D matrix, handle multiple queries of the form sumRegion(r1, c1, r2, c2).
 * Calculate the sum of the elements of the matrix within the rectangle defined by 
 * its upper left corner (r1, c1) and lower right corner (r2, c2).
 * 
 * Time Complexity: O(R * C) for pre-calculation, O(1) per query.
 * Space Complexity: O(R * C) for the 2D prefix sum matrix.
 */

import Foundation

class NumMatrix {
    private var prefixSum: [[Int]]

    /**
     * Initializes the NumMatrix object with the pre-calculated prefix sums.
     * - Parameters:
     *   - matrix: The input 2D integer matrix.
     */
    init(_ matrix: [[Int]]) {
        if matrix.isEmpty || matrix[0].isEmpty { 
            prefixSum = []
            return 
        }
        
        let rows = matrix.count
        let cols = matrix[0].count
        prefixSum = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
        
        // Fill 2D prefix sums: prefixSum[i][j] stores sum of matrix[0...i-1][0...j-1]
        for i in 1...rows {
            for j in 1...cols {
                prefixSum[i][j] = matrix[i-1][j-1] + prefixSum[i-1][j] + prefixSum[i][j-1] - prefixSum[i-1][j-1]
            }
        }
    }
    
    /**
     * Returns the sum of the elements within the rectangle defined by corners.
     * - Parameters:
     *   - row1: Starting row index.
     *   - col1: Starting column index.
     *   - row2: Ending row index.
     *   - col2: Ending column index.
     * - Returns: Sum of the rectangle submatrix.
     */
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        // sumRegion = prefixSum[r2+1][c2+1] - prefixSum[r1][c2+1] - prefixSum[r2+1][c1] + prefixSum[r1][c1]
        return prefixSum[row2 + 1][col2 + 1] - prefixSum[row1][col2 + 1] - prefixSum[row2 + 1][col1] + prefixSum[row1][col1]
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
let obj = NumMatrix(matrix)
print("Range Sum Query 2D for given matrix:")
print("sumRegion(2, 1, 4, 3): \(obj.sumRegion(2, 1, 4, 3))") // Expected: 8
print("sumRegion(1, 1, 2, 2): \(obj.sumRegion(1, 1, 2, 2))") // Expected: 11
print("sumRegion(1, 2, 3, 3): \(obj.sumRegion(1, 2, 3, 3))") // Expected: 12

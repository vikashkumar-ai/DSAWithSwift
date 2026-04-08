/**
 * Problem: Maximal Rectangle (Histogram Pattern)
 * Topic: Stack / HistogramPattern
 * 
 * Description:
 * Given a binary matrix filled with 0's and 1's, find the largest 
 * rectangle containing only 1's and return its area.
 * 
 * Pattern: Dynamic Histogram.
 * 1. Treat each row as the base of a histogram.
 * 2. Update the height of the histogram for each row:
 *    - If matrix[r][c] == '1', height[c] += 1
 *    - Else, height[c] = 0
 * 3. Use 'Largest Rectangle in Histogram' (Monotonic Stack) 
 *    for each row's height array to find the max area.
 * 
 * Time Complexity: O(R * C).
 * Space Complexity: O(C).
 */

import Foundation

class MaximalRectangleSolver {
    /**
     * Finds the maximal rectangle area in a binary matrix.
     * - Parameters:
     *   - matrix: Input 2D character/integer matrix.
     * - Returns: Maximal area.
     */
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty { return 0 }
        let cols = matrix[0].count
        var heights = Array(repeating: 0, count: cols)
        var maxArea = 0
        
        for row in matrix {
            for c in 0..<cols {
                // Update histogram height for current row
                heights[c] = (row[c] == "1") ? heights[c] + 1 : 0
            }
            // Find max rectangle in current histogram
            maxArea = max(maxArea, largestRectangleArea(heights))
        }
        
        return maxArea
    }
    
    private func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [Int]() // Stores indices
        var maxA = 0
        let h = heights + [0] // Append 0 to flush the stack at the end
        
        for i in 0..<h.count {
            while !stack.isEmpty && h[stack.last!] > h[i] {
                let height = h[stack.removeLast()]
                let width = stack.isEmpty ? i : i - stack.last! - 1
                maxA = max(maxA, height * width)
            }
            stack.append(i)
        }
        
        return maxA
    }
}

// --- Test Cases ---
let solver = MaximalRectangleSolver()
let matrix: [[Character]] = [
    ["1","0","1","0","0"],
    ["1","0","1","1","1"],
    ["1","1","1","1","1"],
    ["1","0","0","1","0"]
]
print("Maximal Rectangle Area: \(solver.maximalRectangle(matrix))") // Expected: 6

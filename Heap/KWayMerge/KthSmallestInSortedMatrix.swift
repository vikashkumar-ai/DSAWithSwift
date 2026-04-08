/**
 * Problem: Kth Smallest Element in a Sorted Matrix (using Min Heap)
 * Topic: Heap / KWayMerge
 * 
 * Description:
 * Given an n x n matrix where each of the rows and columns are 
 * sorted in ascending order, return the kth smallest element 
 * in the matrix.
 * 
 * Pattern: K-Way Merge with Heap. The matrix can be treated as 
 * n sorted lists. Use a Min-Heap to store the first element 
 * of each row.
 * 
 * Time Complexity: O(k log n).
 * Space Complexity: O(n) for the heap.
 */

import Foundation

class Solution {
    struct Element: Comparable {
        let val: Int
        let row: Int
        let col: Int
        
        static func < (lhs: Element, rhs: Element) -> Bool {
            return lhs.val < rhs.val
        }
    }
    
    /**
     * Finds the kth smallest element in a sorted matrix.
     * - Parameters:
     *   - matrix: Sorted 2D integer array.
     *   - k: The target rank.
     * - Returns: The kth smallest value.
     */
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let n = matrix.count
        var heap = [Element]()
        
        // Add the first element of each row (up to min(n, k))
        for r in 0..<min(n, k) {
            heap.append(Element(val: matrix[r][0], row: r, col: 0))
        }
        
        heap.sort()
        
        var count = 0
        var result = 0
        
        while !heap.isEmpty {
            let minEl = heap.removeFirst()
            result = minEl.val
            count += 1
            
            if count == k { break }
            
            // Add the next element from the same row
            if minEl.col + 1 < n {
                heap.append(Element(val: matrix[minEl.row][minEl.col + 1], row: minEl.row, col: minEl.col + 1))
                heap.sort()
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let matrix = [[1,  5,  9],[10, 11, 13],[12, 13, 15]]
print("K=8th Smallest: \(sol.kthSmallest(matrix, 8))") // Expected: 13

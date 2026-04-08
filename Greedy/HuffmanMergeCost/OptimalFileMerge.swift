/**
 * Problem: Optimal File Merge Patterns
 * Topic: Greedy / HuffmanMergeCost
 * 
 * Description:
 * Given n files with their sizes, merge them into a single file 
 * with minimum total cost (size of intermediate files).
 * 
 * Pattern: Huffman Merge. Similar to Minimum Cost to Connect Ropes. 
 * Always merge the two smallest files first.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Calculates the minimum cost to merge all files.
     * - Parameters:
     *   - files: Array of file sizes.
     * - Returns: Minimum total merge cost.
     */
    func minMergeCost(_ files: [Int]) -> Int {
        if files.count <= 1 { return 0 }
        
        var heap = files.sorted()
        var totalCost = 0
        
        while heap.count > 1 {
            let first = heap.removeFirst()
            let second = heap.removeFirst()
            
            let combined = first + second
            totalCost += combined
            
            heap.append(combined)
            heap.sort()
        }
        
        return totalCost
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min cost to merge files [2, 3, 4]: \(sol.minMergeCost([2, 3, 4]))") 
// Expected: 14 (2+3=5, 5+4=9; 5+9=14)
print("Min cost to merge files [5, 10, 20, 30]: \(sol.minMergeCost([5, 10, 20, 30]))") 
// Expected: 115

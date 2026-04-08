/**
 * Problem: Minimum Cost to Connect Ropes (Huffman Merge Pattern)
 * Topic: Greedy / HuffmanMergeCost
 * 
 * Description:
 * There are n ropes of different lengths, connect them into a 
 * single rope with minimum cost. The cost to connect two ropes is 
 * equal to the sum of their lengths.
 * 
 * Pattern: Huffman Coding (Min-Heap). Always pick the two smallest 
 * ropes and merge them. This reduces the problem to a smaller subproblem 
 * with n-1 ropes.
 * 
 * Time Complexity: O(n log n) using a priority queue.
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Calculates the minimum cost to connect all ropes.
     * - Parameters:
     *   - ropes: Array of rope lengths.
     * - Returns: Minimum total cost.
     */
    func connectRopes(_ ropes: [Int]) -> Int {
        if ropes.count <= 1 { return 0 }
        
        // Priority Queue simulation using sorted array
        var heap = ropes.sorted()
        var totalCost = 0
        
        while heap.count > 1 {
            // Pick two smallest ropes
            let first = heap.removeFirst()
            let second = heap.removeFirst()
            
            let combined = first + second
            totalCost += combined
            
            // Re-insert the combined rope and re-sort
            heap.append(combined)
            heap.sort()
        }
        
        return totalCost
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min Cost to connect ropes [4, 3, 2, 6]: \(sol.connectRopes([4, 3, 2, 6]))") 
// Expected: 29 (2+3=5, 5+4=9, 9+6=15; 5+9+15=29)
print("Min Cost to connect ropes [1, 2, 3]:    \(sol.connectRopes([1, 2, 3]))") 
// Expected: 9

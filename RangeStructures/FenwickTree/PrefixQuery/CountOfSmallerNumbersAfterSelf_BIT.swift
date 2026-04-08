/**
 * Problem: Count of Smaller Numbers After Self (using Fenwick Tree)
 * Topic: Range Structures / FenwickTree / PrefixQuery
 * 
 * Description:
 * You are given an integer array nums and you have to return a new 
 * counts array. The counts array has the property where counts[i] is 
 * the number of smaller elements to the right of nums[i].
 * 
 * Pattern: Binary Indexed Tree (BIT) with Coordinate Compression. 
 * Map all values to their rank (1 to n). Traverse from right 
 * to left and for each number:
 * 1. Query BIT for prefix sum of ranks less than target rank.
 * 2. Update BIT at target rank.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the count of smaller numbers to the right.
     * - Parameters:
     *   - nums: Input integer array.
     * - Returns: Counts array.
     */
    func countSmaller(_ nums: [Int]) -> [Int] {
        let n = nums.count
        if n == 0 { return [] }
        
        // Coordinate compression to map values to ranks
        let sortedUnique = Array(Set(nums)).sorted()
        var rankMap = [Int: Int]()
        for (i, val) in sortedUnique.enumerated() {
            rankMap[val] = i + 1
        }
        
        var bit = Array(repeating: 0, count: sortedUnique.count + 1)
        var result = Array(repeating: 0, count: n)
        
        // Traverse from right to left
        for i in (0..<n).reversed() {
            let rank = rankMap[nums[i]]!
            
            // Step 1: Prefix sum of values < rank
            result[i] = query(bit, rank - 1)
            
            // Step 2: Update current rank in BIT
            update(&bit, rank, 1)
        }
        
        return result
    }
    
    private func update(_ bit: inout [Int], _ i: Int, _ val: Int) {
        var idx = i
        while idx < bit.count {
            bit[idx] += val
            idx += (idx & -idx)
        }
    }
    
    private func query(_ bit: [Int], _ i: Int) -> Int {
        var idx = i
        var sum = 0
        while idx > 0 {
            sum += bit[idx]
            idx -= (idx & -idx)
        }
        return sum
    }
}

// --- Test Cases ---
let sol = Solution()
print("Smaller to right in [5, 2, 6, 1]: \(sol.countSmaller([5, 2, 6, 1]))") 
// Expected: [2, 1, 1, 0]
print("Smaller to right in [-1, -1]: \(sol.countSmaller([-1, -1]))") 
// Expected: [0, 0]

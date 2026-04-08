/**
 * Problem: Jump Game II
 * Topic: Greedy / JumpGamePattern
 * 
 * Description:
 * You are given an integer array nums. Each element represents your 
 * maximum jump length at that position. Return the minimum number 
 * of jumps to reach the last index.
 * 
 * Pattern: OneD BFS/Greedy. At each position, track the furthest 
 * reachable point from the current jump range.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Finds the minimum jumps required to reach the last index.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: Minimum number of jumps.
     */
    func jump(_ nums: [Int]) -> Int {
        if nums.count <= 1 { return 0 }
        
        var jumps = 0
        var currentEnd = 0
        var furthest = 0
        
        for i in 0..<nums.count - 1 {
            // Furthest reachable index from current position
            furthest = max(furthest, i + nums[i])
            
            // If we've reached the end of the current jump range, 
            // increment jumps and move currentEnd to furthest.
            if i == currentEnd {
                jumps += 1
                currentEnd = furthest
                
                // Early exit if we can already reach the end
                if currentEnd >= nums.count - 1 { break }
            }
        }
        
        return jumps
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min jumps for [2,3,1,1,4]: \(sol.jump([2,3,1,1,4]))") // Expected: 2 (2->3->last)
print("Min jumps for [2,3,0,1,4]: \(sol.jump([2,3,0,1,4]))") // Expected: 2 (2->3->last)

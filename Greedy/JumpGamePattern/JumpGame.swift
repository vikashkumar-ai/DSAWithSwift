/**
 * Problem: Jump Game
 * Topic: Greedy / JumpGamePattern
 * 
 * Description:
 * You are given an integer array nums. You are initially positioned 
 * at the array's first index, and each element in the array 
 * represents your maximum jump length at that position.
 * Return true if you can reach the last index, or false otherwise.
 * 
 * Pattern: Maintain a 'maxReachable' index. If at any step the current 
 * index exceeds 'maxReachable', it means the last index cannot be reached.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Determines if the last index is reachable.
     * - Parameters:
     *   - nums: The input jump array.
     * - Returns: A boolean value of true if reachable.
     */
    func canJump(_ nums: [Int]) -> Bool {
        var maxReachable = 0
        for i in 0..<nums.count {
            // If current index is beyond the maximum reachable point, fail
            if i > maxReachable {
                return false
            }
            
            // Update the furthest we can reach from the current position
            maxReachable = max(maxReachable, i + nums[i])
            
            // If we've reached or passed the last index, succeed
            if maxReachable >= nums.count - 1 {
                return true
            }
        }
        
        return maxReachable >= nums.count - 1
    }
}

// --- Test Cases ---
let sol = Solution()
print("Can reach last index for [2,3,1,1,4]: \(sol.canJump([2,3,1,1,4]))") // Expected: true
print("Can reach last index for [3,2,1,0,4]: \(sol.canJump([3,2,1,0,4]))") // Expected: false

/**
 * Problem: House Robber
 * Topic: Dynamic Programming / OneD
 * 
 * Description:
 * You are a professional robber planning to rob houses along a street. 
 * Each house has a certain amount of money stashed, the only constraint 
 * stopping you from robbing each of them is that adjacent houses 
 * have security systems connected and it will automatically contact 
 * the police if two adjacent houses were broken into on the same night.
 * Return the maximum amount of money you can rob tonight without alerting the police.
 * 
 * Pattern: OneD DP. At each house i, you have two choices: 
 * 1. Rob the house: Add nums[i] to the max money from i-2. 
 * 2. Skip the house: The max money is from house i-1.
 * 
 * Time Complexity: O(n) where n is number of houses.
 * Space Complexity: O(1) by using only two variables for previous states.
 */

import Foundation

class Solution {
    /**
     * Calculates the maximum money that can be robbed using DP.
     * - Parameters:
     *   - nums: Array of money stashed in each house.
     * - Returns: Maximum money found.
     */
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return nums[0] }
        
        var robPrevPrev = 0 // Max money from 2 houses ago
        var robPrev = 0     // Max money from the previous house
        
        // Iteratively calculate the max money using two variables
        for num in nums {
            let current = max(robPrev, robPrevPrev + num)
            robPrevPrev = robPrev
            robPrev = current
        }
        
        return robPrev
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max money for [1, 2, 3, 1]: \(sol.rob([1, 2, 3, 1]))")     // Expected: 4
print("Max money for [2, 7, 9, 3, 1]: \(sol.rob([2, 7, 9, 3, 1]))") // Expected: 12
print("Max money for [2, 1, 1, 2]: \(sol.rob([2, 1, 1, 2]))")       // Expected: 4

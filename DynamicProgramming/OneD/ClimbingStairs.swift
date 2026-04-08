/**
 * Problem: Climbing Stairs
 * Topic: Dynamic Programming / OneD
 * 
 * Description:
 * You are climbing a staircase. It takes n steps to reach the top.
 * Each time you can either climb 1 or 2 steps. In how many distinct 
 * ways can you climb to the top?
 * 
 * Pattern: OneD DP. The number of ways to reach step i is the sum of 
 * the ways to reach step i-1 and the ways to reach step i-2. 
 * This is equivalent to the Fibonacci sequence.
 * 
 * Time Complexity: O(n) where n is number of steps.
 * Space Complexity: O(1) by using only two variables to store previous states.
 */

import Foundation

class Solution {
    /**
     * Calculates the number of ways to climb n stairs.
     * - Parameters:
     *   - n: Total number of stairs.
     * - Returns: Total distinct ways.
     */
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        
        var first = 1
        var second = 2
        
        // Iteratively calculate the number of ways using two variables
        for _ in 3...n {
            let third = first + second
            first = second
            second = third
        }
        
        return second
    }
}

// --- Test Cases ---
let sol = Solution()
print("Ways to climb 2 stairs: \(sol.climbStairs(2))") // Expected: 2
print("Ways to climb 3 stairs: \(sol.climbStairs(3))") // Expected: 3
print("Ways to climb 5 stairs: \(sol.climbStairs(5))") // Expected: 8

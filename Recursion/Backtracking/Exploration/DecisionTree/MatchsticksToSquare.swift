/**
 * Problem: Matchsticks to Square
 * Topic: Recursion / Backtracking / Exploration / DecisionTree
 * 
 * Description:
 * You are given an integer array matchsticks where matchsticks[i] is the length 
 * of the i-th matchstick. You want to use all the matchsticks to make 
 * one square. Each side of the square should have an equal length and 
 * each matchstick should be used exactly once. 
 * Return true if you can make this square.
 * 
 * Pattern: For each matchstick, decide which of the 4 sides of the square 
 * it belongs to.
 * 
 * Time Complexity: O(4ⁿ) where n is number of matchsticks.
 * Space Complexity: O(n) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Determines if given matchsticks can form a square.
     * - Parameters:
     *   - matchsticks: The input integer array.
     * - Returns: A boolean value of true if a square can be formed.
     */
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let n = matchsticks.count
        if n < 4 { return false }
        
        let totalSum = matchsticks.reduce(0, +)
        if totalSum % 4 != 0 { return false }
        
        let sideLength = totalSum / 4
        
        // Sort descending to fail early on larger matchsticks
        let sortedMatchsticks = matchsticks.sorted(by: >)
        
        var sides = Array(repeating: 0, count: 4)
        
        return backtrack(sortedMatchsticks, 0, sideLength, &sides)
    }
    
    private func backtrack(_ matchsticks: [Int], _ index: Int, _ target: Int, _ sides: inout [Int]) -> Bool {
        if index == matchsticks.count {
            // Check if all 4 sides are equal to target
            return sides[0] == target && sides[1] == target && sides[2] == target && sides[3] == target
        }
        
        let matchstick = matchsticks[index]
        
        for i in 0..<4 {
            // Decide to place matchstick in side i
            if sides[i] + matchstick <= target {
                sides[i] += matchstick
                if backtrack(matchsticks, index + 1, target, &sides) {
                    return true
                }
                // Backtrack
                sides[i] -= matchstick
            }
            
            // If current side is empty and first matchstick fails, further searches will also fail
            if sides[i] == 0 { break }
        }
        
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
print("Matchsticks to Square [1,1,2,2,2]: \(sol.makesquare([1,1,2,2,2]))") // Expected: true
print("Matchsticks to Square [3,3,3,3,4]: \(sol.makesquare([3,3,3,3,4]))") // Expected: false

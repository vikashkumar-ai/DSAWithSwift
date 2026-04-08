/**
 * Problem: Combination Sum
 * Topic: Recursion / Backtracking / Exploration / ChooseExploreUnchoose
 * 
 * Description:
 * Given an array of distinct integers candidates and a target integer target, 
 * return a list of all unique combinations of candidates where the 
 * chosen numbers sum to target. 
 * You may return the combinations in any order.
 * The same number may be chosen from candidates an unlimited number of times.
 * 
 * Pattern: Choose a candidate, explore all combinations including it, 
 * then unchoose (backtrack) and move to the next candidate.
 * 
 * Time Complexity: O(2ⁿ) or O(N^(T/M + 1)) where N is number of candidates, 
 * T is target, and M is minimal candidate.
 * Space Complexity: O(T/M) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Generates all combination sums that reach target.
     * - Parameters:
     *   - candidates: The input integer array.
     *   - target: The target sum.
     * - Returns: A 2D array of combinations.
     */
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var currentCombination = [Int]()
        
        backtrack(candidates, target, 0, &currentCombination, &result)
        
        return result
    }
    
    private func backtrack(_ candidates: [Int], _ target: Int, _ index: Int, _ current: inout [Int], _ result: inout [[Int]]) {
        // Base case: target reached or exceeded
        if target == 0 {
            result.append(current)
            return
        }
        if target < 0 {
            return
        }
        
        for i in index..<candidates.count {
            // Choose the candidate
            current.append(candidates[i])
            
            // Explore: including the same candidate again as unlimited use is allowed
            backtrack(candidates, target - candidates[i], i, &current, &result)
            
            // Unchoose (Backtrack)
            current.removeLast()
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Combination Sum of [2, 3, 6, 7] for target 7: \(sol.combinationSum([2, 3, 6, 7], 7))")
// Expected: [[2, 2, 3], [7]]
print("Combination Sum of [2, 3, 5] for target 8: \(sol.combinationSum([2, 3, 5], 8))")
// Expected: [[2, 2, 2, 2], [2, 3, 3], [3, 5]]

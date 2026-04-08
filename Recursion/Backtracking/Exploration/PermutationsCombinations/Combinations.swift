/**
 * Problem: Combinations
 * Topic: Recursion / Backtracking / Exploration / PermutationsCombinations
 * 
 * Description:
 * Given two integers n and k, return all possible combinations of k 
 * numbers chosen from the range [1, n].
 * 
 * Pattern: At each step i, decide to include i and move to i+1, 
 * continuing until k elements are chosen.
 * 
 * Time Complexity: O(k * C(n, k)) where C(n, k) is binomial coefficient.
 * Space Complexity: O(k) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Generates all combinations of size k from range 1 to n.
     * - Parameters:
     *   - n: Upper limit of range.
     *   - k: Selection size.
     * - Returns: A 2D array of all combinations.
     */
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        
        backtrack(n, k, 1, &current, &result)
        
        return result
    }
    
    private func backtrack(_ n: Int, _ k: Int, _ index: Int, _ current: inout [Int], _ result: inout [[Int]]) {
        // Base case: we have chosen k elements
        if current.count == k {
            result.append(current)
            return
        }
        
        // Optimizing: if remaining numbers are fewer than needed, break
        for i in index...n {
            if (n - i + 1) < (k - current.count) { break }
            
            // Choose the candidate
            current.append(i)
            // Explore
            backtrack(n, k, i + 1, &current, &result)
            // Unchoose
            current.removeLast()
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Combinations of n=4, k=2: \(sol.combine(4, 2))")
// Expected: [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
print("Combinations of n=1, k=1: \(sol.combine(1, 1))")
// Expected: [[1]]

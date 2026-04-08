/**
 * Problem: Maximum Length Chain of Pairs
 * Topic: Greedy / IntervalGreedy / ActivitySelection
 * 
 * Description:
 * You are given n pairs of numbers. In every pair, the first number 
 * is always smaller than the second number. A pair (c, d) can 
 * follow another pair (a, b) if b < c. Find the longest chain which 
 * can be formed from a given set of pairs.
 * 
 * Pattern: Greedy (Activity Selection variant). Sort pairs by 
 * second number and pick the next pair that starts after the current 
 * chain's end.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    struct Pair: Comparable {
        let first: Int
        let second: Int
        
        static func < (lhs: Pair, rhs: Pair) -> Bool {
            return lhs.second < rhs.second
        }
    }
    
    /**
     * Finds the length of the longest chain of pairs.
     * - Parameters:
     *   - pairs: Array of [a, b].
     * - Returns: Length of the longest chain.
     */
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        var sortedPairs = pairs.map { Pair(first: $0[0], second: $0[1]) }
        sortedPairs.sort()
        
        var count = 0
        var currentEnd = Int.min
        
        for p in sortedPairs {
            if p.first > currentEnd {
                count += 1
                currentEnd = p.second
            }
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
print("Longest Chain for [[1,2],[2,3],[3,4]]: \(sol.findLongestChain([[1,2], [2,3], [3,4]]))") 
// Expected: 2 ([1,2] and [3,4])
print("Longest Chain for [[1,2],[7,8],[4,5]]: \(sol.findLongestChain([[1,2], [7,8], [4,5]]))")
// Expected: 3

/**
 * Problem: Russian Doll Envelopes (LIS Pattern)
 * Topic: Dynamic Programming / LIS
 * 
 * Description:
 * You are given a 2D array of integers envelopes where envelopes[i] = [wi, hi] 
 * represents the width and the height of an envelope.
 * One envelope can fit into another if and only if both the width 
 * and height of one envelope are greater than the other 
 * envelope's width and height.
 * Return the maximum number of envelopes you can Russian doll 
 * (i.e., put one inside another).
 * 
 * Pattern: Sort the envelopes by width in ascending order. 
 * If widths are the same, sort by height in descending order. 
 * Then perform LIS on the heights.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the maximum number of envelopes that can be nested.
     * - Parameters:
     *   - envelopes: Array of pairs [width, height].
     * - Returns: Count of nested envelopes.
     */
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        if envelopes.isEmpty { return 0 }
        
        // Step 1: Sort by width increasing. If width is the same, 
        // sort by height decreasing. 
        // This handles cases where one envelope cannot fit into another 
        // of same width.
        let sortedEnvelopes = envelopes.sorted { 
            if $0[0] != $1[0] {
                return $0[0] < $1[0]
            } else {
                return $0[1] > $1[1]
            }
        }
        
        // Step 2: Perform LIS (Longest Increasing Subsequence) on heights
        var heights = sortedEnvelopes.map { $0[1] }
        return lengthOfLIS(heights)
    }
    
    /**
     * Efficient LIS implementation using binary search (O(n log n)).
     */
    private func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int]()
        for num in nums {
            if let index = dp.firstIndex(where: { $0 >= num }) {
                dp[index] = num
            } else {
                dp.append(num)
            }
        }
        return dp.count
    }
}

// --- Test Cases ---
let sol = Solution()
let envelopes = [[5,4],[6,4],[6,7],[2,3]]
print("Max nested envelopes: \(sol.maxEnvelopes(envelopes))") // Expected: 3 ([2,3] -> [5,4] -> [6,7])
print("Max nested envelopes for [[1,1],[1,1],[1,1]]: \(sol.maxEnvelopes([[1,1],[1,1],[1,1]]))") // Expected: 1

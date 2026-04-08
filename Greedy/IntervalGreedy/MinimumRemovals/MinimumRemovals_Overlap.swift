/**
 * Problem: Minimum Removals to Make Intervals Non-Overlapping
 * Topic: Greedy / IntervalGreedy / MinimumRemovals
 * 
 * Description:
 * Given a set of intervals, find the minimum number of intervals 
 * to be removed so that no two intervals overlap. 
 * 
 * Pattern: Greedy. Sort intervals by finish time. This ensures 
 * we leave the maximum possible space for subsequent intervals.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(1) if sorting in place.
 */

import Foundation

class Solution {
    /**
     * Calculates the minimum number of removals required.
     * - Parameters:
     *   - intervals: List of [start, end] pairs.
     * - Returns: Minimum removal count.
     */
    func minRemovals(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        
        let sorted = intervals.sorted { $0[1] < $1[1] }
        var count = 0
        var lastEnd = Int.min
        
        for interval in sorted {
            if interval[0] >= lastEnd {
                lastEnd = interval[1]
            } else {
                count += 1
            }
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min removals for [[1,10],[2,3],[4,5],[6,7]]: \(sol.minRemovals([[1,10],[2,3],[4,5],[6,7]]))") 
// Expected: 1 ([1, 10])
print("Min removals for [[1,2],[1,2],[1,2]]: \(sol.minRemovals([[1,2],[1,2],[1,2]]))") 
// Expected: 2

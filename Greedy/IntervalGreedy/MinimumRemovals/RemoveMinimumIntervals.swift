/**
 * Problem: Remove Minimum Set of Intervals
 * Topic: Greedy / IntervalGreedy / MinimumRemovals
 * 
 * Description:
 * Given n intervals on a line, find the minimum number of 
 * intervals to remove to make the remaining intervals disjoint.
 * 
 * Pattern: Greedy. Sort by end points and count maximum non-overlapping 
 * intervals. Subtract this from total.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Finds the minimum number of removals.
     */
    func removeMinIntervals(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        
        let sortedIn = intervals.sorted { $0[1] < $1[1] }
        var kept = 0
        var currentEnd = Int.min
        
        for interval in sortedIn {
            if interval[0] >= currentEnd {
                kept += 1
                currentEnd = interval[1]
            }
        }
        
        return intervals.count - kept
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min removals in [[1,2],[2,3],[3,4]]: \(sol.removeMinIntervals([[1,2],[2,3],[3,4]]))") 
// Expected: 0
print("Min removals in [[1,2],[1,2],[1,2]]: \(sol.removeMinIntervals([[1,2],[1,2],[1,2]]))") 
// Expected: 2

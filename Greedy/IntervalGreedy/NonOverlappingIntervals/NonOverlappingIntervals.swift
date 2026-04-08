/**
 * Problem: Non-overlapping Intervals
 * Topic: Greedy / IntervalGreedy / NonOverlappingIntervals
 * 
 * Description:
 * Given an array of intervals [start_i, end_i], return the minimum 
 * number of intervals you need to remove to make the rest of the 
 * intervals non-overlapping.
 * 
 * Pattern: Greedy. Similar to Activity Selection. Sort by 
 * end time and keep as many as possible. The number of intervals 
 * to remove is total - max kept.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(1) if sorting in place.
 */

import Foundation

class Solution {
    /**
     * Calculates the minimum number of intervals to remove.
     * - Parameters:
     *   - intervals: 2D array of intervals.
     * - Returns: Removal count.
     */
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        
        // Step 1: Sort by finish time
        let sortedIntervals = intervals.sorted { $0[1] < $1[1] }
        
        var countKept = 0
        var currentEnd = Int.min
        
        for interval in sortedIntervals {
            if interval[0] >= currentEnd {
                countKept += 1
                currentEnd = interval[1]
            }
        }
        
        return intervals.count - countKept
    }
}

// --- Test Cases ---
let sol = Solution()
print("Erase Overlaps in [[1,2],[2,3],[3,4],[1,3]]: \(sol.eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]]))") 
// Expected: 1 ([1,3])
print("Erase Overlaps in [[1,2],[1,2],[1,2]]: \(sol.eraseOverlapIntervals([[1,2],[1,2],[1,2]]))") 
// Expected: 2

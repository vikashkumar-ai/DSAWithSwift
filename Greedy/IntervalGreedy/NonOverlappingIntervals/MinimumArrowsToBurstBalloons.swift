/**
 * Problem: Minimum Number of Arrows to Burst Balloons
 * Topic: Greedy / IntervalGreedy / NonOverlappingIntervals
 * 
 * Description:
 * There are some spherical balloons taped onto a flat wall. 
 * You are given an array points where points[i] = [x_start, x_end] 
 * represents the horizontal diameter of a balloon. 
 * An arrow can be shot up vertically from different points along the 
 * x-axis. A balloon with x_start and x_end is burst by an arrow shot 
 * at x if x_start <= x <= x_end. 
 * Return the minimum number of arrows that must be shot to burst 
 * all balloons.
 * 
 * Pattern: Greedy. Sort balloons by end coordinate. Always shoot an 
 * arrow at the end coordinate of the balloon to cover as many 
 * subsequent balloons as possible.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(1) if sorting in place.
 */

import Foundation

class Solution {
    /**
     * Finds the minimum number of arrows needed.
     * - Parameters:
     *   - points: 2D array of balloon horizontal diameters.
     * - Returns: Arrow count.
     */
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        if points.isEmpty { return 0 }
        
        // Step 1: Sort by finish coordinate
        let sortedPoints = points.sorted { $0[1] < $1[1] }
        
        var arrowCount = 1
        var currentEnd = sortedPoints[0][1]
        
        for i in 1..<sortedPoints.count {
            // If current balloon starts after the current arrow location
            if sortedPoints[i][0] > currentEnd {
                arrowCount += 1
                currentEnd = sortedPoints[i][1]
            }
            // else: the balloon is already burst by the current arrow
        }
        
        return arrowCount
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min arrows for [[10,16],[2,8],[1,6],[7,12]]: \(sol.findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))") 
// Expected: 2 ([6] and [12])
print("Min arrows for [[1,2],[2,3],[3,4]]: \(sol.findMinArrowShots([[1,2],[2,3],[3,4]]))")
// Expected: 2 ([2] and [4])

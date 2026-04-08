/**
 * Problem: Activity Selection (Maximum Number of Activities)
 * Topic: Greedy / ActivitySelection
 * 
 * Description:
 * You are given n activities with their start and finish times. Select 
 * the maximum number of activities that can be performed by a 
 * single person, assuming that a person can only work on a single 
 * activity at a time.
 * 
 * Pattern: Activity Selection.
 * 1. Sort all activities by their finish time.
 * 2. Pick the first activity.
 * 3. For every other activity, if its start time is greater than 
 *    or equal to the finish time of the last picked activity, pick it.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class ActivitySolver {
    struct Activity {
        let start: Int
        let finish: Int
    }
    
    /**
     * Finds the maximum number of activities.
     * - Parameters:
     *   - activities: List of (start, finish) tuples.
     * - Returns: Count of max activities.
     */
    func selectMaxActivities(_ activities: [(Int, Int)]) -> Int {
        var acts = activities.map { Activity(start: $0.0, finish: $0.1) }
        
        // Step 1: Sort by finish time
        acts.sort { $0.finish < $1.finish }
        
        var count = 0
        var lastFinish = -1
        
        for activity in acts {
            if activity.start >= lastFinish {
                count += 1
                lastFinish = activity.finish
            }
        }
        
        return count
    }
}

// --- Test Cases ---
let solver = ActivitySolver()
let activities = [(5, 9), (1, 2), (3, 4), (0, 6), (5, 7), (8, 9)]
print("Max Activities: \(solver.selectMaxActivities(activities))") 
// Expected: 4 (1-2, 3-4, 5-7, 8-9)

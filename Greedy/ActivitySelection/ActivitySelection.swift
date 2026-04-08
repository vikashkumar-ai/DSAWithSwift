/**
 * Problem: Activity Selection (Greedy approach)
 * Topic: Greedy / ActivitySelection
 * 
 * Description:
 * You are given n activities with their start and finish times. Select 
 * the maximum number of activities that can be performed by a single 
 * person, assuming that a person can only work on a single activity 
 * at a time.
 * 
 * Pattern: Sort activities by their finish time and pick the activity 
 * that finishes earliest and starts after the previous activity ends.
 * 
 * Time Complexity: O(n log n) where n is number of activities.
 * Space Complexity: O(1) if sorting in place.
 */

import Foundation

struct Activity {
    let start: Int
    let finish: Int
}

class Solution {
    /**
     * Finds the maximum number of non-overlapping activities.
     * - Parameters:
     *   - activities: List of activities each with start and finish times.
     * - Returns: Count of selected activities.
     */
    func activitySelection(_ activities: [Activity]) -> Int {
        // Step 1: Sort activities by their finish time
        let sortedActivities = activities.sorted { $0.finish < $1.finish }
        
        var count = 0
        var lastFinishTime = -1
        
        // Step 2: Pick activities that start after the previous one finishes
        for activity in sortedActivities {
            if activity.start >= lastFinishTime {
                count += 1
                lastFinishTime = activity.finish
            }
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
let activities = [Activity(start: 1, finish: 2), Activity(start: 3, finish: 4), Activity(start: 0, finish: 6), Activity(start: 5, finish: 7), Activity(start: 8, finish: 9), Activity(start: 5, finish: 9)]
print("Max Activities: \(sol.activitySelection(activities))") // Expected: 4

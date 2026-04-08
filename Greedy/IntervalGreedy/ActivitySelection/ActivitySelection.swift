/**
 * Problem: Activity Selection (N meetings in one room)
 * Topic: Greedy / IntervalGreedy / ActivitySelection
 * 
 * Description:
 * You are given n activities with their start and finish times. 
 * Select the maximum number of activities that can be performed by 
 * a single person, assuming that a person can only work on a 
 * single activity at a time.
 * 
 * Pattern: Greedy. Sort activities by finish time and always 
 * pick the one that finishes earliest to leave maximum time 
 * for other activities.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    struct Activity {
        let start: Int
        let finish: Int
    }
    
    /**
     * Finds the maximum number of activities that can be performed.
     * - Parameters:
     *   - start: Array of start times.
     *   - finish: Array of finish times.
     * - Returns: Count of max activities.
     */
    func maxActivities(_ start: [Int], _ finish: [Int]) -> Int {
        var activities = [Activity]()
        for i in 0..<start.count {
            activities.append(Activity(start: start[i], finish: finish[i]))
        }
        
        // Step 1: Sort by finish time
        activities.sort { $0.finish < $1.finish }
        
        var count = 0
        var lastFinishTime = -1
        
        for activity in activities {
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
print("Max Activities for [1,3,0,5,8,5] and [2,4,6,7,9,9]: \(sol.maxActivities([1,3,0,5,8,5], [2,4,6,7,9,9]))") 
// Expected: 4 (Activity 1, 2, 4, 5)

/**
 * Problem: Meeting Rooms II (Minimum Number of Meeting Rooms)
 * Topic: Greedy / ResourceAllocation / MeetingRooms
 * 
 * Description:
 * Given an array of meeting time intervals consisting of start 
 * and end times [[s1,e1],[s2,e2],...] (si < ei), find the 
 * minimum number of conference rooms required.
 * 
 * Pattern: Two-Pointer Overlap Management.
 * 1. Store start and end times in separate sorted arrays.
 * 2. Maintain two pointers: 'startPtr' and 'endPtr'.
 * 3. If current start < current end:
 *    - A new room is needed (increment roomCount).
 *    - Move startPtr.
 * 4. Otherwise:
 *    - A room becomes free (decrement roomCount).
 *    - Move endPtr.
 * 
 * Time Complexity: O(n log n) for sorting.
 * Space Complexity: O(n).
 */

import Foundation

class MeetingRoomsIISolver {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        
        let starts = intervals.map { $0[0] }.sorted()
        let ends = intervals.map { $0[1] }.sorted()
        
        var rooms = 0
        var maxRooms = 0
        var startPtr = 0
        var endPtr = 0
        
        // Use two pointers to simulate room allocation
        while startPtr < intervals.count {
            if starts[startPtr] < ends[endPtr] {
                // Next meeting starts before the earlier meeting ends
                rooms += 1
                startPtr += 1
            } else {
                // Next meeting starts after/at same time as an earlier meeting ends
                rooms -= 1
                endPtr += 1
            }
            maxRooms = max(maxRooms, rooms)
        }
        
        return maxRooms
    }
}

// --- Test Cases ---
let solver = MeetingRoomsIISolver()
let intervals1 = [[0, 30], [5, 10], [15, 20]]
print("Min Meeting Rooms in [[0, 30], [5, 10], [15, 20]]: \(solver.minMeetingRooms(intervals1))") 
// Expected: 2
let intervals2 = [[7, 10], [2, 4]]
print("Min Meeting Rooms in [[7, 10], [2, 4]]: \(solver.minMeetingRooms(intervals2))") 
// Expected: 1

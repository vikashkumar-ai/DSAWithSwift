/**
 * Problem: Meeting Rooms (Can Attend All?)
 * Topic: Greedy / ResourceAllocation / MeetingRooms
 * 
 * Description:
 * Given an array of meeting time intervals consisting of start 
 * and end times [[s1,e1],[s2,e2],...] (si < ei), determine if 
 * a person could attend all meetings.
 * 
 * Pattern: Sorting and Overlap Check.
 * 1. Sort intervals by start time.
 * 2. Check if the start of the next meeting is before the 
 *    end of the previous meeting.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(1) or O(n).
 */

import Foundation

class MeetingRoomsSolver {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        
        for i in 1..<sortedIntervals.count {
            if sortedIntervals[i][0] < sortedIntervals[i-1][1] {
                return false
            }
        }
        
        return true
    }
}

// --- Test Cases ---
let solver = MeetingRoomsSolver()
print("Can attend [[0,30],[5,10],[15,20]]: \(solver.canAttendMeetings([[0,30],[5,10],[15,20]]))") // Expected: false
print("Can attend [[7,10],[2,4]]: \(solver.canAttendMeetings([[7,10],[2,4]]))") // Expected: true

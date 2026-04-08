/**
 * Problem: N Meetings in One Room
 * Topic: Greedy / ActivitySelection
 * 
 * Description:
 * There is one meeting room in a firm. There are N meetings in 
 * the form of (S[i], F[i]) where S[i] is the start time of 
 * meeting i and F[i] is the finish time of meeting i. 
 * What is the maximum number of meetings that can be 
 * accommodated in the meeting room?
 * 
 * Pattern: Activity Selection.
 * 1. Sort all meetings by finish time.
 * 2. Pick the first meeting.
 * 3. For subsequent meetings, pick if start time > finish time of last.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class MeetingsSolver {
    struct Meeting {
        let start: Int
        let end: Int
        let index: Int
    }
    
    /**
     * Finds the maximum number of meetings possible.
     * - Parameters:
     *   - start: List of start times.
     *   - end: List of end times.
     * - Returns: Count of max meetings.
     */
    func maxMeetings(start: [Int], end: [Int]) -> Int {
        let n = start.count
        var meetings = [Meeting]()
        
        for i in 0..<n {
            meetings.append(Meeting(start: start[i], end: end[i], index: i + 1))
        }
        
        // Sort by finish time
        meetings.sort { $0.end < $1.end }
        
        var count = 0
        var lastEndTime = -1
        
        for meeting in meetings {
            if meeting.start > lastEndTime {
                count += 1
                lastEndTime = meeting.end
            }
        }
        
        return count
    }
}

// --- Test Cases ---
let solver = MeetingsSolver()
let start = [1, 3, 0, 5, 8, 5]
let end = [2, 4, 6, 7, 9, 9]
print("Max Meetings: \(solver.maxMeetings(start: start, end: end))") 
// Expected: 4 (1-2, 3-4, 5-7, 8-9)

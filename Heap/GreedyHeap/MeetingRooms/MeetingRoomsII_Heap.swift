/**
 * Problem: Meeting Rooms II (Using Min-Heap)
 * Topic: Heap / GreedyHeap / MeetingRooms
 * 
 * Description:
 * Given an array of meeting time intervals consisting of start 
 * and end times [[s1,e1],[s2,e2],...] (si < ei), find the 
 * minimum number of conference rooms required.
 * 
 * Pattern: Min-Heap for Ongoing Meetings.
 * 1. Sort intervals by start time.
 * 2. maintain a Min-Heap of end times of ongoing meetings.
 * 3. Before adding a new meeting, if its start time >= min-heap root:
 *    - The earliest meeting has finished. Pop from heap.
 * 4. Push the current meeting's end time.
 * 5. Final heap size = minimum rooms required.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class MeetingRoomsHeapSolver {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        
        // Step 1: Sort by start time
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        
        // Min-Heap of end times
        var minHeap = [Int]()
        
        for interval in sortedIntervals {
            if !minHeap.isEmpty && interval[0] >= minHeap[0] {
                // Room is reusable
                minHeap.remove(at: 0) // Manual min-pop
            }
            minHeap.append(interval[1])
            minHeap.sort() // Maintain heap property
        }
        
        return minHeap.count
    }
}

// --- Test Cases ---
let solver = MeetingRoomsHeapSolver()
let intervals = [[0, 30], [5, 10], [15, 20]]
print("Min Rooms (Heap): \(solver.minMeetingRooms(intervals))") // Expected: 2

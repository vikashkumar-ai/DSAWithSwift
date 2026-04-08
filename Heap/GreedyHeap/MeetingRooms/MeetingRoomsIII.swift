/**
 * Problem: Meeting Rooms III (Heap-based Resource Allocation)
 * Topic: Heap / GreedyHeap / MeetingRooms
 * 
 * Description:
 * You are given an integer n. There are n rooms numbered from 0 to n - 1. 
 * You are given a 2D integer array meetings where 
 * meetings[i] = [start, end] means that a meeting will be held during 
 * the half-closed time interval [start, end). All the values of 
 * start are unique.
 * Return the number of the room that held the most meetings. If there 
 * are multiple rooms, return the room with the lowest number.
 * 
 * Pattern: Two Heaps. Use a min-heap to store available rooms and 
 * another min-heap to store rooms currently in use (sorted by end time).
 * 
 * Time Complexity: O(m log m + m log n) where m is number of meetings.
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    struct BusyRoom: Comparable {
        let endTime: Int
        let roomIdx: Int
        
        static func < (lhs: BusyRoom, rhs: BusyRoom) -> Bool {
            if lhs.endTime != rhs.endTime {
                return lhs.endTime < rhs.endTime
            }
            return lhs.roomIdx < rhs.roomIdx
        }
    }
    
    /**
     * Finds the room that held the most meetings.
     * - Parameters:
     *   - n: Number of rooms.
     *   - meetings: Array of meeting intervals [start, end].
     * - Returns: Index of the most used room.
     */
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        var roomCounts = Array(repeating: 0, count: n)
        
        // Sort meetings by start time
        let sortedMeetings = meetings.sorted { $0[0] < $1[0] }
        
        // availableRooms: Min-Heap of room indices
        var availableRooms = Array(0..<n)
        availableRooms.sort()
        
        // busyRooms: Min-Heap of (endTime, roomIdx)
        var busyRooms = [BusyRoom]()
        
        for meeting in sortedMeetings {
            let start = meeting[0]
            let end = meeting[1]
            
            // Release rooms that have finished their meetings
            while !busyRooms.isEmpty && busyRooms.first!.endTime <= start {
                let freed = busyRooms.removeFirst()
                availableRooms.append(freed.roomIdx)
                availableRooms.sort()
                busyRooms.sort() // Re-sort simulation
            }
            
            if !availableRooms.isEmpty {
                // Room is available
                let roomIdx = availableRooms.removeFirst()
                roomCounts[roomIdx] += 1
                busyRooms.append(BusyRoom(endTime: end, roomIdx: roomIdx))
                busyRooms.sort()
            } else {
                // No room available, pick the one that ends earliest
                let earliest = busyRooms.removeFirst()
                roomCounts[earliest.roomIdx] += 1
                let newEnd = earliest.endTime + (end - start)
                busyRooms.append(BusyRoom(endTime: newEnd, roomIdx: earliest.roomIdx))
                busyRooms.sort()
            }
        }
        
        // Find room with max count, then min index
        var maxCount = -1
        var result = 0
        for i in 0..<n {
            if roomCounts[i] > maxCount {
                maxCount = roomCounts[i]
                result = i
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Most Booked Room (n=2, meetings=[[0,10],[1,5],[2,7],[3,4]]): \(sol.mostBooked(2, [[0,10],[1,5],[2,7],[3,4]]))") 
// Expected: 0
print("Most Booked Room (n=3, meetings=[[1,20],[2,10],[3,5],[4,9],[6,8]]): \(sol.mostBooked(3, [[1,20],[2,10],[3,5],[4,9],[6,8]]))")
// Expected: 1

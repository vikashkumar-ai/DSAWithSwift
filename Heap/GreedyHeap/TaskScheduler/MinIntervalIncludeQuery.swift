/**
 * Problem: Minimum Interval to Include Each Query (using Min-Heap)
 * Topic: Heap / GreedyHeap / TaskScheduler
 * 
 * Description:
 * You are given a 2D integer array intervals, where 
 * intervals[i] = [left_i, right_i] describes the i-th interval. 
 * You are also given an integer array queries. 
 * The response to the j-th query is the size of the smallest 
 * interval i such that left_i <= queries[j] <= right_i. 
 * If no such interval exists, the response is -1.
 * 
 * Pattern: Sorted Queries + Min-Heap. Sort the queries and the 
 * intervals. As we process each query, add all intervals that 
 * start before or at the query point into a Min-Heap (sorted by 
 * interval size). Remove intervals from the heap that end before 
 * the query point.
 * 
 * Time Complexity: O(n log n + q log q).
 * Space Complexity: O(n + q).
 */

import Foundation

class Solution {
    struct IntervalSize: Comparable {
        let size: Int
        let right: Int
        
        static func < (lhs: IntervalSize, rhs: IntervalSize) -> Bool {
            return lhs.size < rhs.size
        }
    }
    
    /**
     * Finds the smallest interval encompassing each query.
     * - Parameters:
     *   - intervals: List of [left, right] intervals.
     *   - queries: List of query points.
     * - Returns: Array of minimum interval sizes.
     */
    func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
        let n = intervals.count
        let q = queries.count
        
        // Sort intervals by start time
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        
        // Sort queries while keeping original indices
        let sortedQueries = queries.enumerated().sorted { $0.element < $1.element }
        
        var result = Array(repeating: -1, count: q)
        var heap = [IntervalSize]() // Min-Heap of (size, right_bound)
        var i = 0
        
        for (qIdx, queryVal) in sortedQueries {
            // Step 1: Add all intervals starting at or before queryVal
            while i < n && sortedIntervals[i][0] <= queryVal {
                let left = sortedIntervals[i][0]
                let right = sortedIntervals[i][1]
                heap.append(IntervalSize(size: right - left + 1, right: right))
                heap.sort() // Min-Heap simulation
                i += 1
            }
            
            // Step 2: Remove intervals that end before queryVal
            while !heap.isEmpty && heap.first!.right < queryVal {
                heap.removeFirst()
                heap.sort()
            }
            
            // Step 3: Top of heap is the smallest interval
            if !heap.isEmpty {
                result[qIdx] = heap.first!.size
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min Intervals for queries [2,19,5,22] in [[1,4],[2,4],[3,6],[4,4]]: \(sol.minInterval([[1,4],[2,4],[3,6],[4,4]], [2,19,5,22]))")
// Expected: [3, -1, 4, -1]

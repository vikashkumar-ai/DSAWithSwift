/**
 * Problem: Job Scheduling with Maximum Profit (Greedy with Sorting)
 * Topic: Greedy / SchedulingGreedy / ProfitBasedSelection
 * 
 * Description:
 * Find the maximum profit you can make by scheduling jobs such that 
 * no two jobs overlap. Each job has a start time, end time, and profit.
 * 
 * Pattern: Greedy with Sorting and Binary Search. Sort jobs by 
 * end time. For each job, find the maximum profit possible using a 
 * previous non-overlapping job (Binary Search on end times).
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    struct Job {
        let start: Int
        let end: Int
        let profit: Int
    }
    
    /**
     * Calculates the maximum profit for non-overlapping jobs.
     * - Parameters:
     *   - jobs: List of (start, end, profit).
     * - Returns: Maximum profit.
     */
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        var jobs = [Job]()
        for i in 0..<startTime.count {
            jobs.append(Job(start: startTime[i], end: endTime[i], profit: profit[i]))
        }
        
        // Step 1: Sort by end time
        jobs.sort { $0.end < $1.end }
        
        var dp = [(time: Int, profit: Int)]()
        dp.append((0, 0)) // (endTime, totalProfit)
        
        for job in jobs {
            // Step 2: Binary Search for the latest job that ends before current start
            var i = 0
            var j = dp.count - 1
            while i < j {
                let mid = i + (j - i + 1) / 2
                if dp[mid].time <= job.start {
                    i = mid
                } else {
                    j = mid - 1
                }
            }
            
            let currentTotal = dp[i].profit + job.profit
            if currentTotal > dp.last!.profit {
                dp.append((job.end, currentTotal))
            }
        }
        
        return dp.last!.profit
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max Profit for [1,2,3,3], [3,4,5,6], [50,10,40,70]: \(sol.jobScheduling([1,2,3,3], [3,4,5,6], [50,10,40,70]))") 
// Expected: 120 (Job 1 and Job 4)
print("Max Profit for [1,2,3,4,6], [3,5,10,6,9], [20,20,100,70,60]: \(sol.jobScheduling([1,2,3,4,6], [3,5,10,6,9], [20,20,100,70,60]))") 
// Expected: 150

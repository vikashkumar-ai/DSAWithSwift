/**
 * Problem: Fractional Job Scheduling
 * Topic: Greedy / SchedulingGreedy / DeadlineBasedScheduling
 * 
 * Description:
 * In some cases, we can complete a fraction of a job and get 
 * corresponding fractional profit. Given n jobs with profits 
 * and time requirements, find the maximum profit that can be 
 * earned in a given total time T.
 * 
 * Pattern: Greedy. Similar to Fractional Knapsack. Sort jobs 
 * by their profit/time ratio and pick full or partial jobs 
 * to fill the time.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    struct Job {
        let profit: Int
        let time: Int
        var ratio: Double { return Double(profit) / Double(time) }
    }
    
    /**
     * Finds the maximum profit with fractional job completion.
     * - Parameters:
     *   - jobs: Array of jobs.
     *   - totalTime: Capacity.
     * - Returns: Total fractional profit.
     */
    func maxProfitFractional(_ jobs: [Job], _ totalTime: Int) -> Double {
        // Sort by profit-to-time ratio in descending order
        let sortedJobs = jobs.sorted { $0.ratio > $1.ratio }
        
        var currentProfit = 0.0
        var remainingTime = totalTime
        
        for job in sortedJobs {
            if remainingTime >= job.time {
                // Take the full job
                currentProfit += Double(job.profit)
                remainingTime -= job.time
            } else {
                // Take fraction
                currentProfit += Double(job.ratio) * Double(remainingTime)
                break
            }
        }
        
        return currentProfit
    }
}

// --- Test Cases ---
let sol = Solution()
let jobs = [
    Solution.Job(profit: 60, time: 10),
    Solution.Job(profit: 100, time: 20),
    Solution.Job(profit: 120, time: 30)
]
let maxProfit = sol.maxProfitFractional(jobs, 50)
print("Max Profit (T=50): \(maxProfit)") // Expected: 240.0 (60 + 100 + 80)

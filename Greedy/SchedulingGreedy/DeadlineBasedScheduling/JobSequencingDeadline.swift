/**
 * Problem: Job Sequencing with Deadlines
 * Topic: Greedy / SchedulingGreedy / DeadlineBasedScheduling
 * 
 * Description:
 * Given a set of n jobs where each job i has a deadline d_i and 
 * profit p_i, find the maximum profit that can be earned by 
 * scheduling all jobs such that every job finishes before its deadline. 
 * Each job takes 1 unit of time and only one job can be scheduled 
 * at any time.
 * 
 * Pattern: Greedy with sorting and time slot allocation. Sort jobs 
 * by profit in descending order. For each job, try to schedule it 
 * as late as possible before its deadline.
 * 
 * Time Complexity: O(n log n + n * max_deadline).
 * Space Complexity: O(max_deadline).
 */

import Foundation

class Solution {
    struct Job {
        let id: String
        let deadline: Int
        let profit: Int
    }
    
    /**
     * Finds the maximum profit by sequencing jobs.
     * - Parameters:
     *   - jobs: Array of Job structs.
     * - Returns: (Job Count, Total Profit).
     */
    func jobSequencing(_ jobs: [Job]) -> (Int, Int) {
        // Step 1: Sort by profit descending
        let sortedJobs = jobs.sorted { $0.profit > $1.profit }
        
        let maxDeadline = jobs.map { $0.deadline }.max() ?? 0
        var slots = Array(repeating: false, count: maxDeadline + 1)
        
        var count = 0
        var totalProfit = 0
        
        for job in sortedJobs {
            // Step 2: Try to schedule job as late as possible
            for t in (1...job.deadline).reversed() {
                if !slots[t] {
                    slots[t] = true
                    count += 1
                    totalProfit += job.profit
                    break
                }
            }
        }
        
        return (count, totalProfit)
    }
}

// --- Test Cases ---
let sol = Solution()
let jobs = [
    Solution.Job(id: "a", deadline: 2, profit: 100),
    Solution.Job(id: "b", deadline: 1, profit: 19),
    Solution.Job(id: "c", deadline: 2, profit: 27),
    Solution.Job(id: "d", deadline: 1, profit: 25),
    Solution.Job(id: "e", deadline: 3, profit: 15)
]
let result = sol.jobSequencing(jobs)
print("Count: \(result.0), Profit: \(result.1)") 
// Expected: Count: 3, Profit: 142 (a, c, e)

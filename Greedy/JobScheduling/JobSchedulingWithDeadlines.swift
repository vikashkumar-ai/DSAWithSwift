/**
 * Problem: Job Scheduling with Deadlines (Greedy approach)
 * Topic: Greedy / JobScheduling
 * 
 * Description:
 * Given a set of N jobs where each job i has a deadline and profit 
 * associated with it. Each job takes 1 unit of time to complete and 
 * only one job can be scheduled at a time. We earn the profit if 
 * and only if the job is completed by its deadline. 
 * Find the maximum profit and the number of jobs completed.
 * 
 * Pattern: Sort jobs by profit in descending order and try to 
 * schedule each job as late as possible before its deadline.
 * 
 * Time Complexity: O(n log n) for sorting + O(n * T) where T is max deadline.
 * Space Complexity: O(T) for the slots array.
 */

import Foundation

struct Job {
    let id: Int
    let deadline: Int
    let profit: Int
}

class Solution {
    /**
     * Finds the maximum profit from N jobs with deadlines.
     * - Parameters:
     *   - jobs: List of jobs each with id, deadline, and profit.
     *   - maxDeadline: Maximum deadline found among all jobs.
     * - Returns: A tuple containing (number of jobs, max profit).
     */
    func jobScheduling(_ jobs: [Job], _ maxDeadline: Int) -> (Int, Int) {
        // Step 1: Sort jobs in descending order of profit
        let sortedJobs = jobs.sorted { $0.profit > $1.profit }
        
        // Step 2: Use an array to keep track of occupied time slots
        var slots = Array(repeating: -1, count: maxDeadline + 1)
        var count = 0
        var maxProfit = 0
        
        for job in sortedJobs {
            // Try to schedule the job as late as possible
            for d in (1...min(maxDeadline, job.deadline)).reversed() {
                if slots[d] == -1 {
                    slots[d] = job.id
                    count += 1
                    maxProfit += job.profit
                    break
                }
            }
        }
        
        return (count, maxProfit)
    }
}

// --- Test Cases ---
let sol = Solution()
let jobs = [
    Job(id: 1, deadline: 4, profit: 20),
    Job(id: 2, deadline: 1, profit: 10),
    Job(id: 3, deadline: 1, profit: 40),
    Job(id: 4, deadline: 1, profit: 30)
]
let result = sol.jobScheduling(jobs, 4)
print("Max Profit (Number of Jobs): \(result.1) (\(result.0))") // Expected: 60 (2)

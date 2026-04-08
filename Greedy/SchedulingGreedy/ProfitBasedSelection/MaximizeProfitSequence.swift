/**
 * Problem: Maximize Profit in Job Scheduling (Greedy Strategy)
 * Topic: Greedy / SchedulingGreedy / ProfitBasedSelection
 * 
 * Description:
 * Given n jobs where each job i has a deadline d_i and profit p_i, 
 * find the maximum profit that can be earned by scheduling jobs 
 * in a way that each scheduled job finishes before its deadline.
 * 
 * Pattern: Greedy with sorting and Disjoint Set Union (DSU) optimization 
 * for time slots. Sort jobs by profit and for each job, find 
 * the latest available time slot using DSU.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(max_deadline).
 */

import Foundation

class Solution {
    struct Job {
        let id: Int
        let deadline: Int
        let profit: Int
    }
    
    /**
     * Sequences jobs for maximum profit using a greedy strategy.
     * - Parameters:
     *   - jobs: Array of Job objects.
     * - Returns: Total maximum profit.
     */
    func maxProfitGreedy(_ jobs: [Job]) -> Int {
        let sortedJobs = jobs.sorted { $0.profit > $1.profit }
        let maxDeadline = jobs.map { $0.deadline }.max() ?? 0
        
        var parents = Array(0...maxDeadline)
        func find(_ i: Int) -> Int {
            if parents[i] == i { return i }
            parents[i] = find(parents[i])
            return parents[i]
        }
        
        var totalProfit = 0
        for job in sortedJobs {
            let availableSlot = find(job.deadline)
            if availableSlot > 0 {
                // Assign to availableSlot and move slot pointer
                parents[availableSlot] = find(availableSlot - 1)
                totalProfit += job.profit
            }
        }
        
        return totalProfit
    }
}

// --- Test Cases ---
let sol = Solution()
let jobs = [
    Solution.Job(id: 1, deadline: 2, profit: 100),
    Solution.Job(id: 2, deadline: 1, profit: 19),
    Solution.Job(id: 3, deadline: 2, profit: 27),
    Solution.Job(id: 4, deadline: 1, profit: 25),
    Solution.Job(id: 5, deadline: 3, profit: 15)
]
print("Max Profit (Greedy-DSU): \(sol.maxProfitGreedy(jobs))") 
// Expected: 142

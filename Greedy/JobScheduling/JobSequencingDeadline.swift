/**
 * Problem: Job Sequencing with Deadlines (Maximum Profit)
 * Topic: Greedy / JobScheduling
 * 
 * Description:
 * Given n jobs where each job i has a deadline d_i and profit p_i, 
 * find the maximum profit that can be earned by scheduling 
 * the jobs such that each scheduled job is completed by its deadline.
 * 
 * Pattern: Greedy with Sorting and Slot Allocation.
 * 1. Sort all jobs by their profit in descending order.
 * 2. Find the maximum deadline (T).
 * 3. Create a result array 'slots' of size T, initialized as empty.
 * 4. For each job, try to place it in the latest available slot 
 *    that is <= its deadline.
 * 
 * Time Complexity: O(n log n) for sorting + O(n * max_deadline).
 * Space Complexity: O(max_deadline).
 */

import Foundation

class JobSequencing {
    struct Job {
        let id: Int
        let deadline: Int
        let profit: Int
    }
    
    /**
     * Sequences jobs for maximum profit.
     * - Parameters:
     *   - jobs: List of (id, deadline, profit).
     * - Returns: (Count of jobs, Max profit).
     */
    func maxProfitJobs(_ jobs: [(Int, Int, Int)]) -> (Int, Int) {
        let n = jobs.count
        var sortedJobs = jobs.map { Job(id: $0.0, deadline: $0.1, profit: $0.2) }
        
        // Step 1: Sort by profit descending
        sortedJobs.sort { $0.profit > $1.profit }
        
        let maxDeadline = sortedJobs.map { $0.deadline }.max() ?? 0
        var slots = Array(repeating: -1, count: maxDeadline + 1)
        
        var totalProfit = 0
        var count = 0
        
        for job in sortedJobs {
            // Step 4: Find the latest available slot
            for j in (1...job.deadline).reversed() {
                if slots[j] == -1 {
                    slots[j] = job.id
                    totalProfit += job.profit
                    count += 1
                    break
                }
            }
        }
        
        return (count, totalProfit)
    }
}

// --- Test Cases ---
let solver = JobSequencing()
let jobs = [(1, 4, 20), (2, 1, 10), (3, 1, 40), (4, 1, 30)]
let result = solver.maxProfitJobs(jobs)
print("Jobs count: \(result.0), Total Profit: \(result.1)") 
// Expected: count: 2, profit: 60 (J3 and J1)

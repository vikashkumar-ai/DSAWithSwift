/**
 * Problem: Maximum Profit in Job Scheduling (Weighted)
 * Topic: Greedy / JobScheduling
 * 
 * Description:
 * You have n jobs, where each job is represented by startTime, 
 * endTime, and profit. Find the maximum profit you can make 
 * such that no two jobs in the subset overlap. If you 
 * choose a job that ends at time X, you can start another 
 * job that starts at time X.
 * 
 * Pattern: Sorting + DP + Binary Search.
 * 1. Sort all jobs according to their finish time.
 * 2. Maintain a DP table where dp[i] is the maximum profit 
 *    considering the first i jobs.
 * 3. Use Binary Search to find the latest non-overlapping 
 *    job ending before the current job starts.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class WeightedJobSolver {
    struct Job {
        let start: Int
        let end: Int
        let profit: Int
    }
    
    /**
     * Calculates the maximum profit.
     * - Parameters:
     *   - startTime: List of start times.
     *   - endTime: List of end times.
     *   - profit: List of profit values.
     * - Returns: Maximum profit.
     */
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let n = startTime.count
        var jobs = [Job]()
        for i in 0..<n {
            jobs.append(Job(start: startTime[i], end: endTime[i], profit: profit[i]))
        }
        
        // Step 1: Sort by finish time
        jobs.sort { $0.end < $1.end }
        
        var dp = Array(repeating: 0, count: n)
        dp[0] = jobs[0].profit
        
        for i in 1..<n {
            // Option 1: Exclude current job
            var profitCount = dp[i - 1]
            
            // Option 2: Include current job
            var inclusiveProfit = jobs[i].profit
            let lastJobIndex = findLastNonOverlapping(jobs, i)
            if lastJobIndex != -1 {
                inclusiveProfit += dp[lastJobIndex]
            }
            
            dp[i] = max(profitCount, inclusiveProfit)
        }
        
        return dp[n - 1]
    }
    
    private func findLastNonOverlapping(_ jobs: [Job], _ index: Int) -> Int {
        var low = 0
        var high = index - 1
        var result = -1
        
        while low <= high {
            let mid = low + (high - low) / 2
            if jobs[mid].end <= jobs[index].start {
                result = mid
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let solver = WeightedJobSolver()
let startTimes = [1, 2, 3, 3], endTimes = [3, 4, 5, 6], profits = [50, 10, 40, 70]
print("Max Profit (Weighted): \(solver.jobScheduling(startTimes, endTimes, profits))") 
// Expected: 120 (Job 1 and Job 4)

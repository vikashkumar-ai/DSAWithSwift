/**
 * Problem: Task Scheduler
 * Topic: Heap / GreedyHeap / TaskScheduler
 * 
 * Description:
 * Given a characters array tasks, representing the tasks a CPU needs 
 * to do, where each letter represents a different task. Tasks could 
 * be done in any order. Each task is done in one unit of time. 
 * For each unit of time, the CPU could complete either one task or 
 * just be idle. 
 * However, there is a non-negative integer n that represents the 
 * cooldown period between two same tasks. 
 * Return the least number of units of times that the CPU will take 
 * to finish all the given tasks.
 * 
 * Pattern: Greedy with Heap. At each step, choose the task with 
 * the highest frequency that is currently not in cooldown.
 * 
 * Time Complexity: O(tasks log k) where k is 26.
 * Space Complexity: O(k).
 */

import Foundation

class Solution {
    struct TaskFreq: Comparable {
        let task: Character
        var freq: Int
        
        static func < (lhs: TaskFreq, rhs: TaskFreq) -> Bool {
            return lhs.freq < rhs.freq
        }
    }
    
    /**
     * Calculates the minimum time to complete all tasks.
     * - Parameters:
     *   - tasks: Array of task characters.
     *   - n: Cooldown period.
     * - Returns: Minimum total time.
     */
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var count = [Character: Int]()
        for task in tasks {
            count[task, default: 0] += 1
        }
        
        var heap = count.map { TaskFreq(task: $0.key, freq: $0.value) }
        heap.sort(by: >)
        
        var totalTime = 0
        
        while !heap.isEmpty {
            var temp = [TaskFreq]()
            // Current cycle length is n + 1
            for _ in 0...n {
                if !heap.isEmpty {
                    var current = heap.removeFirst()
                    current.freq -= 1
                    if current.freq > 0 {
                        temp.append(current)
                    }
                }
                
                totalTime += 1
                // If we've finished all tasks, return early
                if heap.isEmpty && temp.isEmpty { return totalTime }
            }
            
            // Re-add unfinished tasks to the heap
            for t in temp {
                heap.append(t)
            }
            heap.sort(by: >)
        }
        
        return totalTime
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min time for [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"] with n=2: \(sol.leastInterval(["A","A","A","B","B","B"], 2))")
// Expected: 8 (A -> B -> idle -> A -> B -> idle -> A -> B)

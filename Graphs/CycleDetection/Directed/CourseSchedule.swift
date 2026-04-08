/**
 * Problem: Course Schedule (Cycle Detection)
 * Topic: Graphs / Cycle Detection
 * 
 * Description:
 * There are a total of numCourses courses you have to take, labeled 
 * from 0 to numCourses - 1. You are given an array prerequisites 
 * where prerequisites[i] = [a, b] indicates that you must take course 
 * b first if you want to take course a.
 * Return true if you can finish all courses. Otherwise, return false.
 * 
 * Pattern: This is a classic directed graph cycle detection problem. 
 * If the graph has a cycle, it's impossible to finish all courses.
 * 
 * Time Complexity: O(V + E) where V is number of courses and E is 
 * number of prerequisites.
 * Space Complexity: O(V + E) for the adjacency list and visited states.
 */

import Foundation

class Solution {
    /**
     * Determines if all courses can be finished using DFS for cycle detection.
     * - Parameters:
     *   - numCourses: Total number of courses.
     *   - prerequisites: List of directed edges [target, source].
     * - Returns: A boolean value of true if no cycle exists.
     */
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // Step 1: Build the adjacency list
        var adj = Array(repeating: [Int](), count: numCourses)
        for pre in prerequisites {
            adj[pre[1]].append(pre[0])
        }
        
        // Step 2: Track visited states
        // 0: Unvisited, 1: Visiting (in current path), 2: Visited (safe)
        var visited = Array(repeating: 0, count: numCourses)
        
        // Step 3: Run DFS on each unvisited course
        for i in 0..<numCourses {
            if hasCycle(i, adj, &visited) {
                return false
            }
        }
        
        return true
    }
    
    /**
     * Helper to detect cycle using DFS.
     */
    private func hasCycle(_ node: Int, _ adj: [[Int]], _ visited: inout [Int]) -> Bool {
        if visited[node] == 1 { return true } // Found a back-edge (cycle)
        if visited[node] == 2 { return false } // Already processed this node
        
        // Mark as visiting
        visited[node] = 1
        
        // Explore all neighbors
        for neighbor in adj[node] {
            if hasCycle(neighbor, adj, &visited) {
                return true
            }
        }
        
        // Mark as visited (fully processed)
        visited[node] = 2
        return false
    }
}

// --- Test Cases ---
let sol = Solution()
print("Can finish 2 courses with prerequisites [[1,0]]: \(sol.canFinish(2, [[1,0]]))") // Expected: true
print("Can finish 2 courses with prerequisites [[1,0],[0,1]]: \(sol.canFinish(2, [[1,0],[0,1]]))") // Expected: false

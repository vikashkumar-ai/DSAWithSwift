/**
 * Problem: Course Schedule II (DFS-based Topological Sort)
 * Topic: Graphs / TopologicalSort / DFSBasedTopoSort
 * 
 * Description:
 * There are a total of numCourses courses you have to take, labeled from 
 * 0 to numCourses - 1. You are given an array prerequisites where 
 * prerequisites[i] = [a, b] indicates that you must take course b first 
 * if you want to take course a.
 * Return the ordering of courses you should take to finish all courses.
 * 
 * Pattern: DFS with recursion stack and visited set. We visit each 
 * node and its children, adding them to the final ordering after 
 * all their descendants are processed.
 * 
 * Time Complexity: O(V + E).
 * Space Complexity: O(V + E) for the adjacency list and recursion stack.
 */

import Foundation

class Solution {
    /**
     * Finds a valid topological ordering for courses using DFS.
     * - Parameters:
     *   - numCourses: Total number of courses.
     *   - prerequisites: List of directed edges [target, source].
     * - Returns: An array representing the course sequence.
     */
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adj = Array(repeating: [Int](), count: numCourses)
        for pre in prerequisites {
            adj[pre[1]].append(pre[0])
        }
        
        // 0: Unvisited, 1: Visiting, 2: Visited
        var visit = Array(repeating: 0, count: numCourses)
        var result = [Int]()
        
        for i in 0..<numCourses {
            if !dfs(i, adj, &visit, &result) {
                return []
            }
        }
        
        // Result is recorded in reverse order in a topological sort post-order
        return result.reversed()
    }
    
    private func dfs(_ u: Int, _ adj: [[Int]], _ visit: inout [Int], _ result: inout [Int]) -> Bool {
        // If currently visiting, a cycle is detected
        if visit[u] == 1 { return false }
        // If already visited, skip
        if visit[u] == 2 { return true }
        
        // Mark as visiting
        visit[u] = 1
        
        for neighbor in adj[u] {
            if !dfs(neighbor, adj, &visit, &result) {
                return false
            }
        }
        
        // Mark as visited and add to result
        visit[u] = 2
        result.append(u)
        
        return true
    }
}

// --- Test Cases ---
let sol = Solution()
print("Course order (DFS) for 2 courses with [[1,0]]: \(sol.findOrder(2, [[1,0]]))") // Expected: [0, 1]
print("Course order (DFS) for 4 courses with [[1,0],[2,0],[3,1],[3,2]]: \(sol.findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))") 
// Expected: [0, 1, 2, 3] or [0, 2, 1, 3]

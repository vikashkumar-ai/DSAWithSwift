/**
 * Problem: Course Schedule II (Topological Sort)
 * Topic: Graphs / Topological Sort
 * 
 * Description:
 * There are a total of numCourses courses you have to take, labeled from 
 * 0 to numCourses - 1. You are given an array prerequisites where 
 * prerequisites[i] = [a, b] indicates that you must take course b first 
 * if you want to take course a.
 * Return the ordering of courses you should take to finish all courses. 
 * If there are many valid answers, return any of them. If it is impossible 
 * to finish all courses, return an empty array.
 * 
 * Pattern: Kahn's Algorithm (BFS-based topological sort using in-degrees).
 * 
 * Time Complexity: O(V + E) where V is number of courses and E is 
 * number of prerequisites.
 * Space Complexity: O(V + E) for the adjacency list and in-degree array.
 */

import Foundation

class Solution {
    /**
     * Finds a valid topological ordering for courses using Kahn's Algorithm.
     * - Parameters:
     *   - numCourses: Total number of courses.
     *   - prerequisites: List of directed edges [target, source].
     * - Returns: An array representing the course sequence.
     */
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adj = Array(repeating: [Int](), count: numCourses)
        var inDegree = Array(repeating: 0, count: numCourses)
        
        // Build the graph and calculate in-degrees
        for pre in prerequisites {
            let target = pre[0], source = pre[1]
            adj[source].append(target)
            inDegree[target] += 1
        }
        
        // Add all nodes with 0 in-degree to the queue
        var queue = [Int]()
        for i in 0..<numCourses {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }
        
        var result = [Int]()
        while !queue.isEmpty {
            let current = queue.removeFirst()
            result.append(current)
            
            // For each neighbor, decrease its in-degree
            for neighbor in adj[current] {
                inDegree[neighbor] -= 1
                // If in-degree becomes 0, add it to the queue
                if inDegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }
        
        // If result has all courses, we found a topological sort
        return result.count == numCourses ? result : []
    }
}

// --- Test Cases ---
let sol = Solution()
print("Course order for 2 courses with prerequisites [[1,0]]: \(sol.findOrder(2, [[1,0]]))") // Expected: [0, 1]
print("Course order for 4 courses with prerequisites [[1,0],[2,0],[3,1],[3,2]]: \(sol.findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))") 
// Expected: [0, 1, 2, 3] or [0, 2, 1, 3]

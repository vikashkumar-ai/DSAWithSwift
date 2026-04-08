/**
 * Problem: Find Eventual Safe States
 * Topic: Graphs / CycleDetection / Directed
 * 
 * Description:
 * There is a directed graph of n nodes with each node labeled from 0 to n - 1. 
 * A node is a terminal node if there are no outgoing edges. A node 
 * is a safe node if every possible path starting from that node 
 * leads to a terminal node.
 * Return an array containing all the safe nodes of the graph. 
 * The answer should be sorted in ascending order.
 * 
 * Pattern: Directed cycle detection. A node is safe if it is not 
 * part of a cycle and doesn't lead to a node that's in a cycle.
 * 
 * Time Complexity: O(V + E).
 * Space Complexity: O(V).
 */

import Foundation

class Solution {
    /**
     * Finds all safe nodes in a directed graph.
     * - Parameters:
     *   - graph: Adjacency list representation.
     * - Returns: A sorted array of safe nodes.
     */
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        // 0: Unvisited, 1: Visiting, 2: Safe, 3: Unsafe (in cycle)
        var state = Array(repeating: 0, count: n)
        
        var result = [Int]()
        for i in 0..<n {
            if isSafe(i, graph, &state) {
                result.append(i)
            }
        }
        
        return result
    }
    
    private func isSafe(_ u: Int, _ graph: [[Int]], _ state: inout [Int]) -> Bool {
        // If visiting, it's a cycle
        if state[u] == 1 { return false }
        // If already determined safe or unsafe
        if state[u] == 2 { return true }
        if state[u] == 3 { return false }
        
        // Mark as visiting
        state[u] = 1
        
        for v in graph[u] {
            if !isSafe(v, graph, &state) {
                state[u] = 3
                return false
            }
        }
        
        // Mark as safe
        state[u] = 2
        return true
    }
}

// --- Test Cases ---
let sol = Solution()
let graph = [[1,2],[2,3],[5],[0],[5],[],[]]
print("Eventual Safe Nodes: \(sol.eventualSafeNodes(graph))") // Expected: [2, 4, 5, 6]

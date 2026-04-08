/**
 * Problem: Network Delay Time (Dijkstra's Algorithm)
 * Topic: Graphs / Shortest Path / Dijkstra
 * 
 * Description:
 * You are given a network of n nodes, labeled from 1 to n. You are 
 * also given times, a list of travel times as directed edges times[i] = 
 * (ui, vi, wi). We will send a signal from a given node k. Return the minimum 
 * time it takes for all the n nodes to receive the signal. If it is 
 * impossible for all the n nodes to receive the signal, return -1.
 * 
 * Pattern: Dijkstra's Algorithm finds the shortest path from a source 
 * node to all other nodes in a weighted graph with non-negative edges.
 * 
 * Time Complexity: O(E log V) where E is number of edges and V is nodes.
 * Space Complexity: O(V + E) for the adjacency list and priority queue.
 */

import Foundation

class PriorityQueue<T> {
    private var heap: [T]
    private let compare: (T, T) -> Bool
    
    init(compare: @escaping (T, T) -> Bool) {
        self.heap = []
        self.compare = compare
    }
    
    var count: Int { heap.count }
    var isEmpty: Bool { heap.isEmpty }
    var peek: T? { heap.first }
    
    func push(_ element: T) {
        heap.append(element)
        siftUp(heap.count - 1)
    }
    
    func pop() -> T? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        
        let result = heap[0]
        heap[0] = heap.removeLast()
        siftDown(0)
        return result
    }
    
    private func siftUp(_ index: Int) {
        var child = index
        while child > 0 {
            let parent = (child - 1) / 2
            if compare(heap[child], heap[parent]) {
                heap.swapAt(child, parent)
                child = parent
            } else {
                break
            }
        }
    }
    
    private func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            
            if left < heap.count && compare(heap[left], heap[candidate]) {
                candidate = left
            }
            if right < heap.count && compare(heap[right], heap[candidate]) {
                candidate = right
            }
            
            if candidate != parent {
                heap.swapAt(parent, candidate)
                parent = candidate
            } else {
                break
            }
        }
    }
}

class Solution {
    /**
     * Finds the minimum time for all nodes to receive a signal using Dijkstra.
     * - Parameters:
     *   - times: Array of directed weighted edges [source, target, weight].
     *   - n: Total number of nodes.
     *   - k: Starting node index.
     * - Returns: Total time or -1.
     */
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        // Step 1: Build Adjacency List
        var adj = [Int: [(node: Int, weight: Int)]]()
        for time in times {
            adj[time[0], default: []].append((time[1], time[2]))
        }
        
        // Step 2: Dijkstra's with Priority Queue
        var minTime = Array(repeating: Int.max, count: n + 1)
        minTime[k] = 0
        
        // Min-heap storing (time_to_reach, node)
        let pq = PriorityQueue<(time: Int, node: Int)>(compare: { $0.time < $1.time })
        pq.push((0, k))
        
        while !pq.isEmpty {
            let (currentTime, currentNode) = pq.pop()!
            
            // Optimization: If current time is already worse, skip
            if currentTime > minTime[currentNode] { continue }
            
            if let neighbors = adj[currentNode] {
                for neighbor in neighbors {
                    let totalTime = currentTime + neighbor.weight
                    if totalTime < minTime[neighbor.node] {
                        minTime[neighbor.node] = totalTime
                        pq.push((totalTime, neighbor.node))
                    }
                }
            }
        }
        
        // Step 3: Find maximum time among all nodes
        var result = 0
        for i in 1...n {
            if minTime[i] == Int.max { return -1 }
            result = max(result, minTime[i])
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Network delay for [[2,1,1],[2,3,1],[3,4,1]], n=4, k=2: \(sol.networkDelayTime([[2,1,1],[2,3,1],[3,4,1]], 4, 2))") // Expected: 2
print("Network delay for [[1,2,1]], n=2, k=2: \(sol.networkDelayTime([[1,2,1]], 2, 2))")                            // Expected: -1

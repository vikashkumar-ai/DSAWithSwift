/**
 * Problem: Min Cost to Connect All Points (Prim's Algorithm)
 * Topic: Graphs / MST / Prim
 * 
 * Description:
 * You are given an array points representing integer coordinates of 
 * some points on a 2D-plane. Return the minimum cost to make all points 
 * connected. All points are connected if there is exactly one simple path 
 * between any two points.
 * 
 * Pattern: Prim's algorithm starts with a single vertex and greedily 
 * expands the MST by adding the nearest unvisited vertex.
 * 
 * Time Complexity: O(E log V) or O(n² log n) for n points.
 * Space Complexity: O(n²) for all possible edges or O(n) with optimization.
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
     * Calculates MST for set of points using Prim's Algorithm.
     * - Parameters:
     *   - points: Array of coordinates [x, y].
     * - Returns: Total minimum cost.
     */
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        if n == 0 { return 0 }
        
        var minCost = 0
        var visited = Array(repeating: false, count: n)
        var edgesUsed = 0
        
        // Min-heap storing (distance, point_index)
        let pq = PriorityQueue<(dist: Int, node: Int)>(compare: { $0.dist < $1.dist })
        pq.push((0, 0))
        
        while edgesUsed < n {
            let (dist, u) = pq.pop()!
            
            if visited[u] { continue }
            
            // Add current point to MST
            visited[u] = true
            minCost += dist
            edgesUsed += 1
            
            // Add all edges from current point to unvisited points to the PQ
            for v in 0..<n {
                if !visited[v] {
                    let weight = abs(points[u][0] - points[v][0]) + abs(points[u][1] - points[v][1])
                    pq.push((weight, v))
                }
            }
        }
        
        return minCost
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min cost for [[0,0],[2,2],[3,10],[5,2],[7,0]]: \(sol.minCostConnectPoints([[0,0],[2,2],[3,10],[5,2],[7,0]]))") // Expected: 20
print("Min cost for [[3,12],[-2,5],[-4,1]]: \(sol.minCostConnectPoints([[3,12],[-2,5],[-4,1]]))")                   // Expected: 18

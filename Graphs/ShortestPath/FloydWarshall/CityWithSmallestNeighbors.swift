/**
 * Problem: Find the City with the Smallest Number of Neighbors at a Threshold Distance
 * Topic: Graphs / ShortestPath / FloydWarshall
 * 
 * Description:
 * There are n cities numbered from 0 to n-1. Given the array edges where 
 * edges[i] = [from_i, to_i, weight_i] represents a bidirectional weighted 
 * edge, and given the integer distanceThreshold.
 * Return the city with the smallest number of cities that are reachable 
 * through some path and whose distance is at most distanceThreshold. 
 * If there are multiple such cities, return the city with the 
 * greatest number.
 * 
 * Pattern: Call Floyd-Warshall to get the all-pairs shortest path distance 
 * matrix, then count the number of neighbors for each city.
 * 
 * Time Complexity: O(n³).
 * Space Complexity: O(n²).
 */

import Foundation

class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        let inf = Int.max / 2
        var dist = Array(repeating: Array(repeating: inf, count: n), count: n)
        
        for i in 0..<n {
            dist[i][i] = 0
        }
        
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            let w = edge[2]
            dist[u][v] = w
            dist[v][u] = w
        }
        
        // Floyd-Warshall
        for k in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    if dist[i][k] + dist[k][j] < dist[i][j] {
                        dist[i][j] = dist[i][k] + dist[k][j]
                    }
                }
            }
        }
        
        var minCount = n
        var resultCity = -1
        
        for i in 0..<n {
            var count = 0
            for j in 0..<n {
                if i != j && dist[i][j] <= distanceThreshold {
                    count += 1
                }
            }
            
            // Return city with GREATEST number if counts are tied.
            if count <= minCount {
                minCount = count
                resultCity = i
            }
        }
        
        return resultCity
    }
}

// --- Test Cases ---
let sol = Solution()
let edges = [[0,1,3],[1,2,1],[1,3,4],[2,3,1]]
print("Result City for n=4, distanceThreshold=4: \(sol.findTheCity(4, edges, 4))") // Expected: 3

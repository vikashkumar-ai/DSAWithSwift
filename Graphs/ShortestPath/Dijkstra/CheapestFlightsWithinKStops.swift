/**
 * Problem: Cheapest Flights Within K Stops (Modified Dijkstra/BFS)
 * Topic: Graphs / ShortestPath / Dijkstra
 * 
 * Description:
 * There are n cities connected by some number of flights. 
 * You are given an array flights where 
 * flights[i] = [from_i, to_i, price_i] indicates that there is a 
 * flight from city from_i to city to_i with cost price_i.
 * You are also given three integers src, dst, and k, return the 
 * cheapest price from src to dst with at most k stops. If there 
 * is no such route, return -1.
 * 
 * Pattern: Modified Dijkstra or BFS with level count. Use a queue 
 * to store (node, cost, stops) and keep track of minimum cost for 
 * each node per stop level.
 * 
 * Time Complexity: O(k * E) where E is number of flights.
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the cheapest flight cost within k stops.
     * - Parameters:
     *   - n: Number of cities.
     *   - flights: 2D array of flights [[from, to, price]].
     *   - src: Starting city.
     *   - dst: Destination city.
     *   - k: Max stops allowed.
     * - Returns: Minimum price or -1.
     */
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var adj = [Int: [(Int, Int)]]()
        for f in flights {
            adj[f[0], default: []].append((f[1], f[2]))
        }
        
        var minPrice = Array(repeating: Int.max, count: n)
        minPrice[src] = 0
        
        // (city, currentPrice)
        var queue = [(src, 0)]
        var stops = 0
        
        while !queue.isEmpty && stops <= k {
            let size = queue.count
            for _ in 0..<size {
                let (u, price) = queue.removeFirst()
                
                if let neighbors = adj[u] {
                    for (v, cost) in neighbors {
                        if price + cost < minPrice[v] {
                            minPrice[v] = price + cost
                            queue.append((v, minPrice[v]))
                        }
                    }
                }
            }
            stops += 1
        }
        
        return minPrice[dst] == Int.max ? -1 : minPrice[dst]
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min price for n=3, flights=[[0,1,100],[1,2,100],[0,2,500]], k=1: \(sol.findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1))") 
// Expected: 200 (0 -> 1 -> 2)
print("Min price for n=3, flights=[[0,1,100],[1,2,100],[0,2,500]], k=0: \(sol.findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0))")
// Expected: 500 (0 -> 2)

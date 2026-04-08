/**
 * Problem: Closest Pair of Points (Divide and Conquer)
 * Topic: Recursion / Divide_Conquer
 * 
 * Description:
 * Given a set of points in the plane, find the distance between the 
 * closest pair of points.
 * 
 * Pattern: Divide and Conquer. Sort points by X-coordinate. Divide 
 * at the median into two halves. Find the minimum distance (d) in 
 * each half. Then check the 'strip' near the median line for 
 * any pairs with distance < d.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class ClosestPair {
    struct Point {
        let x: Double
        let y: Double
    }
    
    /**
     * Finds the minimum distance between any two points.
     * - Parameters:
     *   - points: Array of Point structs.
     * - Returns: Minimum distance.
     */
    func findMinimumDistance(_ points: [Point]) -> Double {
        let sortedX = points.sorted { $0.x < $1.x }
        return closestUtil(sortedX)
    }
    
    private func closestUtil(_ points: [Point]) -> Double {
        let n = points.count
        if n <= 3 {
            // Brute force for base case
            var minDist = Double.greatestFiniteMagnitude
            for i in 0..<n {
                for j in i+1..<n {
                    minDist = min(minDist, dist(points[i], points[j]))
                }
            }
            return minDist
        }
        
        // Midpoint for division
        let mid = n / 2
        let midPoint = points[mid]
        
        let dl = closestUtil(Array(points[0..<mid]))
        let dr = closestUtil(Array(points[mid..<n]))
        
        var d = min(dl, dr)
        
        // Find points in strip of size 2*d
        var strip = [Point]()
        for point in points {
            if abs(point.x - midPoint.x) < d {
                strip.append(point)
            }
        }
        
        // Sort strip by y
        strip.sort { $0.y < $1.y }
        
        // Check for pairs in strip
        for i in 0..<strip.count {
            for j in i+1..<strip.count {
                // Optimization: y-difference must be < current d
                if (strip[j].y - strip[i].y) >= d { break }
                d = min(d, dist(strip[i], strip[j]))
            }
        }
        
        return d
    }
    
    private func dist(_ p1: Point, _ p2: Point) -> Double {
        return sqrt(pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2))
    }
}

// --- Test Cases ---
let solver = ClosestPair()
let points = [
    ClosestPair.Point(x: 2.0, y: 3.0), ClosestPair.Point(x: 12.0, y: 30.0),
    ClosestPair.Point(x: 40.0, y: 50.0), ClosestPair.Point(x: 5.0, y: 1.0),
    ClosestPair.Point(x: 12.0, y: 10.0), ClosestPair.Point(x: 3.0, y: 4.0)
]
print("Min distance: \(solver.findMinimumDistance(points))") 
// Expected: 1.414 (between (2,3) and (3,4))

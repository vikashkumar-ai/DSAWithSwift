/**
 * Problem: K Closest Points to Origin
 * Topic: Heap / TopK
 * 
 * Description:
 * Given an array of points where points[i] = [xi, yi] represents 
 * a point on the X-Y plane and an integer k, return the k 
 * closest points to the origin (0, 0). 
 * The distance between two points on the X-Y plane is the Euclidean 
 * distance (√(x1 - x2)^2 + (y1 - y2)^2). 
 * You may return the answer in any order.
 * 
 * Pattern: Max-Heap of size K (distance-based).
 * 1. Calculate squared distance (to avoid sqrt) for each point.
 * 2. Maintain a Max-Heap of the first k points.
 * 3. For subsequent points:
 *    - If distance is smaller than heap root, replace and heapify.
 * 
 * Time Complexity: O(N log K).
 * Space Complexity: O(K).
 */

import Foundation

class KClosestPointsSolver {
    struct PointDist: Comparable {
        let point: [Int]
        let distance: Int
        
        static func < (lhs: PointDist, rhs: PointDist) -> Bool {
            return lhs.distance < rhs.distance
        }
    }
    
    /**
     * Finds the k closest points to the origin.
     * - Parameters:
     *   - points: List of coordinates.
     *   - k: Path index.
     * - Returns: List of points.
     */
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        // Max-Heap (using sorted array as simplified Priority Queue)
        var maxHeap = [PointDist]()
        
        for point in points {
            let dist = point[0] * point[0] + point[1] * point[1]
            let item = PointDist(point: point, distance: dist)
            
            if maxHeap.count < k {
                maxHeap.append(item)
                maxHeap.sort { $0.distance > $1.distance } // Max-Heap sorting
            } else if dist < maxHeap[0].distance {
                maxHeap[0] = item
                maxHeap.sort { $0.distance > $1.distance }
            }
        }
        
        return maxHeap.map { $0.point }
    }
}

// --- Test Cases ---
let solver = KClosestPointsSolver()
let pts = [[3, 3], [5, -1], [-2, 4]]
print("2 closest points in [[3,3],[5,-1],[-2,4]]: \(solver.kClosest(pts, 2).description)") 
// Expected: [[3, 3], [-2, 4]]

/**
 * Problem: Capacity to Ship Packages within D Days
 * Topic: Array / BinarySearch / OnAnswer
 * 
 * Description:
 * A conveyor belt has packages that must be shipped from one port to 
 * another within days days. The i-th package on the conveyor belt 
 * has a weight of weights[i]. Return the least weight capacity 
 * of the ship that will result in all the packages on the conveyor 
 * belt being shipped within days days.
 * 
 * Pattern: Binary Search on the answer range. The minimum capacity is 
 * the maximum single weight, and the maximum is the sum of all weights.
 * 
 * Time Complexity: O(n log(sum(weights) - max(weights))).
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Finds the minimum capacity of the ship.
     * - Parameters:
     *   - weights: Array of package weights.
     *   - days: Target number of days.
     * - Returns: Minimum capacity.
     */
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var low = weights.max() ?? 0
        var high = weights.reduce(0, +)
        var result = high
        
        while low <= high {
            let mid = low + (high - low) / 2
            
            if canShip(weights, days, mid) {
                result = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        
        return result
    }
    
    /**
     * Helper to check if a given capacity can ship everything within given days.
     */
    private func canShip(_ weights: [Int], _ days: Int, _ capacity: Int) -> Bool {
        var daysNeeded = 1
        var currentLoad = 0
        
        for weight in weights {
            if currentLoad + weight > capacity {
                daysNeeded += 1
                currentLoad = weight
            } else {
                currentLoad += weight
            }
        }
        
        return daysNeeded <= days
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min capacity for weights [1,2,3,4,5,6,7,8,9,10] in 5 days: \(sol.shipWithinDays([1,2,3,4,5,6,7,8,9,10], 5))") 
// Expected: 15
print("Min capacity for weights [3,2,2,4,1,4] in 3 days: \(sol.shipWithinDays([3,2,2,4,1,4], 3))") 
// Expected: 6

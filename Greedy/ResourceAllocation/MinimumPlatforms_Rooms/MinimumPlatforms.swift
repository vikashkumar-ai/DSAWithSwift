/**
 * Problem: Minimum Number of Platforms Required
 * Topic: Greedy / ResourceAllocation / MinimumPlatforms_Rooms
 * 
 * Description:
 * Given arrival and departure times of all trains that reach a railway 
 * station, find the minimum number of platforms required for the 
 * railway station so that no train waits.
 * 
 * Pattern: Two-pointer interval sweep. Sort arrival and departure 
 * times independently. Use two pointers to track concurrent trains 
 * and update the maximum number of platforms needed.
 * 
 * Time Complexity: O(n log n) for sorting.
 * Space Complexity: O(1) if sorting in place.
 */

import Foundation

class Solution {
    /**
     * Finds the minimum number of platforms required.
     * - Parameters:
     *   - arrival: Array of arrival times.
     *   - departure: Array of departure times.
     * - Returns: Minimum platform count.
     */
    func findPlatform(_ arrival: [Int], _ departure: [Int]) -> Int {
        // Step 1: Sort arrivals and departures independently
        let arr = arrival.sorted()
        let dep = departure.sorted()
        
        var i = 0, j = 0
        var currentPlatforms = 0
        var result = 0
        
        while i < arr.count && j < dep.count {
            // Next event is an arrival
            if arr[i] <= dep[j] {
                currentPlatforms += 1
                result = max(result, currentPlatforms)
                i += 1
            } else {
                // Next event is a departure
                currentPlatforms -= 1
                j += 1
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min platforms for arr=[900, 940, 950, 1100, 1500, 1800] and dep=[910, 1200, 1120, 1130, 1900, 2000]: \(sol.findPlatform([900, 940, 950, 1100, 1500, 1800], [910, 1200, 1120, 1130, 1900, 2000]))") 
// Expected: 3
print("Min platforms for arr=[900, 1100, 1235] and dep=[1000, 1200, 1240]: \(sol.findPlatform([900, 1100, 1235], [1000, 1200, 1240]))") 
// Expected: 1

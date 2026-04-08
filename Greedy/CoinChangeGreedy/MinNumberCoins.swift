/**
 * Problem: Minimum Number of Coins (Greedy approach)
 * Topic: Greedy / CoinChangeGreedy
 * 
 * Description:
 * Given a value V and a set of coin denominations, find the minimum 
 * number of coins to make change for V. 
 * Note: Greedy approach only works for specific denominations (like Indian 
 * or US currency) where the local optimum leads to the global optimum.
 * 
 * Pattern: Always pick the largest denomination that is less than or 
 * equal to the remaining value.
 * 
 * Time Complexity: O(n) where n is the number of denominations.
 * Space Complexity: O(1) as we use fixed denominations.
 */

import Foundation

class Solution {
    /**
     * Finds the minimum count of coins needed for target value V using Greedy.
     * - Parameters:
     *   - V: Target value.
     * - Returns: Minimum number of coins.
     */
    func minCoins(_ v: Int) -> Int {
        // Standard denominators for which greedy works (e.g., 1, 2, 5, 10, 20, 50, 100, 500, 2000)
        let denominations = [2000, 500, 100, 50, 20, 10, 5, 2, 1]
        var remainingV = v
        var count = 0
        
        for coin in denominations {
            while remainingV >= coin {
                remainingV -= coin
                count += 1
            }
            if remainingV == 0 { break }
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min coins for 43:  \(sol.minCoins(43))")  // Expected: 5 (20+20+2+1)
print("Min coins for 121: \(sol.minCoins(121))") // Expected: 3 (100+20+1)
print("Min coins for 1000: \(sol.minCoins(1000))") // Expected: 2 (500+500)

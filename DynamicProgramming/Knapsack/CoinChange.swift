/**
 * Problem: Coin Change
 * Topic: Dynamic Programming / Knapsack
 * 
 * Description:
 * You are given an integer array coins representing coins of different 
 * denominations and an integer amount representing a total amount of money.
 * Return the fewest number of coins that you need to make up that amount. 
 * If that amount of money cannot be made up by any combination of the 
 * coins, return -1.
 * 
 * Pattern: Unbounded Knapsack. At each amount i, the min coins is 
 * 1 + min(dp[i - coin]) for each coin in the coins array.
 * 
 * Time Complexity: O(n * amount) where n is number of coins.
 * Space Complexity: O(amount) for the DP table.
 */

import Foundation

class Solution {
    /**
     * Finds the minimum number of coins for a total amount using DP.
     * - Parameters:
     *   - coins: Array of available coin denominations.
     *   - amount: The target total amount.
     * - Returns: Minimum count of coins or -1.
     */
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        
        // Initialize DP array with a value larger than amount (e.g., amount + 1)
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0 // Base case: 0 amount needs 0 coins
        
        // Compute min coins for every amount up to target
        for i in 1...amount {
            for coin in coins {
                if i - coin >= 0 {
                    dp[i] = min(dp[i], 1 + dp[i - coin])
                }
            }
        }
        
        // If dp[amount] remains at initial value, amount cannot be made
        return dp[amount] > amount ? -1 : dp[amount]
    }
}

// --- Test Cases ---
let sol = Solution()
print("Min coins for amount 11 with [1,2,5]: \(sol.coinChange([1,2,5], 11))") // Expected: 3 (5+5+1)
print("Min coins for amount 3 with [2]: \(sol.coinChange([2], 3))")           // Expected: -1
print("Min coins for amount 0 with [1]: \(sol.coinChange([1], 0))")           // Expected: 0

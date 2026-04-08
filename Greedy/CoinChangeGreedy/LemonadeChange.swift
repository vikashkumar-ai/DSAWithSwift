/**
 * Problem: Lemonade Change (Greedy Approach)
 * Topic: Greedy / CoinChangeGreedy
 * 
 * Description:
 * At a lemonade stand, each lemonade costs $5. Customers are standing 
 * in a queue to buy from you and order one at a time (in the order 
 * specified by bills). Each customer will only buy one lemonade 
 * and pay with either a $5, $10, or $20 bill. You must provide the 
 * correct change to each customer. 
 * Return true if you can provide every customer with correct change.
 * 
 * Pattern: Greedy Change.
 * 1. Maintain counts for $5 and $10 bills.
 * 2. For each bill:
 *    - $5: Increment five-count.
 *    - $10: Decrement five-count, increment ten-count.
 *    - $20: Greedily use one $10 and one $5, or three $5s.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(1).
 */

import Foundation

class LemonadeChange {
    /**
     * Determines if all change can be provided.
     * - Parameters:
     *   - bills: List of customer payments.
     * - Returns: Boolean value.
     */
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0
        var ten = 0
        
        for bill in bills {
            if bill == 5 {
                five += 1
            } else if bill == 10 {
                if five == 0 { return false }
                five -= 1
                ten += 1
            } else { // bill == 20
                if ten > 0 && five > 0 {
                    ten -= 1
                    five -= 1
                } else if five >= 3 {
                    five -= 3
                } else {
                    return false
                }
            }
        }
        
        return true
    }
}

// --- Test Cases ---
let solver = LemonadeChange()
print("Bills [5,5,5,10,20]: \(solver.lemonadeChange([5,5,5,10,20]))") // Expected: true
print("Bills [5,5,10,10,20]: \(solver.lemonadeChange([5,5,10,10,20]))") // Expected: false

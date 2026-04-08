/**
 * Problem: Fractional Knapsack (Greedy approach)
 * Topic: Greedy / FractionalKnapsack
 * 
 * Description:
 * Given weights and values of N items, we need to put these items in a 
 * knapsack of capacity W. In Fractional Knapsack, we can break items 
 * for maximizing the total value of the knapsack.
 * 
 * Pattern: Sort items based on value-to-weight ratio in descending order.
 * 
 * Time Complexity: O(n log n) where n is the number of items.
 * Space Complexity: O(1) if sorting in place.
 */

import Foundation

struct Item {
    let value: Int
    let weight: Int
    var ratio: Double { Double(value) / Double(weight) }
}

class Solution {
    /**
     * Finds the maximum value in a fractional knapsack of capacity W.
     * - Parameters:
     *   - items: Array of items each having a value and weight.
     *   - W: Total capacity of the knapsack.
     * - Returns: Maximum total value.
     */
    func fractionalKnapsack(_ items: [Item], _ w: Int) -> Double {
        // Step 1: Sort items by their value-to-weight ratio
        let sortedItems = items.sorted { $0.ratio > $1.ratio }
        
        var totalValue: Double = 0.0
        var currentWeight = 0
        
        // Step 2: Iterate through sorted items and take full or fractional parts
        for item in sortedItems {
            if currentWeight + item.weight <= w {
                currentWeight += item.weight
                totalValue += Double(item.value)
            } else {
                // If the entire item can't fit, take a fraction
                let remainingWeight = w - currentWeight
                totalValue += Double(item.value) * (Double(remainingWeight) / Double(item.weight))
                break
            }
        }
        
        return totalValue
    }
}

// --- Test Cases ---
let sol = Solution()
let items = [Item(value: 60, weight: 10), Item(value: 100, weight: 20), Item(value: 120, weight: 30)]
print("Max value in Knapsack (W=50): \(sol.fractionalKnapsack(items, 50))") // Expected: 240.0

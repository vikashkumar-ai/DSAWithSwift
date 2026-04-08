/**
 * Problem: Fractional Knapsack (Sorting by Value/Weight Ratio)
 * Topic: Greedy / FractionalKnapsack
 * 
 * Description:
 * Given weights and values of N items, we need to put these 
 * items in a knapsack of capacity W to get the maximum total 
 * value in the knapsack. In Fractional Knapsack, we can break 
 * items for maximizing the total value.
 * 
 * Pattern: Greedy by Unit Value.
 * 1. Calculate value/weight ratio for each item.
 * 2. Sort items by this ratio in descending order.
 * 3. Take full items if possible; take fraction if capacity is left.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class FractionalKnapsackSolver {
    struct Item {
        let value: Double
        let weight: Double
        let ratio: Double
        
        init(v: Double, w: Double) {
            self.value = v
            self.weight = w
            self.ratio = v / w
        }
    }
    
    /**
     * Calculates the maximum value.
     * - Parameters:
     *   - w: Total allowed weight.
     *   - values: Value per item.
     *   - weights: Weight per item.
     * - Returns: Maximum value.
     */
    func knapsack(_ w: Double, _ values: [Double], _ weights: [Double]) -> Double {
        var items = [Item]()
        for i in 0..<values.count {
            items.append(Item(v: values[i], w: weights[i]))
        }
        
        // Step 2: Sort descending by unit value
        items.sort { $0.ratio > $1.ratio }
        
        var currentWeight: Double = 0
        var totalValue: Double = 0
        
        for item in items {
            if currentWeight + item.weight <= w {
                currentWeight += item.weight
                totalValue += item.value
            } else {
                let remain = w - currentWeight
                totalValue += item.ratio * remain
                break
            }
        }
        
        return totalValue
    }
}

// --- Test Cases ---
let solver = FractionalKnapsackSolver()
let v = [60.0, 100.0, 120.0], weights = [10.0, 20.0, 30.0]
print("Max value for capacity 50: \(solver.knapsack(50.0, v, weights))") 
// Expected: 240.0 (60 + 100 + (2/3)*120)

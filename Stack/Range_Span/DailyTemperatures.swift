/**
 * Problem: Daily Temperatures (Span to Next Greater)
 * Topic: Stack / Range_Span
 * 
 * Description:
 * Given an array of integers temperatures represents the daily 
 * temperatures, return an array answer such that answer[i] is 
 * the number of days you have to wait after the ith day to get 
 * a warmer temperature. If there is no future day for which 
 * this is possible, keep answer[i] = 0 instead.
 * 
 * Pattern: Monotonic Decreasing Stack with Index Distances.
 * 1. Maintain a stack of INDICES of temperatures in decreasing order.
 * 2. For each current temperature T:
 *    - While !stack.isEmpty && T > stack.top.temp:
 *      - Pop index 'prevIndex'.
 *      - result[prevIndex] = currentIndex - prevIndex.
 * 3. Push current index.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class DailyTemperaturesSolver {
    /**
     * Calculates the wait days for warmer temperatures.
     * - Parameters:
     *   - temperatures: List of temp values.
     * - Returns: Wait days array.
     */
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var result = Array(repeating: 0, count: n)
        var stack = [Int]() // Stores indices
        
        for i in 0..<n {
            let currentTemp = temperatures[i]
            
            // While current temperature is warmer than the one at the stack top
            while !stack.isEmpty && currentTemp > temperatures[stack.last!] {
                let prevIndex = stack.removeLast()
                result[prevIndex] = i - prevIndex // Calculate the 'span'
            }
            
            stack.append(i)
        }
        
        return result
    }
}

// --- Test Cases ---
let solver = DailyTemperaturesSolver()
let temps = [73, 74, 75, 71, 69, 72, 76, 73]
print("Wait days for [73, 74, 75, 71, 69, 72, 76, 73]: \(solver.dailyTemperatures(temps))") 
// Expected: [1, 1, 4, 2, 1, 1, 0, 0]

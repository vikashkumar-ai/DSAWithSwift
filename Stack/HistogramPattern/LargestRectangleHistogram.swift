/**
 * Problem: Largest Rectangle in Histogram
 * Topic: Stack / Histogram Pattern
 * 
 * Description:
 * Given an array of integers heights representing the histogram's bar 
 * height where the width of each bar is 1, return the area of the 
 * largest rectangle in the histogram.
 * 
 * Time Complexity: O(n) where n is length of the heights array.
 * Space Complexity: O(n) for the stack.
 */

import Foundation

class Solution {
    /**
     * Finds the largest rectangle area in a histogram using a Monotonic Stack.
     * - Parameters:
     *   - heights: The input heights array.
     * - Returns: The largest area found.
     */
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea = 0
        var stack = [Int]() // Increasing stack: stores indices of heights
        
        // Add a padding zero at the end to force popping and 
        // processing all remaining bars in the stack.
        let paddedHeights = heights + [0]
        
        for (index, currentHeight) in paddedHeights.enumerated() {
            // While current height is smaller than the height at the stack top
            // pop and process the rectangle whose height is the one at stack top.
            while !stack.isEmpty && paddedHeights[stack.last!] > currentHeight {
                let h = paddedHeights[stack.popLast()!]
                
                // Determine the width of the rectangle
                // If stack is empty after pop, width is from index 0 to current index.
                // Otherwise, width is from stack top's index + 1 to current index.
                let w = stack.isEmpty ? index : index - stack.last! - 1
                
                maxArea = max(maxArea, h * w)
            }
            
            stack.append(index)
        }
        
        return maxArea
    }
}

// --- Test Cases ---
let sol = Solution()
print("Largest Rectangle Area for [2, 1, 5, 6, 2, 3]: \(sol.largestRectangleArea([2, 1, 5, 6, 2, 3]))") // Expected: 10 (height 5, width 2)
print("Largest Rectangle Area for [2, 4]: \(sol.largestRectangleArea([2, 4]))")                   // Expected: 4

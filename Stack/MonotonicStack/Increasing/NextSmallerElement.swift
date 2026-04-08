/**
 * Problem: Next Smaller Element
 * Topic: Stack / Monotonic Stack / Increasing Stack
 * 
 * Description:
 * Given an array of integers, for each element in the array, find the first 
 * smaller element that is to the right of it. If it does not exist, return -1.
 * 
 * Time Complexity: O(n) where n is length of the array.
 * Space Complexity: O(n) for the stack.
 */

import Foundation

class Solution {
    /**
     * Finds the next smaller element for each element in an array.
     * - Parameters:
     *   - arr: The input integer array.
     * - Returns: Array of next smaller elements.
     */
    func nextSmallerElement(_ arr: [Int]) -> [Int] {
        var result = Array(repeating: -1, count: arr.count)
        var stack = [Int]() // Increasing stack: elements go from smaller to larger
        
        for i in 0..<arr.count {
            // While current element is smaller than the stack top element, 
            // the current element is the next smaller for the one at stack top.
            while !stack.isEmpty && arr[stack.last!] > arr[i] {
                let smallerIndex = stack.popLast()!
                result[smallerIndex] = arr[i]
            }
            stack.append(i)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Next Smaller Element for [4, 8, 5, 2, 25]: \(sol.nextSmallerElement([4, 8, 5, 2, 25]))") // Expected: [2, 5, 2, -1, -1]
print("Next Smaller Element for [13, 7, 6, 12]: \(sol.nextSmallerElement([13, 7, 6, 12]))")    // Expected: [7, 6, -1, -1]

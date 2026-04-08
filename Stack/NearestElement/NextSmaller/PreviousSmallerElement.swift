/**
 * Problem: Previous Smaller Element
 * Topic: Stack / Nearest Element / Next Smaller (Previous Variant)
 * 
 * Description:
 * Given an array of integers, for each element in the array, find the first 
 * smaller element that is to the left of it. If it does not exist, return -1.
 * 
 * Time Complexity: O(n) where n is length of the array.
 * Space Complexity: O(n) for the stack.
 */

import Foundation

class Solution {
    /**
     * Finds the nearest smaller element to the left for each element in an array.
     * - Parameters:
     *   - arr: The input integer array.
     * - Returns: Array of previous smaller elements.
     */
    func previousSmallerElement(_ arr: [Int]) -> [Int] {
        var result = [Int]()
        var stack = [Int]() // Increasing stack
        
        for num in arr {
            // While current element is smaller than or equal to the stack top
            // pop elements as they cannot be the nearest smaller for current or future.
            while !stack.isEmpty && stack.last! >= num {
                stack.popLast()
            }
            
            // If stack is empty, no smaller exists to the left
            if stack.isEmpty {
                result.append(-1)
            } else {
                result.append(stack.last!)
            }
            
            // Current element is now a potential nearest smaller for future elements
            stack.append(num)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Previous Smaller Element for [4, 5, 2, 10, 8]: \(sol.previousSmallerElement([4, 5, 2, 10, 8]))") // Expected: [-1, 4, -1, 2, 2]
print("Previous Smaller Element for [3, 2, 1]: \(sol.previousSmallerElement([3, 2, 1]))")             // Expected: [-1, -1, -1]

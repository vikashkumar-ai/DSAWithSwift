/**
 * Problem: Next Greater Element II (Circular Array)
 * Topic: Stack / NearestElement / NextGreater
 * 
 * Description:
 * Given a circular integer array nums (meaning the next element of 
 * nums[n-1] is nums[0]), return the next greater number for 
 * every element in nums.
 * 
 * Pattern: Monotonic Stack on a Virtual Double Array.
 * 1. To simulate a circular array, iterate over the sequence 
 *    twice (from 2n-1 down to 0).
 * 2. Use a monotonic decreasing stack to track candidates.
 * 3. Pop if stack.top <= nums[i % n].
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class NextGreaterSolverII {
    /**
     * Finds next greater elements in a circular array.
     * - Parameters:
     *   - nums: Input array.
     * - Returns: Next greater elements array.
     */
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: -1, count: n)
        var stack = [Int]() // Stores values
        
        // Iterate twice to simulate circularity
        for i in (0..<2 * n).reversed() {
            let num = nums[i % n]
            
            // Maintain decreasing stack
            while !stack.isEmpty && stack.last! <= num {
                stack.removeLast()
            }
            
            // Only update result during the first real pass
            if i < n {
                result[i] = stack.isEmpty ? -1 : stack.last!
            }
            
            stack.append(num)
        }
        
        return result
    }
}

// --- Test Cases ---
let solver = NextGreaterSolverII()
print("Next greater in [1, 2, 1]: \(solver.nextGreaterElements([1, 2, 1]))") 
// Expected: [2, -1, 2]
print("Next greater in [1, 2, 3, 4, 3]: \(solver.nextGreaterElements([1, 2, 3, 4, 3]))") 
// Expected: [2, 3, 4, -1, 4]

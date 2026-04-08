/**
 * Problem: Previous Smaller Element
 * Topic: Stack / NearestElement / PreviousVariants
 * 
 * Description:
 * Given an array, for each element, find the nearest smaller 
 * element on its left-hand side. If no smaller element exists, 
 * return -1.
 * 
 * Pattern: Monotonic Increasing Stack (Left-to-Right).
 * 1. Iterate from left to right.
 * 2. While !stack.isEmpty && stack.top >= current:
 *    - Pop stack.top.
 * 3. result = stack.top (or -1).
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class PreviousSmallerSolver {
    /**
     * Finds the previous smaller elements for each array item.
     * - Parameters:
     *   - arr: Input array.
     * - Returns: Previous smaller elements array.
     */
    func previousSmallerElements(_ arr: [Int]) -> [Int] {
        let n = arr.count
        var result = Array(repeating: -1, count: n)
        var stack = [Int]()
        
        for i in 0..<n {
            while !stack.isEmpty && stack.last! >= arr[i] {
                stack.removeLast()
            }
            
            result[i] = stack.isEmpty ? -1 : stack.last!
            stack.append(arr[i])
        }
        
        return result
    }
}

// --- Test Cases ---
let solver = PreviousSmallerSolver()
print("Previous smaller in [4, 5, 2, 10, 8]: \(solver.previousSmallerElements([4, 5, 2, 10, 8]))") 
// Expected: [-1, 4, -1, 2, 2]
print("Previous smaller in [1, 2, 3, 4]: \(solver.previousSmallerElements([1, 2, 3, 4]))") 
// Expected: [-1, 1, 2, 3]

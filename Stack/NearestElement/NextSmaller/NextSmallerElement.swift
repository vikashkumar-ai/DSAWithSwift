/**
 * Problem: Next Smaller Element
 * Topic: Stack / NearestElement / NextSmaller
 * 
 * Description:
 * Given an array, find the next smaller element for every element. 
 * The next smaller element for an element x is the first 
 * element to its right which is smaller than x. If no such 
 * element exists, return -1.
 * 
 * Pattern: Monotonic Increasing Stack.
 * 1. Iterate from right to left.
 * 2. While !stack.isEmpty && stack.top >= current:
 *    - Pop stack.top.
 * 3. result = stack.top (or -1).
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class NextSmallerSolver {
    /**
     * Finds the next smaller elements for each array item.
     * - Parameters:
     *   - arr: Input array.
     * - Returns: Next smaller elements array.
     */
    func nextSmallerElements(_ arr: [Int]) -> [Int] {
        let n = arr.count
        var result = Array(repeating: -1, count: n)
        var stack = [Int]()
        
        for i in (0..<n).reversed() {
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
let solver = NextSmallerSolver()
print("Next smaller in [4, 8, 5, 2, 25]: \(solver.nextSmallerElements([4, 8, 5, 2, 25]))") 
// Expected: [2, 5, 2, -1, -1]
print("Next smaller in [13, 7, 6, 12]: \(solver.nextSmallerElements([13, 7, 6, 12]))") 
// Expected: [7, 6, -1, -1]

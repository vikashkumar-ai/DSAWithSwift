/**
 * Problem: Next Greater Element I
 * Topic: Stack / Monotonic Stack / Decreasing Stack
 * 
 * Description:
 * The next greater element of some element x in an array is the first greater 
 * element that is to the right of x in the same array.
 * 
 * Time Complexity: O(n + m) where n and m are lengths of nums1 and nums2.
 * Space Complexity: O(m) for the hash map and stack.
 */

import Foundation

class Solution {
    /**
     * Finds the next greater element for subset nums1 based on superset nums2.
     * - Parameters:
     *   - nums1: Query array.
     *   - nums2: Main array for searching.
     * - Returns: Array of next greater elements.
     */
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nextGreaterMap = [Int: Int]()
        var stack = [Int]() // Decreasing stack: elements go from larger to smaller
        
        // Step 1: Iterate through nums2 to find next greater element for each
        for num in nums2 {
            // While current num is greater than the stack top, current num is 
            // the next greater element for the element at stack top.
            while !stack.isEmpty && stack.last! < num {
                let smaller = stack.popLast()!
                nextGreaterMap[smaller] = num
            }
            stack.append(num)
        }
        
        // Step 2: Build the result for nums1 using the map
        return nums1.map { nextGreaterMap[$0] ?? -1 }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Next Greater Element for [4, 1, 2] in [1, 3, 4, 2]: \(sol.nextGreaterElement([4, 1, 2], [1, 3, 4, 2]))") // Expected: [-1, 3, -1]
print("Next Greater Element for [2, 4] in [1, 2, 3, 4]: \(sol.nextGreaterElement([2, 4], [1, 2, 3, 4]))")     // Expected: [3, -1]

/**
 * Problem: Range Sum Query - Immutable
 * Topic: Array / Prefix Based / Prefix Sum
 * 
 * Description:
 * Given an integer array nums, handle multiple queries of the form 
 * sumRange(left, right), where left and right are indices. 
 * Calculate the sum of the elements of nums between indices left and right.
 * 
 * Time Complexity: O(n) for pre-calculation, O(1) per query.
 * Space Complexity: O(n) for the prefix sum array.
 */

import Foundation

class NumArray {
    private var prefixSum: [Int]

    /**
     * Initializes the NumArray object with the pre-calculated prefix sums.
     * - Parameters:
     *   - nums: The input integer array.
     */
    init(_ nums: [Int]) {
        let n = nums.count
        prefixSum = Array(repeating: 0, count: n + 1)
        
        // Fill prefix sums: prefixSum[i] stores sum of nums[0...i-1]
        for i in 0..<n {
            prefixSum[i + 1] = prefixSum[i] + nums[i]
        }
    }
    
    /**
     * Returns the sum of the elements of nums between indices left and right.
     * - Parameters:
     *   - left: Starting index.
     *   - right: Ending index.
     * - Returns: Sum of elements from left to right.
     */
    func sumRange(_ left: Int, _ right: Int) -> Int {
        // Sum(left, right) = prefixSum[right + 1] - prefixSum[left]
        return prefixSum[right + 1] - prefixSum[left]
    }
}

// --- Test Cases ---
let obj = NumArray([-2, 0, 3, -5, 2, -1])
print("Range Sum Query (-2, 0, 3, -5, 2, -1):")
print("sumRange(0, 2): \(obj.sumRange(0, 2))") // Expected: 1 (-2 + 0 + 3)
print("sumRange(2, 5): \(obj.sumRange(2, 5))") // Expected: -1 (3 - 5 + 2 - 1)
print("sumRange(0, 5): \(obj.sumRange(0, 5))") // Expected: -3 (-2 + 0 + 3 - 5 + 2 - 1)

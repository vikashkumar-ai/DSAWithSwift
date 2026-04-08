/**
 * Problem: Counting Sort
 * Topic: Sorting Algorithms / NonComparisonSorts
 * 
 * Description:
 * Counting Sort is a non-comparison based sorting algorithm that counts 
 * the frequency of each element and uses it to place elements at 
 * their correct positions in the output array.
 * 
 * Pattern: Efficient for sorting when the range of input values (k) 
 * is not significantly larger than the number of items (n).
 * 
 * Time Complexity: O(n + k) where n is input array size and k is the range.
 * Space Complexity: O(n + k).
 */

import Foundation

class Solution {
    /**
     * Sorts an array using the Counting Sort algorithm.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func countingSort(_ array: inout [Int]) {
        guard !array.isEmpty else { return }
        
        let maxVal = array.max()!
        let minVal = array.min()!
        let range = maxVal - minVal + 1
        
        var count = Array(repeating: 0, count: range)
        var output = Array(repeating: 0, count: array.count)
        
        // Step 1: Count frequency of each element
        for num in array {
            count[num - minVal] += 1
        }
        
        // Step 2: Compute cumulative frequency
        for i in 1..<range {
            count[i] += count[i - 1]
        }
        
        // Step 3: Build the output array (starting from the back to maintain stability)
        for i in (0..<array.count).reversed() {
            let num = array[i]
            output[count[num - minVal] - 1] = num
            count[num - minVal] -= 1
        }
        
        // Step 4: Copy the sorted array back
        for i in 0..<array.count {
            array[i] = output[i]
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [4, 2, 2, 8, 3, 3, 1]
sol.countingSort(&testArr)
print("Counting Sort Result (Range 1-8): \(testArr)") // Expected: [1, 2, 2, 3, 3, 4, 8]

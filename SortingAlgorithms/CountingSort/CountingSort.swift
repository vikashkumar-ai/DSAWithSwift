/**
 * Problem: Counting Sort
 * Topic: Sorting Algorithms / CountingSort
 * 
 * Description:
 * Counting Sort is a non-comparison-based sorting technique that sorts 
 * objects based on the frequency of each distinct element. It 
 * expects the input elements to be mapping to a known range of integers.
 * 
 * Pattern: Frequency Array. Map the input to a frequency array and 
 * reconstruct the sorted results.
 * 
 * Time Complexity: O(n + k).
 * Space Complexity: O(k) where k is the range of input values.
 */

import Foundation

class Solution {
    /**
     * Sorts an array using Counting Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     *   - k: Maximum value in the array.
     */
    func countingSort(_ array: inout [Int], _ k: Int) {
        if array.isEmpty { return }
        
        var count = Array(repeating: 0, count: k + 1)
        for num in array {
            count[num] += 1
        }
        
        var idx = 0
        for i in 0...k {
            while count[i] > 0 {
                array[idx] = i
                idx += 1
                count[i] -= 1
            }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [4, 2, 2, 8, 3, 3, 1]
sol.countingSort(&testArr, 8)
print("Counting Sort Result: \(testArr)") // Expected: [1, 2, 2, 3, 3, 4, 8]

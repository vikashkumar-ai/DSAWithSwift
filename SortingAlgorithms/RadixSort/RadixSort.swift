/**
 * Problem: Radix Sort
 * Topic: Sorting Algorithms / RadixSort
 * 
 * Description:
 * Radix Sort is a non-comparative sorting algorithm. It avoids 
 * comparison by creating and distributing elements into buckets 
 * according to their radix. For elements with more than one 
 * significant digit, this bucketing process is repeated for each 
 * digit, while preserving the ordering of the previous step.
 * 
 * Pattern: Stable counting sort for each digit position (LSD).
 * 
 * Time Complexity: O(d * (n + k)) where d is number of digits.
 * Space Complexity: O(n + k).
 */

import Foundation

class Solution {
    /**
     * Sorts an array using Radix Sort.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func radixSort(_ array: inout [Int]) {
        if array.isEmpty { return }
        
        let maxVal = array.max() ?? 0
        var exp = 1
        
        while maxVal / exp > 0 {
            countingSortByDigit(&array, exp)
            exp *= 10
        }
    }
    
    private func countingSortByDigit(_ array: inout [Int], _ exp: Int) {
        let n = array.count
        var output = Array(repeating: 0, count: n)
        var count = Array(repeating: 0, count: 10)
        
        // Step 1: Store counts of occurrences in count[]
        for i in 0..<n {
            let digit = (array[i] / exp) % 10
            count[digit] += 1
        }
        
        // Step 2: Change count[i] so that count[i] now contains 
        // the actual position of this digit in output[]
        for i in 1..<10 {
            count[i] += count[i - 1]
        }
        
        // Step 3: Build the output array (traverse backwards to preserve stability)
        for i in (0..<n).reversed() {
            let digit = (array[i] / exp) % 10
            output[count[digit] - 1] = array[i]
            count[digit] -= 1
        }
        
        // Step 4: Copy the output array to the original array
        for i in 0..<n {
            array[i] = output[i]
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [170, 45, 75, 90, 802, 24, 2, 66]
sol.radixSort(&testArr)
print("Radix Sort Result: \(testArr)") // Expected: [2, 24, 45, 66, 75, 90, 170, 802]

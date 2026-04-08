/**
 * Problem: Radix Sort Implementation
 * Topic: Sorting Algorithms / NonComparisonSorts
 * 
 * Description:
 * Radix sort is a non-comparative sorting algorithm. It avoids 
 * comparison by creating and distributing elements into buckets 
 * according to their radix. For elements with more than one 
 * significant digit, this process is repeated for each digit.
 * 
 * Pattern: Counting Sort as a subroutine.
 * 1. Find the maximum element to determine the number of digits.
 * 2. Perform counting sort for each digit position (1s, 10s, 100s, ...).
 * 
 * Time Complexity: O(d * (n + k)), where d is number of digits, 
 * n is number of elements, and k is base of numeral system.
 * Space Complexity: O(n + k).
 */

import Foundation

class RadixSorter {
    /**
     * Sorts array using radix sort.
     * - Parameters:
     *   - arr: Input integer array.
     */
    func sort(_ arr: inout [Int]) {
        guard let maxVal = arr.max() else { return }
        
        // Do counting sort for every digit. Instead of passing 
        // digit number, exp is passed (exp = 10^i).
        var exp = 1
        while maxVal / exp > 0 {
            countingSort(&arr, exp)
            exp *= 10
        }
    }
    
    private func countingSort(_ arr: inout [Int], _ exp: Int) {
        let n = arr.count
        var output = Array(repeating: 0, count: n)
        var count = Array(repeating: 0, count: 10)
        
        // Store count of occurrences in count[]
        for i in 0..<n {
            let digit = (arr[i] / exp) % 10
            count[digit] += 1
        }
        
        // Change count[i] so that count[i] now contains actual 
        // position of this digit in output[]
        for i in 1..<10 {
            count[i] += count[i - 1]
        }
        
        // Build the output array
        for i in (0..<n).reversed() {
            let digit = (arr[i] / exp) % 10
            output[count[digit] - 1] = arr[i]
            count[digit] -= 1
        }
        
        // Copy the output array to arr, so that arr now 
        // contains sorted numbers according to current digit
        for i in 0..<n {
            arr[i] = output[i]
        }
    }
}

// --- Test Cases ---
let solver = RadixSorter()
var testArr = [170, 45, 75, 90, 802, 24, 2, 66]
solver.sort(&testArr)
print("Radix Sort: \(testArr)") // Expected: [2, 24, 45, 66, 75, 90, 170, 802]

/**
 * Problem: Counting Sort Implementation
 * Topic: Sorting Algorithms / NonComparisonSorts
 * 
 * Description:
 * Counting sort is an integer sorting algorithm that operates by 
 * counting the number of objects that possess distinct key values, 
 * and using arithmetic on those counts to determine the positions 
 * of each key value in the output sequence.
 * 
 * Pattern: Frequency Array + Cumulative Sum.
 * 1. Find the range [min, max] of the input.
 * 2. Count the occurrences of each element.
 * 3. Calculate cumulative sums (to find start positions).
 * 4. Build the output array using original elements and counts.
 * 
 * Time Complexity: O(n + k), where k is the range of inputs.
 * Space Complexity: O(n + k).
 */

import Foundation

class CountingSorter {
    /**
     * Sorts array using counting sort.
     * - Parameters:
     *   - arr: Input integer array.
     * - Returns: Sorted array.
     */
    func sort(_ arr: [Int]) -> [Int] {
        guard let maxVal = arr.max(), let minVal = arr.min() else { return [] }
        
        let range = maxVal - minVal + 1
        var count = Array(repeating: 0, count: range)
        var output = Array(repeating: 0, count: arr.count)
        
        // Step 2: Store count of each element
        for num in arr {
            count[num - minVal] += 1
        }
        
        // Step 3: Change count[i] so that count[i] now contains 
        // the actual position of this element in output array
        for i in 1..<range {
            count[i] += count[i - 1]
        }
        
        // Step 4: Build the output array
        for num in arr.reversed() {
            output[count[num - minVal] - 1] = num
            count[num - minVal] -= 1
        }
        
        return output
    }
}

// --- Test Cases ---
let solver = CountingSorter()
let testArr = [4, 2, 2, 8, 3, 3, 1]
print("Counting Sort: \(solver.sort(testArr))") // Expected: [1, 2, 2, 3, 3, 4, 8]

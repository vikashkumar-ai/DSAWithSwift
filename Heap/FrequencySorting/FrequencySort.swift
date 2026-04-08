/**
 * Problem: Sort Array by Increasing Frequency
 * Topic: Heap / FrequencySorting
 * 
 * Description:
 * Given an array of integers nums, sort the array in increasing 
 * order based on the frequency of the values. If multiple values 
 * have the same frequency, sort them in decreasing order.
 * 
 * Pattern: Frequency Map + Custom Sort.
 * 1. Build a frequency dictionary.
 * 2. Use a custom sorting rule where primary key is frequency 
 *    and secondary key is value (for ties).
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class FrequencyArrSorter {
    /**
     * Sorts array by frequency.
     * - Parameters:
     *   - nums: Input array.
     * - Returns: Sorted array.
     */
    func frequencySort(_ nums: [Int]) -> [Int] {
        var freq = [Int: Int]()
        for num in nums {
            freq[num, default: 0] += 1
        }
        
        // Custom Sort based on frequency and then value
        return nums.sorted { a, b in
            if freq[a] != freq[b] {
                // Primary: Ascending frequency
                return freq[a]! < freq[b]!
            } else {
                // Secondary: Descending value for ties
                return a > b
            }
        }
    }
}

// --- Test Cases ---
let solver = FrequencyArrSorter()
let nums1 = [1, 1, 2, 2, 2, 3]
let nums2 = [2, 3, 1, 3, 2]
print("Sorted [1,1,2,2,2,3]: \(solver.frequencySort(nums1))") 
// Expected: [3, 1, 1, 2, 2, 2]
print("Sorted [2,3,1,3,2]: \(solver.frequencySort(nums2))") 
// Expected: [1, 3, 3, 2, 2]

/**
 * Problem: Bucket Sort Implementation
 * Topic: Sorting Algorithms / NonComparisonSorts
 * 
 * Description:
 * Bucket sort (or bin sort) is a sorting algorithm that works by 
 * distributing the elements of an array into a number of buckets. 
 * Each bucket is then sorted individually, either using a different 
 * sorting algorithm, or by recursively applying the bucket 
 * sorting algorithm.
 * 
 * Pattern: Distribution-based sorting.
 * 1. Create a set of empty buckets (typically sqrt(n) buckets).
 * 2. Scatter each element into its corresponding bucket.
 * 3. Sort each non-empty bucket (using a simple insertion sort).
 * 4. Gather all elements back into the original array.
 * 
 * Time Complexity: O(n + k) average, O(n^2) worst.
 * Space Complexity: O(n + k).
 */

import Foundation

class BucketSorter {
    /**
     * Sorts array using bucket sort.
     * - Parameters:
     *   - arr: Input integer array.
     */
    func sort(_ arr: inout [Double]) {
        let n = arr.count
        if n <= 1 { return }
        
        // 1. Create n empty buckets
        var buckets = Array(repeating: [Double](), count: n)
        
        // 2. Put array elements in different buckets
        for i in 0..<n {
            let bucketIdx = Int(Double(n) * arr[i])
            buckets[bucketIdx].append(arr[i])
        }
        
        // 3. Sort individual buckets
        for i in 0..<n {
            buckets[i].sort()
        }
        
        // 4. Concatenate all buckets into arr[]
        var index = 0
        for i in 0..<n {
            for j in 0..<buckets[i].count {
                arr[index] = buckets[i][j]
                index += 1
            }
        }
    }
}

// --- Test Cases ---
let solver = BucketSorter()
var testArr = [0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434]
solver.sort(&testArr)
print("Bucket Sort: \(testArr)") 
// Expected: [0.1234, 0.3434, 0.565, 0.656, 0.665, 0.897]

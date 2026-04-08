/**
 * Problem: Bucket Sort
 * Topic: Sorting Algorithms / BucketSort
 * 
 * Description:
 * Bucket Sort is a sorting algorithm that works by distributing the 
 * elements of an array into a number of buckets. Each bucket is 
 * then sorted individually, either using a different sorting algorithm, 
 * or by recursively applying the bucket sorting algorithm.
 * 
 * Pattern: Bucketing. Map the input into n non-empty buckets and 
 * sort each bucket.
 * 
 * Time Complexity: O(n + k) average, O(n²) worst.
 * Space Complexity: O(n + k).
 */

import Foundation

class Solution {
    /**
     * Sorts an array of floats (0 to 1) using Bucket Sort.
     * - Parameters:
     *   - array: Pointer to an array of doubles.
     */
    func bucketSort(_ array: inout [Double]) {
        let n = array.count
        if n <= 1 { return }
        
        // Step 1: Create n empty buckets
        var buckets = Array(repeating: [Double](), count: n)
        
        // Step 2: Put array elements in different buckets
        for num in array {
            let bucketIdx = Int(Double(n) * num)
            buckets[min(bucketIdx, n - 1)].append(num)
        }
        
        // Step 3: Sort individual buckets (using standard sort for simplicity)
        for i in 0..<n {
            buckets[i].sort()
        }
        
        // Step 4: Concatenate all buckets into array
        var index = 0
        for i in 0..<n {
            for j in 0..<buckets[i].count {
                array[index] = buckets[i][j]
                index += 1
            }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434]
sol.bucketSort(&testArr)
print("Bucket Sort Result: \(testArr)") 
// Expected: [0.1234, 0.3434, 0.565, 0.656, 0.665, 0.897]

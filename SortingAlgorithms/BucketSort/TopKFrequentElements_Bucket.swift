/**
 * Problem: Top K Frequent Elements (using Bucket Sort)
 * Topic: Sorting Algorithms / BucketSort
 * 
 * Description:
 * Given an integer array nums and an integer k, return the k most 
 * frequent elements. You may return the answer in any order.
 * 
 * Pattern: Bucket Sort by Frequency. After generating the frequency map, 
 * use the frequency values as indices into a bucket array. 
 * Then iterate through the buckets from largest frequency to smallest.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the k most frequent elements using bucket sort.
     * - Parameters:
     *   - nums: Input integer array.
     *   - k: Selection size.
     * - Returns: Array of top k elements.
     */
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var count = [Int: Int]()
        for num in nums {
            count[num, default: 0] += 1
        }
        
        // Buckets where index represents frequency
        var buckets = Array(repeating: [Int](), count: nums.count + 1)
        for (num, freq) in count {
            buckets[freq].append(num)
        }
        
        var result = [Int]()
        // Traverse buckets backwards for highest frequency
        for i in (0...nums.count).reversed() {
            for num in buckets[i] {
                result.append(num)
                if result.count == k { return result }
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Top 2 frequent in [1,1,1,2,2,3]: \(sol.topKFrequent([1,1,1,2,2,3], 2))") 
// Expected: [1, 2]
print("Top 1 frequent in [1]: \(sol.topKFrequent([1], 1))") 
// Expected: [1]

/**
 * Problem: Longest Increasing Subsequence
 * Topic: Dynamic Programming / LIS
 * 
 * Description:
 * Given an integer array nums, return the length of the longest 
 * strictly increasing subsequence.
 * 
 * Pattern: Dynamic Programming + Binary Search (O(n log n)). 
 * Maintain an array 'tails' where each element tails[i] is the 
 * smallest tail of all increasing subsequences of length i+1.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the length of the longest increasing subsequence.
     * - Parameters:
     *   - nums: Input integer array.
     * - Returns: Length of LIS.
     */
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        var tails = [Int]()
        for num in nums {
            var i = 0
            var j = tails.count
            
            // Binary search for the first tail >= num
            while i < j {
                let mid = i + (j - i) / 2
                if tails[mid] < num {
                    i = mid + 1
                } else {
                    j = mid
                }
            }
            
            // If i is tails.count, num is larger than all tails, start a new length
            if i == tails.count {
                tails.append(num)
            } else {
                // Replace existing tail with num to keep it as small as possible
                tails[i] = num
            }
        }
        
        return tails.count
    }
}

// --- Test Cases ---
let sol = Solution()
print("LIS for [10, 9, 2, 5, 3, 7, 101, 18]: \(sol.lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]))") 
// Expected: 4 ([2, 3, 7, 18] or [2, 5, 7, 18])
print("LIS for [0, 1, 0, 3, 2, 3]: \(sol.lengthOfLIS([0, 1, 0, 3, 2, 3]))") 
// Expected: 4

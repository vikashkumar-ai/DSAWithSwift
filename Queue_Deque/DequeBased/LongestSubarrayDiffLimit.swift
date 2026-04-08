/**
 * Problem: Longest Continuous Subarray with Absolute Diff Less Than or Equal to Limit
 * Topic: Queue_Deque / DequeBased
 * 
 * Description:
 * Given an array of integers nums and an integer limit, return 
 * the size of the longest non-empty subarray such that the absolute 
 * difference between any two elements of this subarray is less than 
 * or equal to limit.
 * 
 * Pattern: Monotonic Dequeue. Use two deques to maintain the 
 * maximum and minimum elements in the current sliding window.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Finds the longest subarray within the difference limit.
     * - Parameters:
     *   - nums: The input integer array.
     *   - limit: The maximum allowed difference.
     * - Returns: The size of the longest subarray.
     */
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var maxDeque = [Int]() // Stores indices, strictly decreasing values
        var minDeque = [Int]() // Stores indices, strictly increasing values
        var left = 0
        var result = 0
        
        for right in 0..<nums.count {
            // Maintain maxDeque: top element is the latest maximum
            while !maxDeque.isEmpty && nums[maxDeque.last!] < nums[right] {
                maxDeque.removeLast()
            }
            maxDeque.append(right)
            
            // Maintain minDeque: top element is the latest minimum
            while !minDeque.isEmpty && nums[minDeque.last!] > nums[right] {
                minDeque.removeLast()
            }
            minDeque.append(right)
            
            // If the maximum difference in the current window exceeds limit, 
            // shrink the window from the left.
            while nums[maxDeque.first!] - nums[minDeque.first!] > limit {
                left += 1
                if maxDeque.first! < left {
                    maxDeque.removeFirst()
                }
                if minDeque.first! < left {
                    minDeque.removeFirst()
                }
            }
            
            result = max(result, right - left + 1)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Longest Subarray for [8,2,4,7] with limit 4: \(sol.longestSubarray([8,2,4,7], 4))") // Expected: 2 ([2,4] or [4,7])
print("Longest Subarray for [10,1,2,4,7,2] with limit 5: \(sol.longestSubarray([10,1,2,4,7,2], 5))") // Expected: 4 ([1,2,4,7] or [2,4,7,2])

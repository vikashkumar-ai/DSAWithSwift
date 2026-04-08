/**
 * Problem: Sliding Window Maximum (Maximum of all subarrays of size K)
 * Topic: Array / Sliding Window / Fixed Size
 * 
 * Description:
 * Given an array and an integer k, find the maximum for each and every contiguous subarray of size k.
 * 
 * Time Complexity: O(n) where n is the length of the array. Each element is added and removed from the deque at most once.
 * Space Complexity: O(k) for the deque.
 */

import Foundation

class Solution {
    /**
     * Finds the maximum of every window of size k.
     * - Parameters:
     *   - arr: The input array of integers.
     *   - k: The size of the window.
     * - Returns: An array containing the maximum of each window.
     */
    func slidingWindowMax(_ arr: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var deque = [Int]() // Stores indices of elements in the current window
        
        for i in 0..<arr.count {
            // Remove indices that are out of the current window range
            if !deque.isEmpty && deque.first! <= i - k {
                deque.removeFirst()
            }
            
            // Remove indices of elements smaller than the current element from the back
            // because they will never be the maximum in any window starting from i
            while !deque.isEmpty && arr[deque.last!] <= arr[i] {
                deque.removeLast()
            }
            
            // Add current element's index
            deque.append(i)
            
            // Once we have a full window, add the max (at deque's front) to result
            if i >= k - 1 {
                result.append(arr[deque.first!])
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [1, 3, -1, -3, 5, 3, 6, 7]
let k = 3
print("Sliding Window Maximum (size \(k)) in \(testArr): \(sol.slidingWindowMax(testArr, k))") // Expected: [3, 3, 5, 5, 6, 7]

/**
 * Problem: Sliding Window Maximum (using Deque)
 * Topic: Queue / Deque Based
 * 
 * Description:
 * Given an array and an integer k, find the maximum for each and every 
 * contiguous subarray of size k.
 * 
 * Time Complexity: O(n) where n is length of the array.
 * Space Complexity: O(k) for the deque.
 */

import Foundation

class Solution {
    /**
     * Finds the maximum of every window of size k using a Deque.
     * - Parameters:
     *   - arr: The input array of integers.
     *   - k: The size of the window.
     * - Returns: An array containing the maximum of each window.
     */
    func slidingWindowMax(_ arr: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var deque = [Int]() // Double-ended queue to store indices of elements
        
        for i in 0..<arr.count {
            // Step 1: Remove indices that are out of the current window range
            if let first = deque.first, first <= i - k {
                deque.removeFirst()
            }
            
            // Step 2: Remove indices of elements smaller than the current element from the back
            // because they will never be the maximum in any window starting from i
            while let last = deque.last, arr[last] <= arr[i] {
                deque.removeLast()
            }
            
            // Step 3: Add current element's index to the deque
            deque.append(i)
            
            // Step 4: Once we have a full window (size k), add the max to the result
            // The maximum element is always at the front of the deque.
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

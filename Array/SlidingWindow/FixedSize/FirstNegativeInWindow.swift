/**
 * Problem: First Negative Integer in every Window of Size K
 * Topic: Array / Sliding Window / Fixed Size
 * 
 * Description:
 * Given an array and a positive integer k, find the first negative integer for each and every contiguous window of size k. If a window does not contain a negative integer, then print 0 for that window.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(k) for storing negative numbers in a queue/list.
 */

import Foundation

class Solution {
    /**
     * Finds the first negative integer in each window of size k.
     * - Parameters:
     *   - arr: The input array of integers.
     *   - k: The size of the window.
     * - Returns: An array of first negative integers for each window.
     */
    func firstNegativeInWindow(_ arr: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var negatives = [Int]() // Stores negative integers from current window
        var i = 0
        var j = 0
        
        while j < arr.count {
            // Add negative number to the queue
            if arr[j] < 0 {
                negatives.append(arr[j])
            }
            
            // If window size is less than k, increase j
            if j - i + 1 < k {
                j += 1
            } 
            // Once window size reaches k
            else if j - i + 1 == k {
                // Determine the first negative from current negatives list
                if negatives.isEmpty {
                    result.append(0)
                } else {
                    result.append(negatives.first!)
                    
                    // If the first element in negatives is the element sliding out
                    if arr[i] == negatives.first! {
                        negatives.removeFirst()
                    }
                }
                
                // Slide the window
                i += 1
                j += 1
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [12, -1, -7, 8, -15, 30, 16, 28]
let k = 3
print("First Negative in each window of size \(k) in \(testArr): \(sol.firstNegativeInWindow(testArr, k))") // Expected: [-1, -1, -7, -15, -15, 0]

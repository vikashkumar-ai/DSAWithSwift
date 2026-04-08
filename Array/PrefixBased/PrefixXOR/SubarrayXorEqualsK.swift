/**
 * Problem: Subarray XOR Equals K
 * Topic: Array / Prefix Based / Prefix XOR
 * 
 * Description:
 * Given an array of integers and an integer k, find the number of subarrays 
 * whose XOR sum equals k.
 * 
 * Time Complexity: O(n) where n is the length of the array.
 * Space Complexity: O(n) for the hash map to store prefix XOR frequency.
 */

import Foundation

class Solution {
    /**
     * Finds the number of subarrays with XOR sum equal to k.
     * - Parameters:
     *   - arr: The input integer array.
     *   - k: The target XOR sum.
     * - Returns: Count of subarrays whose XOR sum is k.
     */
    func subarrayXor(_ arr: [Int], _ k: Int) -> Int {
        var count = 0
        var currentXor = 0
        var xorFrequency = [0: 1] // Initial state for XOR = 0 found once
        
        for num in arr {
            currentXor ^= num
            
            // Check if (currentXor ^ k) exists in our hash map
            // If currentXor ^ X = k, then X = currentXor ^ k
            let targetXor = currentXor ^ k
            if let occurrences = xorFrequency[targetXor] {
                count += occurrences
            }
            
            // Increment the currentXor frequency in the hash map
            xorFrequency[currentXor, default: 0] += 1
        }
        
        return count
    }
}

// --- Test Cases ---
let sol = Solution()
let testArr = [4, 2, 2, 6, 4]
let k = 6
print("Count of Subarrays with XOR sum \(k) in \(testArr): \(sol.subarrayXor(testArr, k))") // Expected: 4 ([4, 2], [2, 2, 6], [6], [4, 2, 2, 6, 4])

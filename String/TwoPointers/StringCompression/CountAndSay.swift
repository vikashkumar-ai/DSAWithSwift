/**
 * Problem: Count and Say
 * Topic: String / TwoPointers / StringCompression
 * 
 * Description:
 * Construct a count-and-say sequence. For example, the first element 
 * is 1, the second is 11 (one 1), the third is 21 (two 1s), the 
 * fourth is 1211 (one 2 followed by one 1), and so on. 
 * Given an integer n, return the n-th term of the count-and-say 
 * sequence.
 * 
 * Pattern: Two Pointers for RLE (Run-Length Encoding). Iterate 
 * through the current sequence and use a pointer to find the 
 * end of consecutive identical characters.
 * 
 * Time Complexity: O(2ⁿ) (the length of the string grows exponentially).
 * Space Complexity: O(2ⁿ).
 */

import Foundation

class Solution {
    /**
     * Finds the n-th term of the count-and-say sequence.
     * - Parameters:
     *   - n: The target index.
     * - Returns: The n-th term as a string.
     */
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }
        
        var current = "1"
        for _ in 2...n {
            current = getNext(current)
        }
        
        return current
    }
    
    private func getNext(_ s: String) -> String {
        var res = ""
        let chars = Array(s)
        var i = 0
        
        while i < chars.count {
            // Use Two Pointers to find the consecutive range
            var j = i
            while j < chars.count && chars[j] == chars[i] {
                j += 1
            }
            // Add (count) (digit)
            res += "\(j - i)\(chars[i])"
            // Move pointer forward
            i = j
        }
        
        return res
    }
}

// --- Test Cases ---
let sol = Solution()
print("Count and Say for n=1: \(sol.countAndSay(1))")    // Expected: "1"
print("Count and Say for n=4: \(sol.countAndSay(4))")    // Expected: "1211"
print("Count and Say for n=5: \(sol.countAndSay(5))")    // Expected: "111221"

/**
 * Problem: Custom Sort String
 * Topic: HashMap / FrequencyBased
 * 
 * Description:
 * You are given two strings order and s. All the characters of order 
 * are unique and were sorted in some custom order previously.
 * Permute the characters of s so that they match the order that 
 * order was sorted. 
 * Return any permutation of s that satisfies this property.
 * 
 * Pattern: Frequency Map. Count the frequency of each character in s. 
 * Then iterate through order and output characters accordingly. 
 * Finally, output any remaining characters from s.
 * 
 * Time Complexity: O(order + s).
 * Space Complexity: O(s).
 */

import Foundation

class Solution {
    /**
     * Sorts s based on the custom order provided.
     * - Parameters:
     *   - order: The desired character order.
     *   - s: The source string to sort.
     * - Returns: The custom sorted string.
     */
    func customSortString(_ order: String, _ s: String) -> String {
        var count = [Character: Int]()
        for char in s {
            count[char, default: 0] += 1
        }
        
        var result = ""
        
        // Append characters following the order
        for char in order {
            if let freq = count[char] {
                result += String(repeating: char, count: freq)
                count.removeValue(forKey: char)
            }
        }
        
        // Append remaining characters in any order
        for (char, freq) in count {
            result += String(repeating: char, count: freq)
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Custom Sort \"cba\" for \"abcd\": \(sol.customSortString("cba", "abcd"))") 
// Expected: "cbad" (or another permutation with c,b,a in order)
print("Custom Sort \"cbafg\" for \"abcd\": \(sol.customSortString("cbafg", "abcd"))")
// Expected: "cbad"

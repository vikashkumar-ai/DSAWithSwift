/**
 * Problem: Smallest Subsequence of Distinct Characters
 * Topic: Stack / MonotonicStack / Increasing
 * 
 * Description:
 * Given a string s, return the lexicographically smallest 
 * subsequence of s that contains all the distinct characters 
 * of s exactly once.
 * 
 * Pattern: Increasing Monotonic Stack with Frequency Check.
 * 1. Count the frequency of each character.
 * 2. Maintain a 'seen' set for characters in the stack.
 * 3. While current < stack.top AND stack.top appears again later (count > 0):
 *    - Pop stack.top and remove from 'seen'.
 * 4. Push current.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(k) for unique chars.
 */

import Foundation

class SmallestSubsequenceSolver {
    /**
     * Finds the lexicographically smallest distinct subsequence.
     * - Parameters:
     *   - s: Input string.
     * - Returns: Subsequence string.
     */
    func smallestSubsequence(_ s: String) -> String {
        var count = [Character: Int]()
        for char in s {
            count[char, default: 0] += 1
        }
        
        var stack = [Character]()
        var seen = Set<Character>()
        
        for char in s {
            count[char]! -= 1
            if seen.contains(char) { continue }
            
            // Monotonic Increasing: Pop if current < top 
            // AND the top character appears again later
            while !stack.isEmpty && stack.last! > char && count[stack.last!]! > 0 {
                let removed = stack.removeLast()
                seen.remove(removed)
            }
            
            stack.append(char)
            seen.insert(char)
        }
        
        return String(stack)
    }
}

// --- Test Cases ---
let solver = SmallestSubsequenceSolver()
print("Subsequence of \"cbacdcbc\": \(solver.smallestSubsequence("cbacdcbc"))") // Expected: "acdb"
print("Subsequence of \"bcabc\":    \(solver.smallestSubsequence("bcabc"))")    // Expected: "abc"

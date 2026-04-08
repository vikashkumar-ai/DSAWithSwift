/**
 * Problem: Letter Combinations of a Phone Number
 * Topic: Recursion / Backtracking / Exploration / ChooseExploreUnchoose
 * 
 * Description:
 * Given a string containing digits from 2-9 inclusive, return all 
 * possible letter combinations that the number could represent. 
 * Return the answer in any order.
 * 
 * Pattern: Choose a digit, explore all letters mapped to it, then 
 * unchoose and move to the next digit.
 * 
 * Time Complexity: O(4ⁿ * n) where n is length of digits string.
 * Space Complexity: O(n) for recursion stack.
 */

import Foundation

class Solution {
    private let phoneMap: [Character: [String]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]
    
    /**
     * Generates all letter combinations.
     * - Parameters:
     *   - digits: The input digit string.
     * - Returns: Array of all letter combinations.
     */
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        var result = [String]()
        backtrack(Array(digits), 0, "", &result)
        return result
    }
    
    private func backtrack(_ digits: [Character], _ index: Int, _ current: String, _ result: inout [String]) {
        // Base case: we have processed all digits
        if index == digits.count {
            result.append(current)
            return
        }
        
        let digit = digits[index]
        if let letters = phoneMap[digit] {
            for letter in letters {
                // Choose and Explore
                backtrack(digits, index + 1, current + letter, &result)
                // Unchoose is implicit here as we don't mutate current
            }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Letter Combinations for \"23\": \(sol.letterCombinations("23"))")
// Expected: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
print("Letter Combinations for \"\": \(sol.letterCombinations(""))")
// Expected: []

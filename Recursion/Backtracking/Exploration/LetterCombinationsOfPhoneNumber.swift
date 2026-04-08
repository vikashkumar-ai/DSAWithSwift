/**
 * Problem: Letter Combinations of a Phone Number
 * Topic: Recursion / Backtracking / Exploration
 * 
 * Description:
 * Given a string containing digits from 2-9 inclusive, return all 
 * possible letter combinations that the number could represent. 
 * Return the answer in any order.
 * 
 * Pattern: Backtracking (Decision Tree). For each digit, explore 
 * all possible letter assignments and recurse for the remaining 
 * digits.
 * 
 * Time Complexity: O(4^N * N).
 * Space Complexity: O(N) for recursion stack.
 */

import Foundation

class Solution {
    private let digitToLetters: [Character: [String]] = [
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
     * Generates all letter combinations for the given phone number.
     * - Parameters:
     *   - digits: Input string of digits.
     * - Returns: List of possible letter combinations.
     */
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        
        var result = [String]()
        backtrack(digits, 0, "", &result)
        return result
    }
    
    private func backtrack(_ digits: String, _ index: Int, _ current: String, _ result: inout [String]) {
        // Base case: current combination length equals digits length
        if index == digits.count {
            result.append(current)
            return
        }
        
        let digitsArr = Array(digits)
        let digit = digitsArr[index]
        
        if let letters = digitToLetters[digit] {
            for letter in letters {
                // Decision: include letter
                backtrack(digits, index + 1, current + letter, &result)
            }
        }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Combinations for \"23\": \(sol.letterCombinations("23"))") 
// Expected: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
print("Combinations for \"\":   \(sol.letterCombinations(""))") 
// Expected: []

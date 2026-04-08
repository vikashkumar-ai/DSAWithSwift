/**
 * Problem: Group Shifted Strings
 * Topic: HashMap / GroupingPattern
 * 
 * Description:
 * We can shift a string by shifting each of its letters to its 
 * successive letter.
 * For example, "abc" can be shifted to "bcd".
 * Given a list of strings, group all strings that belong to the 
 * same shifting sequence.
 * 
 * Pattern: For each string, generate a canonical "hash key" based 
 * on the difference between consecutive characters (modulo 26). 
 * Use this key to group strings in a hash map.
 * 
 * Time Complexity: O(n * L) where n is number of strings and L 
 * is average length.
 * Space Complexity: O(n * L).
 */

import Foundation

class Solution {
    /**
     * Groups strings based on their relative shift values.
     * - Parameters:
     *   - strings: Array of input strings.
     * - Returns: A 2D array of grouped strings.
     */
    func groupStrings(_ strings: [String]) -> [[String]] {
        var groups = [String: [String]]()
        
        for s in strings {
            let key = getHashKey(s)
            groups[key, default: []].append(s)
        }
        
        return Array(groups.values)
    }
    
    /**
     * Generates a hash key represented by character differences.
     */
    private func getHashKey(_ s: String) -> String {
        let chars = Array(s)
        var key = ""
        
        for i in 1..<chars.count {
            let diff = (Int(chars[i].asciiValue!) - Int(chars[i-1].asciiValue!) + 26) % 26
            key += "\(diff),"
        }
        
        return key
    }
}

// --- Test Cases ---
let sol = Solution()
print("Grouped Strings for [\"abc\", \"bcd\", \"acef\", \"xyz\", \"az\", \"ba\", \"a\", \"z\"]:")
print(sol.groupStrings(["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"]))
// Expected: [["abc","bcd","xyz"],["acef"],["az","ba"],["a","z"]]

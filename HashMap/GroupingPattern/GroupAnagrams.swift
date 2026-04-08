/**
 * Problem: Group Anagrams
 * Topic: HashMap / Grouping Pattern
 * 
 * Description:
 * Given an array of strings strs, group the anagrams together. 
 * An Anagram is a word or phrase formed by rearranging the letters of a 
 * different word or phrase, typically using all the original letters exactly once.
 * 
 * Time Complexity: O(n * k * log k) where n is number of strings and k is 
 * length of longest string. O(n * k) with counting sort for character frequency.
 * Space Complexity: O(n) for the hash map to group strings.
 */

import Foundation

class Solution {
    /**
     * Groups anagrams in a given array of strings.
     * - Parameters:
     *   - strs: The input array of strings.
     * - Returns: A 2D array of grouped anagrams.
     */
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups = [String: [String]]() // Sorted string as key, original strings as values
        
        for str in strs {
            // Step 1: Sort the characters of the string to get its anagram key
            let sortedKey = String(str.sorted())
            
            // Step 2: Append the original string to its group in the hash map
            groups[sortedKey, default: []].append(str)
        }
        
        // Step 3: Return the values of the hash map as the grouped results
        return Array(groups.values)
    }
}

// --- Test Cases ---
let sol = Solution()
print("Grouped Anagrams for [\"eat\",\"tea\",\"tan\",\"ate\",\"nat\",\"bat\"]: \(sol.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))") // Expected: [["eat","tea","ate"],["tan","nat"],["bat"]]
print("Grouped Anagrams for [\"\"]: \(sol.groupAnagrams([""]))")                                                                 // Expected: [[""]]
print("Grouped Anagrams for [\"a\"]: \(sol.groupAnagrams(["a"]))")                                                                // Expected: [["a"]]

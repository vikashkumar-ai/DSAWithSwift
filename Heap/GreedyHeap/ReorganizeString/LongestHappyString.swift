/**
 * Problem: Longest Happy String (using Heap)
 * Topic: Heap / GreedyHeap / ReorganizeString
 * 
 * Description:
 * A string s is called happy if it does not contain "aaa", "bbb", or 
 * "ccc" as a substring. 
 * Given three integers a, b, and c, return the longest possible 
 * happy string. If there are multiple longest happy strings, 
 * return any of them. If no such string can be made, return 
 * an empty string.
 * 
 * Pattern: Greedy with Max-Heap. At each step, pick the character 
 * with the highest count that doesn't violate the "3 in a row" 
 * constraint.
 * 
 * Time Complexity: O(n log 3) which is O(n).
 * Space Complexity: O(1) for fixed alphabet.
 */

import Foundation

class Solution {
    struct CharCount: Comparable {
        let char: Character
        var count: Int
        
        static func < (lhs: CharCount, rhs: CharCount) -> Bool {
            return lhs.count < rhs.count
        }
    }
    
    /**
     * Generates a happy string of maximum length.
     * - Parameters:
     *   - a: Count of 'a'.
     *   - b: Count of 'b'.
     *   - c: Count of 'c'.
     * - Returns: The resulting happy string.
     */
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var heap = [CharCount]()
        if a > 0 { heap.append(CharCount(char: "a", count: a)) }
        if b > 0 { heap.append(CharCount(char: "b", count: b)) }
        if c > 0 { heap.append(CharCount(char: "c", count: c)) }
        
        heap.sort(by: >)
        var result = ""
        
        while !heap.isEmpty {
            var current = heap.removeFirst()
            let n = result.count
            let chars = Array(result)
            
            // If picking the most frequent would violate the 3-in-a-row rule
            if n >= 2 && chars[n-1] == current.char && chars[n-2] == current.char {
                if heap.isEmpty { break } // No alternatives
                
                // Pick the second most frequent
                var second = heap.removeFirst()
                result.append(second.char)
                second.count -= 1
                
                if second.count > 0 {
                    heap.append(second)
                    heap.sort(by: >)
                }
                
                // Put the most frequent back
                heap.append(current)
                heap.sort(by: >)
            } else {
                result.append(current.char)
                current.count -= 1
                if current.count > 0 {
                    heap.append(current)
                    heap.sort(by: >)
                }
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("Longest happy string for (1, 1, 7): \(sol.longestDiverseString(1, 1, 7))") 
// Expected: "ccaccbcc" (or another permutation)
print("Longest happy string for (7, 1, 0): \(sol.longestDiverseString(7, 1, 0))") 
// Expected: "aabaa"

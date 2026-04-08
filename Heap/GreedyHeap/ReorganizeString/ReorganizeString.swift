/**
 * Problem: Reorganize String (Greedy with Heap)
 * Topic: Heap / GreedyHeap / ReorganizeString
 * 
 * Description:
 * Given a string s, rearrange the characters of s so that any two 
 * adjacent characters are not the same.
 * If any such rearrangement is possible, return it; otherwise, 
 * return an empty string.
 * 
 * Pattern: Greedy with Max-Heap. Maintain character frequencies. 
 * At each step, pick the most frequent character that is different 
 * from the last character used.
 * 
 * Time Complexity: O(n log k) where k is number of unique characters.
 * Space Complexity: O(k).
 */

import Foundation

class Solution {
    struct CharFreq: Comparable {
        let char: Character
        let freq: Int
        
        static func < (lhs: CharFreq, rhs: CharFreq) -> Bool {
            return lhs.freq < rhs.freq
        }
    }
    
    /**
     * Reorganizes s such that no two adjacent characters are the same.
     * - Parameters:
     *   - s: The source string.
     * - Returns: Reorganized string or empty string.
     */
    func reorganizeString(_ s: String) -> String {
        var count = [Character: Int]()
        for char in s {
            count[char, default: 0] += 1
        }
        
        var heap = [CharFreq]()
        for (char, freq) in count {
            // Early exit if any character counts more than half
            if freq > (s.count + 1) / 2 { return "" }
            heap.append(CharFreq(char: char, freq: freq))
        }
        
        heap.sort(by: >)
        
        var result = ""
        var prevChar: CharFreq? = nil
        
        while !heap.isEmpty {
            let current = heap.removeFirst()
            result.append(current.char)
            
            // Add the previous character back to the heap now that 
            // the newest character is the one we'll track.
            if let prev = prevChar, prev.freq > 0 {
                heap.append(prev)
                heap.sort(by: >)
            }
            
            // Current becomes the new previous
            prevChar = CharFreq(char: current.char, freq: current.freq - 1)
        }
        
        return result.count == s.count ? result : ""
    }
}

// --- Test Cases ---
let sol = Solution()
print("Reorganize \"aab\": \(sol.reorganizeString("aab"))") // Expected: "aba"
print("Reorganize \"aaab\": \(sol.reorganizeString("aaab"))") // Expected: ""

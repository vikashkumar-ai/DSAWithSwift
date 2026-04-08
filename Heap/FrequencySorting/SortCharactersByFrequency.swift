/**
 * Problem: Sort Characters By Frequency
 * Topic: Heap / FrequencySorting
 * 
 * Description:
 * Given a string s, sort it in decreasing order based on the 
 * frequency of the characters. The frequency of a character is the 
 * number of times it appears in the string. Return the sorted string. 
 * If there are multiple answers, return any of them.
 * 
 * Pattern: Frequency Map + Max-Heap.
 * 1. Build a frequency dictionary of characters.
 * 2. Use a Max-Heap to store (character, frequency).
 * 3. Pop each character and append it to result 'frequency' times.
 * 
 * Time Complexity: O(n log k), where k is the number of unique characters.
 * Space Complexity: O(k).
 */

import Foundation

class CharSorter {
    struct CharFreq: Comparable {
        let char: Character
        let count: Int
        
        static func < (lhs: CharFreq, rhs: CharFreq) -> Bool {
            return lhs.count < rhs.count
        }
    }
    
    /**
     * Sorts string characters by frequency.
     * - Parameters:
     *   - s: Input string.
     * - Returns: Sorted string.
     */
    func frequencySort(_ s: String) -> String {
        var freq = [Character: Int]()
        for char in s {
            freq[char, default: 0] += 1
        }
        
        // Max-Heap: Using sorted array as simplified Priority Queue
        var maxHeap = [CharFreq]()
        for (char, count) in freq {
            maxHeap.append(CharFreq(char: char, count: count))
        }
        
        // Sorting in descending order of frequency
        maxHeap.sort { $0.count > $1.count }
        
        var result = ""
        for item in maxHeap {
            result += String(repeating: item.char, count: item.count)
        }
        
        return result
    }
}

// --- Test Cases ---
let solver = CharSorter()
print("Tree result: \(solver.frequencySort("tree"))") // Expected: "eert" or "eetr"
print("Aabb result: \(solver.frequencySort("Aabb"))") // Expected: "bbAa" or "bbaA"

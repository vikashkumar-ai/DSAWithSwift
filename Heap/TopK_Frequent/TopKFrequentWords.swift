/**
 * Problem: Top K Frequent Words
 * Topic: Heap / TopK_Frequent
 * 
 * Description:
 * Given an array of strings words and an integer k, return the k most 
 * frequent strings. 
 * Return the answer sorted by the frequency from highest to lowest. 
 * Sort the words with the same frequency by their lexicographical order.
 * 
 * Pattern: Frequency Map + Min-Heap. Use a min-heap to keep track 
 * of the top K elements. To maintain the sorting order correctly, 
 * use a special comparator: higher frequency or (if same freq) 
 * lexicographically lower word.
 * 
 * Time Complexity: O(n log k).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    struct WordFreq: Comparable {
        let word: String
        let freq: Int
        
        static func < (lhs: WordFreq, rhs: WordFreq) -> Bool {
            if lhs.freq != rhs.freq {
                return lhs.freq < rhs.freq
            }
            // If frequencies are same, smaller lexicographical word is "greater" 
            // in a min-heap sense if we want to keep it.
            return lhs.word > rhs.word
        }
    }
    
    /**
     * Finds the k most frequent words.
     * - Parameters:
     *   - words: Array of input words.
     *   - k: Selection size.
     * - Returns: Array of top k words.
     */
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var count = [String: Int]()
        for word in words {
            count[word, default: 0] += 1
        }
        
        var heap = [WordFreq]()
        for (word, freq) in count {
            heap.append(WordFreq(word: word, freq: freq))
            heap.sort()
            
            // Maintain heap size k
            if heap.count > k {
                heap.removeFirst()
            }
        }
        
        // Reverse to get descending order
        return heap.sorted(by: >).map { $0.word }
    }
}

// --- Test Cases ---
let sol = Solution()
print("Top 2 frequent words from [\"i\",\"love\",\"leetcode\",\"i\",\"love\",\"coding\"]: \(sol.topKFrequent(["i","love","leetcode","i","love","coding"], 2))")
// Expected: ["i", "love"]
print("Top 4 frequent words from [\"the\",\"day\",\"is\",\"sunny\",\"the\",\"the\",\"the\",\"sunny\",\"is\",\"is\"]: \(sol.topKFrequent(["the","day","is","sunny","the","the","the","sunny","is","is"], 4))")
// Expected: ["the", "is", "sunny", "day"]

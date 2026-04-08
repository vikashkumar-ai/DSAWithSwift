/**
 * Problem: Design AutoComplete System
 * Topic: Trie / AutoSuggest
 * 
 * Description:
 * Design a search autocomplete system for a search engine. Users may 
 * input a sentence (at least one word and end with a special 
 * character '#'). For each character the user types except '#', 
 * you need to return the top 3 historical hot sentences that have 
 * prefix the same as the part of sentence already typed.
 * 
 * Pattern: Maintain a Trie where each node stores a frequency map 
 * of sentences that pass through it. To find the top 3, sort the 
 * sentences by frequency.
 * 
 * Time Complexity: O(L) for each input character where L is length.
 * Space Complexity: O(N * L).
 */

import Foundation

class AutoCompleteSystem {
    class TrieNode {
        var children = [Character: TrieNode]()
        var counts = [String: Int]()
    }
    
    private let root = TrieNode()
    private var currentPrefix = ""
    
    init(_ sentences: [String], _ times: [Int]) {
        for i in 0..<sentences.count {
            addSentence(sentences[i], times[i])
        }
    }
    
    private func addSentence(_ sentence: String, _ count: Int) {
        var curr = root
        for char in sentence {
            if curr.children[char] == nil {
                curr.children[char] = TrieNode()
            }
            curr = curr.children[char]!
            curr.counts[sentence, default: 0] += count
        }
    }
    
    /**
     * Responds to user input character by character.
     */
    func input(_ char: Character) -> [String] {
        if char == "#" {
            addSentence(currentPrefix, 1)
            currentPrefix = ""
            return []
        }
        
        currentPrefix.append(char)
        var curr = root
        for c in currentPrefix {
            guard let next = curr.children[c] else { return [] }
            curr = next
        }
        
        // Sort sentences by frequency (desc) and lexicography (asc)
        let sortedSentences = curr.counts.keys.sorted {
            if curr.counts[$0]! != curr.counts[$1]! {
                return curr.counts[$0]! > curr.counts[$1]!
            }
            return $0 < $1
        }
        
        return Array(sortedSentences.prefix(3))
    }
}

// --- Test Cases ---
let system = AutoCompleteSystem(["i love you", "island", "ironman", "i love leetcode"], [5, 3, 2, 2])
print("Input 'i': \(system.input("i"))")
// Expected: ["i love you", "island", "i love leetcode"] (sorted by freq)
print("Input ' ': \(system.input(" "))")
// Expected: ["i love you", "i love leetcode"]

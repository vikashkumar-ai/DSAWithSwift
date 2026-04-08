/**
 * Problem: Alien Dictionary
 * Topic: Graphs / TopologicalSort / KahnsAlgorithm
 * 
 * Description:
 * There is a new alien language that uses the English alphabet. 
 * However, the order among the letters is unknown to you.
 * You are given a list of strings words from the alien language's 
 * dictionary, where the strings in words are sorted lexicographically 
 * by the rules of this new language.
 * Return a string of the unique letters in the new alien language 
 * sorted in lexicographical increasing order. If there is no solution, 
 * return "".
 * 
 * Pattern: Kahn's Algorithm. Build a directed graph by comparing 
 * adjacent words in the sorted list.
 * 
 * Time Complexity: O(C) where C is the total number of characters 
 * in all words.
 * Space Complexity: O(V + E) where V is number of unique letters 
 * (max 26) and E is number of directed dependencies between letters.
 */

import Foundation

class Solution {
    /**
     * Finds the lexicographical ordering of alien letters.
     * - Parameters:
     *   - words: Lexicographically sorted strings in the alien language.
     * - Returns: A string representing the order of letters.
     */
    func alienOrder(_ words: [String]) -> String {
        var adj = [Character: Set<Character>]()
        var inDegree = [Character: Int]()
        
        // Initialize for every unique character
        for word in words {
            for char in word {
                adj[char] = Set()
                inDegree[char] = 0
            }
        }
        
        // Build the graph by comparing adjacent words
        for i in 0..<words.count - 1 {
            let word1 = Array(words[i])
            let word2 = Array(words[i + 1])
            let len = min(word1.count, word2.count)
            
            // Edge case: "abc", "ab"
            if word1.count > word2.count && String(word1[0..<len]) == String(word2) {
                return ""
            }
            
            for j in 0..<len {
                if word1[j] != word2[j] {
                    if !adj[word1[j]]!.contains(word2[j]) {
                        adj[word1[j]]!.insert(word2[j])
                        inDegree[word2[j]]! += 1
                    }
                    break
                }
            }
        }
        
        // Add nodes with 0 in-degree into queue
        var queue = [Character]()
        for (char, degree) in inDegree {
            if degree == 0 {
                queue.append(char)
            }
        }
        
        var result = ""
        while !queue.isEmpty {
            let current = queue.removeFirst()
            result.append(current)
            
            for neighbor in adj[current]! {
                inDegree[neighbor]! -= 1
                if inDegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }
        
        // If result has all unique letters, a topological sort exists
        return result.count == adj.count ? result : ""
    }
}

// --- Test Cases ---
let sol = Solution()
print("Alien Order for [\"wrt\",\"wrf\",\"er\",\"ett\",\"rftt\"]: \n\(sol.alienOrder(["wrt","wrf","er","ett","rftt"]))") 
// Expected: "wertf"
print("Alien Order for [\"z\",\"x\",\"z\"]: \n\(sol.alienOrder(["z","x","z"]))") 
// Expected: "" (cyclic dependency between z and x)

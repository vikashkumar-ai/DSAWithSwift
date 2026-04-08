/**
 * Problem: Z-Algorithm for Pattern Matching
 * Topic: String / PatternMatching / ZAlgorithm
 * 
 * Description:
 * Given a pattern 'P' and a string 'S', find all occurrences of 
 * P in S in linear time O(m + n).
 * 
 * Pattern: Concatenation (P + $ + S) and Z-Array.
 * 1. Form a new string T = P + "$" + S.
 * 2. Calculate the Z-array for T.
 * 3. Z[i] is the length of common prefix between T[0...n-1] 
 *    and T[i...n-1].
 * 4. If Z[i] == length(P), P occurs in S starting at 
 *    index (i - length(P) - 1).
 * 
 * Time Complexity: O(m + n).
 * Space Complexity: O(m + n).
 */

import Foundation

class ZAlgorithm {
    /**
     * Finds starting indices of all pattern occurrences in S.
     * - Parameters:
     *   - s: Large string.
     *   - p: Pattern.
     * - Returns: List of occurrence indices.
     */
    func search(_ s: String, _ p: String) -> [Int] {
        let concat = p + "$" + s
        let z = calculateZ(concat)
        let pl = p.count
        var result = [Int]()
        
        for i in 0..<z.count {
            if z[i] == pl {
                // Adjust index for original S
                result.append(i - pl - 1)
            }
        }
        
        return result
    }
    
    private func calculateZ(_ s: String) -> [Int] {
        let n = s.count
        let chars = Array(s)
        var z = Array(repeating: 0, count: n)
        var l = 0, r = 0
        
        for i in 1..<n {
            if i <= r {
                // Use previous Z values
                z[i] = min(r - i + 1, z[i - l])
            }
            
            // Further comparison to expand the Z-box
            while i + z[i] < n && chars[z[i]] == chars[i + z[i]] {
                z[i] += 1
            }
            
            // Update Z-box if expanded
            if i + z[i] - 1 > r {
                l = i
                r = i + z[i] - 1
            }
        }
        
        return z
    }
}

// --- Test Cases ---
let solver = ZAlgorithm()
let text = "baabaa", pattern = "aab"
print("Indices of \"aab\" in \"baabaa\": \(solver.search(text, pattern))") 
// Expected: [1]
let text2 = "aaaaa", pattern2 = "aa"
print("Indices of \"aa\" in \"aaaaa\": \(solver.search(text2, pattern2))") 
// Expected: [0, 1, 2, 3]

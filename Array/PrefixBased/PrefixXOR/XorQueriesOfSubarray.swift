/**
 * Problem: XOR Queries of a Subarray (Prefix XOR)
 * Topic: Array / PrefixBased / PrefixXOR
 * 
 * Description:
 * You are given an array arr of positive integers and an array queries 
 * where queries[i] = [left_i, right_i]. 
 * For each query, compute the XOR of elements from left_i to right_i. 
 * Return an array containing the results of the queries.
 * 
 * Pattern: Prefix XOR. The XOR sum of range [L, R] can be computed 
 * in O(1) as prefixXor[R+1] ^ prefixXor[L].
 * 
 * Time Complexity: O(n + q).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    /**
     * Responds to XOR range queries.
     * - Parameters:
     *   - arr: Source integer array.
     *   - queries: Array of [L, R] queries.
     * - Returns: Array of results.
     */
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var prefixXor = Array(repeating: 0, count: arr.count + 1)
        for i in 0..<arr.count {
            prefixXor[i + 1] = prefixXor[i] ^ arr[i]
        }
        
        var result = [Int]()
        for q in queries {
            result.append(prefixXor[q[1] + 1] ^ prefixXor[q[0]])
        }
        
        return result
    }
}

// --- Test Cases ---
let sol = Solution()
print("XOR Queries for [1,3,4,8] with [[0,1],[1,2],[0,3],[3,3]]: \(sol.xorQueries([1,3,4,8], [[0,1],[1,2],[0,3],[3,3]]))") 
// Expected: [2, 7, 14, 8]

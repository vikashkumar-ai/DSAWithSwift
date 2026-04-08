/**
 * Problem: Range XOR Queries (Prefix XOR Variant)
 * Topic: Bit Manipulation / Usage / PrefixXOR
 * 
 * Description:
 * Given an array and multiple range queries [L, R], find the XOR 
 * of the elements in the range [L, R].
 * 
 * Pattern: Prefix XOR. Precompute prefix XORs in O(N). 
 * XOR(L, R) = prefixXor[R] ^ prefixXor[L-1].
 * 
 * Time Complexity: O(N) precomputation, O(1) query.
 * Space Complexity: O(N).
 */

import Foundation

class RangeXorQuery {
    private var prefixXor: [Int]
    
    init(_ arr: [Int]) {
        self.prefixXor = Array(repeating: 0, count: arr.count + 1)
        for i in 0..<arr.count {
            prefixXor[i + 1] = prefixXor[i] ^ arr[i]
        }
    }
    
    /**
     * Returns the XOR of elements in range [l, r] (0-indexed).
     */
    func query(_ l: Int, _ r: Int) -> Int {
        return prefixXor[r + 1] ^ prefixXor[l]
    }
}

// --- Test Cases ---
let rxq = RangeXorQuery([1, 3, 4, 8])
print("XOR for [0, 1]: \(rxq.query(0, 1))") // Expected: 1 ^ 3 = 2
print("XOR for [1, 2]: \(rxq.query(1, 2))") // Expected: 3 ^ 4 = 7
print("XOR for [0, 3]: \(rxq.query(0, 3))") // Expected: 1 ^ 3 ^ 4 ^ 8 = 14

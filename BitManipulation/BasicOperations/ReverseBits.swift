/**
 * Problem: Reverse Bits
 * Topic: Bit Manipulation / Basic Operations
 * 
 * Description:
 * Reverse bits of a given 32 bits unsigned integer.
 * 
 * Pattern: Iterate through all 32 bits. For each bit, shift the 
 * result left and add the rightmost bit of the input.
 * 
 * Time Complexity: O(1) as we always iterate 32 times.
 * Space Complexity: O(1).
 */

import Foundation

class Solution {
    /**
     * Reverses the bits of a 32-bit unsigned integer.
     * - Parameters:
     *   - n: The input integer.
     * - Returns: The reversed integer.
     */
    func reverseBits(_ n: UInt32) -> UInt32 {
        var res: UInt32 = 0
        var num = n
        
        for _ in 0..<32 {
            // Shift result left to make space for the new bit
            res = (res << 1)
            // Add the last bit of num to result
            res = res | (num & 1)
            // Shift num right to process the next bit
            num = (num >> 1)
        }
        
        return res
    }
}

// --- Test Cases ---
let sol = Solution()
let input: UInt32 = 43261596 // Binary: 00000010100101000001111010011100
let reversed = sol.reverseBits(input)
print("Reversed bits of \(input): \(reversed)") 
// Expected: 964176192 (Binary: 00111001011110000010100101000000)

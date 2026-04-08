/**
 * Problem: Huffman Decoding
 * Topic: Heap / GreedyHeap / HuffmanEncoding
 * 
 * Description:
 * Given a Huffman coded string and the root of the Huffman tree, 
 * decode the string.
 * 
 * Pattern: Tree Traversal. Start from the root and for each bit 
 * in the encoded string, move to the left (0) or right (1) child. 
 * When a leaf node is reached, append its character to the result 
 * and return to the root.
 * 
 * Time Complexity: O(n) where n is length of encoded string.
 * Space Complexity: O(n).
 */

import Foundation

class HuffmanNode {
    var char: Character?
    var left: HuffmanNode?
    var right: HuffmanNode?
    
    init(_ char: Character? = nil) {
        self.char = char
        self.left = nil
        self.right = nil
    }
}

class Decoder {
    /**
     * Decodes a binary string using a Huffman tree.
     * - Parameters:
     *   - encoded: The binary string of 0s and 1s.
     *   - root: The root of the Huffman tree.
     * - Returns: The decoded plain string.
     */
    func decode(_ encoded: String, _ root: HuffmanNode?) -> String {
        guard let root = root else { return "" }
        
        var result = ""
        var curr = root
        for bit in encoded {
            if bit == "0" {
                curr = curr.left!
            } else {
                curr = curr.right!
            }
            
            // If leaf node
            if let char = curr.char {
                result.append(char)
                curr = root // Reset to start next character
            }
        }
        
        return result
    }
}

// --- Test Cases ---
let nodeA = HuffmanNode("a")
let nodeB = HuffmanNode("b")
let root = HuffmanNode()
root.left = nodeA
root.right = nodeB

let decoder = Decoder()
print("Decoded \"010\": \(decoder.decode("010", root))") // Expected: "aba"

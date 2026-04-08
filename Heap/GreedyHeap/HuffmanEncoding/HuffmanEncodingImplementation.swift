/**
 * Problem: Huffman Encoding (using Min-Heap)
 * Topic: Heap / GreedyHeap / HuffmanEncoding
 * 
 * Description:
 * Huffman coding is a lossless data compression algorithm. The 
 * idea is to assign variable-length codes to input characters, 
 * with shorter codes assigned to more frequent characters.
 * 
 * Pattern: Binary Tree + Min-Heap. Build a Huffman tree by 
 * repeatedly merging the two nodes with the lowest frequencies.
 * 
 * Time Complexity: O(n log n) where n is number of unique characters.
 * Space Complexity: O(n).
 */

import Foundation

class HuffmanNode: Comparable {
    var char: Character?
    var freq: Int
    var left: HuffmanNode?
    var right: HuffmanNode?
    
    init(_ char: Character?, _ freq: Int) {
        self.char = char
        self.freq = freq
    }
    
    static func < (lhs: HuffmanNode, rhs: HuffmanNode) -> Bool {
        return lhs.freq < rhs.freq
    }
    
    static func == (lhs: HuffmanNode, rhs: HuffmanNode) -> Bool {
        return lhs.freq == rhs.freq
    }
}

class HuffmanEncoding {
    /**
     * Generates Huffman codes for a string.
     * - Parameters:
     *   - text: The input string to encode.
     * - Returns: A dictionary mapping characters to their Huffman codes.
     */
    func buildHuffmanCodes(_ text: String) -> [Character: String] {
        var freqMap = [Character: Int]()
        for char in text {
            freqMap[char, default: 0] += 1
        }
        
        // Priority Queue of Huffman nodes (Min-Heap simulation)
        var heap = freqMap.map { HuffmanNode($0.key, $0.value) }
        heap.sort()
        
        while heap.count > 1 {
            // Pick two nodes with lowest frequency
            let left = heap.removeFirst()
            let right = heap.removeFirst()
            
            // Create a internal node with combined frequency
            let parent = HuffmanNode(nil, left.freq + right.freq)
            parent.left = left
            parent.right = right
            
            // Re-insert into heap
            heap.append(parent)
            heap.sort()
        }
        
        let root = heap.first
        var codes = [Character: String]()
        generateCodes(root, "", &codes)
        return codes
    }
    
    private func generateCodes(_ node: HuffmanNode?, _ currentCode: String, _ codes: inout [Character: String]) {
        guard let node = node else { return }
        
        if let char = node.char {
            codes[char] = currentCode
            return
        }
        
        generateCodes(node.left, currentCode + "0", &codes)
        generateCodes(node.right, currentCode + "1", &codes)
    }
}

// --- Test Cases ---
let huffman = HuffmanEncoding()
let text = "huffman encoding example"
let codes = huffman.buildHuffmanCodes(text)
print("Huffman Codes: \(codes)")

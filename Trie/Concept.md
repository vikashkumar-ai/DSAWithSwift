# Trie (Prefix Tree)

A Trie, or Prefix Tree, is an efficient information retrieval data structure. It is a multi-way tree structure useful for storing strings over a specific alphabet.

## Key Properties
- Every node except the root represents a character of a string.
- All descendants of a node have a common prefix of the string associated with that node.
- Each node can have multiple children (typically 26 for English lowercase letters).

## Common Patterns

1. **Prefix Search**: Checking if a string starts with a given prefix in $O(L)$ time, where $L$ is the prefix length.
2. **Auto-Suggest**: Finding all strings in the trie that match a partial input.
3. **XOR Problems**: Using a binary trie (storing bits 0 and 1) to find the maximum XOR of two numbers in $O(\text{bits} \cdot n)$ time.
4. **Word Correction**: Searching for words with specific wildcards or "errors".

## Node Structure in Swift
```swift
class TrieNode {
    var children = [Character: TrieNode]()
    var isEndOfWord = false
}
```
Tries are particularly useful when you need to perform many prefix queries or search for words sharing a common vocabulary.

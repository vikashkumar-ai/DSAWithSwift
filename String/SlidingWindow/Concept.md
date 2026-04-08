# String Sliding Window

The Sliding Window pattern is extensively used in string problems to find substrings that satisfy certain criteria. In strings, we often use frequency maps or arrays to keep track of the characters within the window.

## Key Techniques

1. **Fixed Size Window**: Useful for anagram detection or finding all occurrences of a pattern of fixed length.
2. **Variable Size Window**: Used to find the longest or shortest substring with specific properties (e.g., no repeats, containing all target characters).

## Data Structures for Window State
- **Dictionary/Hash Map**: `[Character: Int]` to store frequencies.
- **Fixed-size Array**: `[Int](repeating: 0, count: 256)` or `Array(repeating: 0, count: 26)` for ASCII or lowercase letters.
- **Set**: `Set<Character>` to track unique characters in the window.

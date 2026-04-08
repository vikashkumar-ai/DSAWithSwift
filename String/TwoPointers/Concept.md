# String Two Pointers

The Two Pointer technique in strings is similar to arrays but often involves handling non-alphanumeric characters, whitespace, and character manipulations.

## Common Variants

1. **Opposite Ends**: Starting pointers at the beginning and end of the string, moving towards each other.
   - Example: Palindrome check, reversing a string.
2. **Same Direction (Slow/Fast)**: Both pointers moving from start to end, with one pointer (slow) typically marking a boundary or current state.
   - Example: String compression, removing characters.
3. **Word-based Manipulation**: Handling strings as collections of words, often requiring multiple passes or reversing the whole string then each word.

## General Steps
1. Convert the string to a character array `Array(s)` for efficient O(1) index-based access, as Swift strings are not O(1) subscriptable.
2. Initialize pointers.
3. Iterate and perform operations.
4. Join the character array back to a string `String(chars)`.

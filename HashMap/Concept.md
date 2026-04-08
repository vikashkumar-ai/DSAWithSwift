# HashMap (Dictionaries in Swift)

A HashMap, or `Dictionary` in Swift, is a collection of key-value pairs where each key is unique. Dictionaries provide constant-time $O(1)$ average performance for lookups, insertions, and deletions, making them extremely powerful for solving many DSA problems.

## Common Patterns

1. **Frequency Based**: Counting occurrences of elements (e.g., character frequency in a string).
2. **Lookup Based**: Using the map to find if a complement or a previous element exists.
   - Example: Two Sum.
3. **Set Based**: Using `Set` (a hash-based collection of unique elements) for membership testing.
4. **Index Mapping**: Storing the index of each element to handle queries about positions.
5. **Grouping Pattern**: Using a property of elements as a key to group them together.
   - Example: Group Anagrams.

## General Steps
1. Initialize an empty dictionary: `var map = [KeyType: ValueType]()`.
2. Iterate through the data structure.
3. Perform lookups using `map[key]`.
4. Update values using `map[key] = newValue` or `map[key, default: 0] += 1`.
5. Keep in mind that Dictionary lookups return an optional, so you must handle them safely.

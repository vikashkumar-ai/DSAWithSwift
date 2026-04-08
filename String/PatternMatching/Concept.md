# String Pattern Matching Algorithms

Pattern matching is the process of finding occurrences of a pattern string $P$ in a text string $T$. Standard algorithms range from simple $O(m \cdot n)$ brute force to efficient linear time $O(m + n)$ approaches.

## Common Algorithms

1. **KMP (Knuth-Morris-Pratt)**: Uses a prefix function (LPS - Longest Proper Prefix which is also Suffix) to skip unnecessary comparisons.
   - Time Complexity: $O(m + n)$.
2. **Rabin-Karp**: Uses rolling hashes to search for patterns. Efficient for multiple pattern matches.
   - Time Complexity: $O(m + n)$ average case.
3. **Z-Algorithm**: Computes a $Z$-array where $Z[i]$ is the length of the longest common prefix between $S[i...n-1]$ and $S[0...n-1]$.
   - Time Complexity: $O(m + n)$.

## General Steps
- Pre-calculate an auxiliary array (LPS array for KMP, Z-array for Z-Algorithm).
- Iterate through the text match characters with the pattern.
- Use the auxiliary array to shift the pattern efficiently upon mismatch.

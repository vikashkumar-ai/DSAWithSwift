# Prefix Based Techniques

The Prefix Based technique involves pre-calculating sums (or other associative operations like XOR) for all prefixes of an array. This allows for constant time O(1) queries for range-based calculations.

## Common Variants

1. **Prefix Sum**: Pre-calculate `P[i] = arr[0] + arr[1] + ... + arr[i]`.
   - Range sum from `i` to `j`: `Sum(i, j) = P[j] - P[i-1]`.
2. **Prefix XOR**: Similar to prefix sum, but using the XOR operation.
   - Range XOR from `i` to `j`: `XorSum(i, j) = P[j] ^ P[i-1]`.
3. **2D Prefix Sum**: Used for calculations on grids/matrices.
   - Submatrix sum from `(r1, c1)` to `(r2, c2)`.

## General Steps
1. Create a prefix array of size `n` or `n + 1`.
2. Fill the prefix array: `P[i] = P[i-1] + arr[i]`.
3. Answer queries using the prefix array.

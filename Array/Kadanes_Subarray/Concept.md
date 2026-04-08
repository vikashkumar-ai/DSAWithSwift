# Kadane's Algorithm and Subarray Patterns

The Kadane's Algorithm is a dynamic programming approach to find the maximum sum of a contiguous subarray in O(n) time. It uses the idea that the maximum sum at a certain position is either the element at that position or the sum of that element and the maximum sum at the previous position.

## Common Variants

1. **Max Subarray Sum (Kadane's)**: Find the maximum sum of a contiguous subarray.
   - `currentSum = max(num, currentSum + num)`
   - `maxSum = max(maxSum, currentSum)`
2. **Max Product Subarray**: Find the maximum product of a contiguous subarray.
   - Requires tracking both `maxProduct` and `minProduct` due to negative numbers.
3. **Subarray with Given XOR/Sum**: Often solved with prefix sums and hash maps.

## General Steps (Kadane's)
1. Initialize `currentSum` and `maxSum` at the start.
2. Iterate through the array.
3. Update `currentSum` at each step.
4. Update `maxSum` with the maximum of its current value and `currentSum`.

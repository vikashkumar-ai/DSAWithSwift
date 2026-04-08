# Sliding Window Pattern

The Sliding Window pattern is used to perform a required operation on a specific window size of a given array or linked list, such as finding the longest subarray containing all 1s. Sliding windows start from the 1st element and keep shifting right by one element and adjust the length of the window according to the problem that you are solving. In some cases, the window size remains constant and in other cases the sizes grows or shrinks.

## Types of Sliding Window

1. **Fixed Size**: The window size `k` is constant.
2. **Variable Size**: The window size changes based on a condition (e.g., sum <= target).

## General Steps (Fixed Size)
1. Initialize two pointers `i` and `j` at the start.
2. Move `j` until the window size `j - i + 1` reaches `k`.
3. Once the window size is hit, perform the required calculation.
4. Slide the window by incrementing both `i` and `j` while maintaining the window size.

## General Steps (Variable Size)
1. Initialize `i` and `j` at the start.
2. Move `j` to expand the window and add elements to the current calculation.
3. If the window condition is violated, increment `i` to shrink the window until the condition is met again.
4. Keep track of the maximum or minimum window size encountered.

# Two Pointer Technique

The Two Pointer technique is a common pattern for solving problems involving arrays or strings. It involves using two pointers to iterate through the data structures simultaneously, which can often reduce time complexity from O(n²) to O(n).

## Common Variants

1. **Opposite Ends**: Pointers start at opposite ends of the array and move towards each other.
   - Example: Two Sum on a sorted array, Palindrome Check.
2. **Same Direction**: Both pointers start at the same end and move in the same direction, typically at different speeds or relative to each other's progress.
   - Example: Slow and Fast pointer (Cycle detection), remove duplicates, move zeroes.
3. **Partition (Dutch National Flag)**: Three or more pointers used to partition elements into different groups.
   - Example: Sort Colors (0s, 1s, and 2s).

## General Steps (Opposite Ends)
1. Sort the array (if required).
2. Initialize `left` at 0 and `right` at `count - 1`.
3. While `left < right`:
   - Perform condition check.
   - Increment `left` or decrement `right` based on the check.

## General Steps (Same Direction)
1. Initialize `slow` at 0 and `fast` at 0.
2. Iterate `fast` through the array.
3. Update `slow` when a certain condition is met at `fast`.

# Binary Search on Array

Binary Search is an efficient algorithm for finding an item from a sorted list of items. It works by repeatedly dividing in half the portion of the list that could contain the item, until you've narrowed down the possible locations to just one.

## Common Variants

1. **On Index**: Directly searching for a specific value or property in a sorted array using its indices.
   - Example: Find a number, search in a rotated sorted array.
2. **On Answer**: When the answer lies within a specific range, and we perform binary search on that range to find the optimal result.
   - Example: Allocation of minimum pages, Aggressive Cows, koko eating bananas.

## General Steps
1. Sort the input if it's not already sorted (for On Index).
2. Define the search range `low` and `high`.
3. While `low <= high`:
   - Calculate `mid = low + (high - low) / 2`.
   - If `arr[mid] == target`, item found.
   - If `arr[mid] < target`, search in the right half (`low = mid + 1`).
   - If `arr[mid] > target`, search in the left half (`high = mid - 1`).

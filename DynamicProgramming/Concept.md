# Dynamic Programming (DP)

Dynamic Programming is an optimization technique used to solve complex problems by breaking them down into simpler subproblems. It is applicable when the problem has **Optimal Substructure** (the solution to the main problem can be constructed from solutions to its subproblems) and **Overlapping Subproblems** (the same subproblems are solved multiple times).

## Core Approaches

1. **Top-Down (Memoization)**: Solving the problem recursively and storing the results of subproblems in a cache (like a hash map or array) to avoid redundant computations.
2. **Bottom-Up (Tabulation)**: Solving subproblems first and using their results to solve larger subproblems, typically using a 1D or 2D table.

## Common Patterns

1. **1D DP**: Subproblems depend on one state variable (e.g., `dp[i]`).
   - Example: Climbing Stairs, House Robber.
2. **2D DP**: Subproblems depend on two state variables (e.g., `dp[i][j]`).
   - Example: Unique Paths, Longest Increasing Path.
3. **Knapsack Pattern**: Deciding whether to include an item and updating the state based on remaining capacity.
   - Example: Partition Equal Subset Sum, Coin Change.
4. **LCS (Longest Common Subsequence)**: Comparing two strings or sequences.
5. **LIS (Longest Increasing Subsequence)**: Finding the longest subsequence in a single sequence that is sorted.
6. **MCM (Matrix Chain Multiplication)**: Solving problems by partitioning the input at various points.

## General Steps
1. **Define the state**: What does `dp[i]` represent?
2. **Recurrence Relation**: How to calculate `dp[i]` using previous states?
3. **Base Case**: What are the initial known values?
4. **Optimization**: Space complexity reduction (e.g., using two variables instead of a 1D array).

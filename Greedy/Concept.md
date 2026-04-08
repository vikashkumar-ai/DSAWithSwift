# Greedy Algorithms

A greedy algorithm is an approach that builds up a solution piece by piece, always choosing the next piece that offers the most immediate benefit. It is based on the idea of making locally optimal choices at each step with the hope of finding a global optimum.

## Characteristics
- **Greedy Choice Property**: A global optimum can be arrived at by choosing a local optimum.
- **Optimal Substructure**: An optimal solution to the problem contains optimal solutions to subproblems.

## Common Patterns

1. **Activity Selection**: Selecting the maximum number of non-overlapping activities. Sort by finish times.
2. **Fractional Knapsack**: Unlike 0/1 Knapsack, you can take fractions of items. Sort by value/weight ratio.
3. **Job Scheduling**: Scheduling jobs to maximize profit given deadlines and constraints. Sort by profit or deadlines.
4. **Interval Scheduling**: Handling ranges or durations optimally. Sort by start or end times.

## General Steps
1. Sort the input data based on a greedy criterion (e.g., finish time, profit, ratio).
2. Iterate through the sorted data.
3. Make the locally optimal choice at each step if it satisfies the problem constraints.

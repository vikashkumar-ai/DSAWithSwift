# Job Scheduling Problems

Job scheduling is a category of problems where we need to assign or sequence jobs to maximize profit, minimize time, or meet specific deadlines.

## Job Sequencing with Deadlines

In this problem, each job has a deadline and a profit. We earn the profit only if the job is completed by its deadline. 
-   **Greedy Choice**: Always pick the job that offers the maximum profit.
-   **Strategy**: Sort jobs by profit. For each job, try to find the latest possible time slot (1 up to its deadline) to perform it.

## Weighted Job Scheduling

Each job has a start time, end time, and a profit. Any two selected jobs cannot overlap.
-   **Strategy**: Sort jobs by end time. Use Dynamic Programming and Binary Search. For each job, find the latest job that doesn't overlap with it.

## Complexity

-   **Sequencing with Deadlines**: $O(n \log n)$ for sorting and $O(n^2)$ for slot filling (or $O(n \log n)$ with DSU optimization).
-   **Weighted Job Scheduling**: $O(n \log n)$.

## Variations

-   **Fractional Job Scheduling**: Jobs can be partially completed (like the Fractional Knapsack).
-   **Parallel Job Scheduling**: Multiple machines/processors available.

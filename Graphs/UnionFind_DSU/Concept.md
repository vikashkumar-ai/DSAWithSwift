# Disjoint Set Union (DSU)

The Disjoint Set Union (DSU) or Union-Find data structure is a classic tool for managing and merging disjoint sets of elements. It is particularly useful for tracking connected components in a graph.

## Core Operations

1.  **Find**: Determine which set a particular element belongs to. Usually returns a "representative" or "root" of the set.
2.  **Union**: Merge two disjoint sets into a single set.

## Optimizations

To keep the tree structure flat and efficient:
-   **Path Compression (Find)**: During the find operation, make every node on the path point directly to the root.
-   **Union by Rank/Size**: Always attach the smaller tree under the root of the larger tree to prevent the tree from becoming skewed.

## Complexity

-   **Time Complexity**: $O(\alpha(n))$ for both Find and Union operations, where $\alpha(n)$ is the Inverse Ackermann function. In practice, $\alpha(n)$ is nearly constant ($< 5$) even for astronomical values of $n$.
-   **Space Complexity**: $O(n)$ to store the parent and rank/size arrays.

## Common Use Cases

1.  **Cycle Detection**: Detecting cycles in undirected graphs (used in Kruskal's).
2.  **Connected Components**: Counting or managing components dynamically.
3.  **Redundant Connectivity**: Finding edges that can be removed while maintaining connectivity.
4.  **Kruskal's Algorithm**: Efficiently managing MST building.

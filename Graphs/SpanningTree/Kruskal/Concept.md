# Kruskal's Algorithm

Kruskal's algorithm is a greedy algorithm that finds a Minimum Spanning Tree (MST) for a connected weighted graph. It finds a subset of the edges that forms a tree that includes every vertex, where the total weight of all the edges in the tree is minimized.

## Core Logic

1.  **Sort Edges**: Sort all the edges in the graph in non-decreasing order of their weight.
2.  **Greedy Selection**: Pick the smallest edge. Check if it forms a cycle with the spanning tree formed so far.
3.  **Union-Find**: Use a Disjoint Set Union (DSU) data structure to efficiently check for cycles and merge components.
    -   If the edge doesn't form a cycle, include this edge in the MST.
    -   Repeat until there are $(V-1)$ edges in the spanning tree.

## Complexity

-   **Time Complexity**: $O(E \log E)$ or $O(E \log V)$ for sorting edges. Union-Find operations are almost constant time $O(E \cdot \alpha(V))$.
-   **Space Complexity**: $O(V + E)$ to store the graph and DSU structures.

## When to Use

-   When the graph is **sparse** (fewer edges).
-   When edges are already sorted or easy to sort.
-   Works well with edge-list representations.

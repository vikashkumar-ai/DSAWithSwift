# Prim's Algorithm

Prim's algorithm is a greedy algorithm that finds a Minimum Spanning Tree (MST) for a weighted undirected graph. It starts from an arbitrary node and grows the MST one edge at a time by picking the cheapest edge that connects a vertex in the tree to a vertex outside the tree.

## Core Logic

1.  **Arbitrary Start**: Choose any vertex to start with.
2.  **Priority Queue**: Mantain a set of edges that connect the current MST to non-MST vertices. Use a priority queue (Min-Heap) to pick the edge with the minimum weight.
3.  **Expansion**: If the chosen edge leads to a vertex already in the MST, discard it. Otherwise, add the vertex and its outgoing edges to the priority queue.
4.  **Completion**: Repeat until all vertices are included in the MST.

## Complexity

-   **Time Complexity**: $O(E \log V)$ with a binary heap or $O(E + V \log V)$ with a Fibonacci heap. $O(E \log E)$ for most common implementations.
-   **Space Complexity**: $O(V + E)$ to store the adjacency list and priority queue.

## When to Use

-   When the graph is **dense** (many edges).
-   When working with an adjacency list representation.
-   More efficient than Kruskal's for dense graphs $E \approx V^2$.

# Connected Components in Graphs

A connected component of an undirected graph is a subgraph in which any two vertices are connected to each other by paths, and which is connected to no additional vertices in the supergraph.

## Common Strategies

1.  **DFS (Search)**: Start a DFS from an unvisited vertex. Mark all reachable vertices as visited. Each DFS start represents a new connected component.
2.  **BFS (Search)**: Similar to DFS, but using a queue. Useful when shortest path distance within a component is needed.
3.  **Union-Find (DSU)**: Treat each vertex as a separate set. For each edge, union the sets containing its endpoints. The final number of disjoint sets is the number of connected components.

## Grid Problems (Matrix as Graph)

In grid problems, each cell $(r, c)$ can be treated as a vertex, and its 4 (up, down, left, right) or 8 neighbors can be treated as edges.
-   **Islands**: A common metaphor for connected components in a grid.
-   **Flood Fill**: Changing the color/state of a connected component starting from a single pixel.

## Complexity

-   **Search (DFS/BFS)**: $O(V + E)$ or $O(R \cdot C)$ for grids.
-   **Union-Find**: $O(E \alpha(V))$.

## Key Problems

-   **Number of Islands**: Count the total number of connected components.
-   **Max Area of Island**: Size of the largest connected component.
-   **Flood Fill**: Traverse and modify a single connected component.
-   **Surrounded Regions**: Capturing components not connected to the boundary.

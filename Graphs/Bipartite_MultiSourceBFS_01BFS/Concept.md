# Advanced BFS Variants

This topic covers specialized Breadth-First Search (BFS) patterns used to solve problems requiring bipartite checking, multi-source expansion, or edge-weight specific shortest paths.

## Bipartite Graphs

A Bipartite Graph is a graph whose vertices can be divided into two disjoint sets $U$ and $V$ such that every edge connects a vertex in $U$ to one in $V$. 
-   **BFS Check**: Color the start node with color 0. Assign the opposite color to all its neighbors. If we find a neighbor already colored with the same color as the current node, the graph is not bipartite.
-   **Note**: A graph is bipartite if and only if it contains no odd-length cycles.

## Multi-Source BFS

Instead of starting BFS from a single node, we start from multiple sources simultaneously. 
-   **Core Logic**: Add all source nodes to the queue initially with distance 0. The BFS then expands outward from all these points layer by layer.
-   **Use Cases**: Closest distance to any source, virus spreading, rotting oranges, etc.

## 0-1 BFS

0-1 BFS is used to find the shortest path in a graph where edge weights are either 0 or 1.
-   **Core Logic**: Instead of a simple Queue, use a **Deque**.
    -   If the edge weight is 0, add to the **front** of the deque.
    -   If the edge weight is 1, add to the **back** of the deque.
-   **Optimization**: This maintains the sorted property of the deque, allowing for $O(V+E)$ shortest outcomes without a full priority queue (like Dijkstra).

# Topological Sort (DFS Approach)

Topological Sort for a Directed Acyclic Graph (DAG) is a linear ordering of vertices such that for every directed edge $uv$, vertex $u$ comes before $v$ in the ordering.

## Core Logic (DFS)

The DFS-based topological sort relies on the post-order traversal of the graph.
1.  **Mark Visited**: Start a DFS from each unvisited vertex.
2.  **Recurse**: Visit all unvisited neighbors.
3.  **Push to Stack**: Once all neighbors are explored, push the current vertex onto a stack. This happens during the *backtracking* phase (exit of the recursive call).
4.  **Finalize**: The result is the stack in reversed order (or by popping until empty).

## Cycle Detection

Unlike Kahn's algorithm (BFS), standard DFS-based topological sort needs a explicit check for cycles (using a "recursion stack" set). If a cycle is detected, topological ordering is impossible.

## Complexity

-   **Time Complexity**: $O(V + E)$.
-   **Space Complexity**: $O(V + E)$ for adjacency list and $O(V)$ for visited/recursion tracking.

## When to Use

-   When working with recursion or naturally deep graphs.
-   When only a single valid ordering is needed.
-   Works well with adjacency list representations.

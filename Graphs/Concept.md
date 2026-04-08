# Graph Data Structure

A Graph is a non-linear data structure consisting of nodes (vertices) and edges that connect these nodes. Graphs can be directed/undirected, weighted/unweighted, and cyclic/acyclic.

## Common Representations
1. **Adjacency Matrix**: A 2D array where `matrix[i][j] = 1` indicates an edge between node $i$ and node $j$.
2. **Adjacency List**: An array of lists (or dictionaries) where each index represents a node and contains a list of its neighbors.

## Common Patterns

1. **Traversal**:
   - **DFS**: Exploring as far as possible along each branch before backtracking.
   - **BFS**: Exploring neighbors level by level. Used for finding shortest path in unweighted graphs.
2. **Cycle Detection**: Using DFS (recursion stack) or BFS (Kahn's algorithm) to find if a cycle exists.
3. **Topological Sort**: A linear ordering of vertices such that for every directed edge $uv$, vertex $u$ comes before $v$.
4. **Shortest Path**: Finding the shortest distance between nodes.
   - **Dijkstra's**: Weighted graphs with non-negative edges.
   - **Bellman-Ford**: Weighted graphs with negative edges.
5. **MST (Minimum Spanning Tree)**: Connecting all vertices with minimum edge weight.
   - **Prim's** and **Kruskal's** algorithms.
6. **DSU (Disjoint Set Union)**: Efficiently tracking and merging connected components.

## Implementation in Swift
```swift
// Adjacency List using Dictionary
var adjList = [Int: [Int]]()
```
For graph problems, typically you'll first build the adjacency list from an input like an edge list.

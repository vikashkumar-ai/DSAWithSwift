# Recursion and Backtracking

Recursion is a programming technique where a function calls itself to solve a smaller version of the same problem. Backtracking is an algorithmic technique for solving problems recursively by trying to build a solution incrementally, one piece at a time, and removing those solutions that fail to satisfy the constraints of the problem at any point in time.

## Key Concepts

1. **Backtracking (Exploration)**: Systematic way to iterate through all possible configurations of a search space.
   - **Decision Tree**: Visualizing the choices made at each step as a tree.
   - **Choose-Explore-Unchoose**: The standard template for backtracking.
2. **Pruning**: Cutting off branches of the search space that cannot lead to a valid solution.
3. **Divide and Conquer**: Breaking a problem into non-overlapping subproblems, solving them recursively, and combining the results.
   - Example: Merge Sort, Quick Select.

## Backtracking Template
```swift
func backtrack(_ currentState: State, _ choices: [Choice]) {
    if isSolution(currentState) {
        processSolution(currentState)
        return
    }
    
    for choice in choices {
        if isValid(choice, currentState) {
            // Choose
            makeChoice(choice, &currentState)
            
            // Explore
            backtrack(currentState, choices)
            
            // Unchoose (Backtrack)
            undoChoice(choice, &currentState)
        }
    }
}
```
In Swift, ensure you are careful with value types vs reference types when modifying the state.

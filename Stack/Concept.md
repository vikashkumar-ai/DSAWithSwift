# Stack (LIFO)

A stack is a linear data structure that follows the Last-In-First-Out (LIFO) principle. In Swift, we can implement a stack easily using an `Array` with `append` for push and `popLast` for pop.

## Common Patterns

1. **Monotonic Stack**: A stack that maintains its elements in non-increasing or non-decreasing order. Used to find next/previous greater/smaller elements in $O(n)$ time.
   - **Decreasing Stack**: Elements go from larger to smaller. Used for Next Greater Element.
   - **Increasing Stack**: Elements go from smaller to larger. Used for Next Smaller Element.
2. **Nearest Element**: Finding the first element to the left or right that satisfies a condition.
3. **Range/Span**: Using a monotonic stack to determine how many consecutive elements are smaller or larger than the current.
4. **Min/Max Stack**: A stack that keeps track of the current minimum or maximum at each level.
5. **Expression Handling**: Using a stack to evaluate postfix/prefix expressions or to validate parenthesis balance.
6. **Histogram Pattern**: Finding largest rectangle under a curve, typically solved using a monotonic stack.

## General Steps
1. Initialize an empty stack: `var stack = [Int]()`.
2. Push: `stack.append(element)`.
3. Pop: `stack.popLast()`.
4. Peak: `stack.last`.

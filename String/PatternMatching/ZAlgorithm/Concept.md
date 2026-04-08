# Z-Algorithm for Pattern Matching

The Z-algorithm is a linear time string matching algorithm which finds all occurrences of a pattern $P$ in a string $S$. It relies on the Z-array.

## The Z-Array

For a string $K$, the Z-array $Z$ is an array of size $n$ where $Z[i]$ is the length of the longest common prefix between $K[i \dots n-1]$ and $K[0 \dots n-1]$.
-   $Z[i]$ = Length of the longest substring starting from $i$ which is also a prefix of $K$.

## Core Logic (Linear Construction)

The algorithm maintains a **Z-box** $[L, R]$, which is the rightmost interval such that $K[L \dots R]$ is a prefix of $K$.
1.  **If $i > R$**: Start a new comparison and update $L, R$.
2.  **If $i \le R$**: Use previous values.
    -   Let $k = i - L$.
    -   If $Z[k] < R - i + 1$: Then $Z[i] = Z[k]$ (remains inside the box).
    -   If $Z[k] \ge R - i + 1$: Then $Z[i]$ is at least $R - i + 1$. Compare characters starting from $R+1$ and update $L, R$.

## Complexity

-   **Time Complexity**: $O(m + n)$. The pointers $L$ and $R$ only move to the right.
-   **Space Complexity**: $O(m + n)$ to store the concatenated string and Z-array.

## Applications

-   Finding all occurrences of a pattern $P$ in $S$. Construct $P + \$ + S$ and check indices with $Z[i] = |P|$.
-   Checking if a string is a cyclic rotation of another.
-   Finding the longest prefix of $S$ that is also a suffix.

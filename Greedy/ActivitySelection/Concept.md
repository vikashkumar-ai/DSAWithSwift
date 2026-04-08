# Activity Selection Problem

The Activity Selection problem is a mathematical problem which concerns the selection of non-conflicting activities that need to be executed by a single person or machine, which can execute only one activity at a time. 

## Greedy Choice Property

The core idea is to always pick the next activity that **finishes the earliest**. This leaves as much time as possible for the remaining activities.

## Core Logic

1.  **Sort by Finish Time**: Sort all the given activities according to their finish time in non-decreasing order.
2.  **Greedy Selection**: Select the first activity from the sorted list.
3.  **Iteration**: For the remaining activities, if the start time of the activity is greater than or equal to the finish time of the previously selected activity, then select it.

## Complexity

-   **Time Complexity**: $O(n \log n)$ for sorting. The selection process is $O(n)$.
-   **Space Complexity**: $O(n)$ if we create a separate list to store activity objects, or $O(1)$ if we sort in place.

## Applications

-   Scheduling meetings in a single conference room.
-   Task management with deadlines.
-   Resource allocation for non-preemptive processes.

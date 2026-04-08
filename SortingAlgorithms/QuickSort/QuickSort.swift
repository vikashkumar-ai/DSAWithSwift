/**
 * Problem: Quick Sort
 * Topic: Sorting Algorithms / ComparisonSorts
 * 
 * Description:
 * QuickSort is a Divide and Conquer algorithm. It picks an element 
 * as pivot and partitions the given array around the picked pivot.
 * 
 * Pattern: Partitioning. Elements smaller than pivot go left, 
 * larger than pivot go right.
 * 
 * Time Complexity: O(n log n) average case, O(n²) worst case.
 * Space Complexity: O(log n) for recursion stack.
 */

import Foundation

class Solution {
    /**
     * Sorts an array using the Quick Sort algorithm.
     * - Parameters:
     *   - array: Pointer to an array reflecting in-place changes.
     */
    func quickSort(_ array: inout [Int], _ low: Int, _ high: Int) {
        if low < high {
            // Partition the array and get the pivot index
            let p = partition(&array, low, high)
            
            // Recursively sort elements before and after partition
            quickSort(&array, low, p - 1)
            quickSort(&array, p + 1, high)
        }
    }
    
    /**
     * Lomuto partition scheme.
     */
    private func partition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
        let pivot = array[high]
        var i = low
        
        for j in low..<high {
            if array[j] <= pivot {
                array.swapAt(i, j)
                i += 1
            }
        }
        
        array.swapAt(i, high)
        return i
    }
}

// --- Test Cases ---
let sol = Solution()
var testArr = [10, 7, 8, 9, 1, 5]
sol.quickSort(&testArr, 0, testArr.count - 1)
print("Quick Sort Result: \(testArr)") // Expected: [1, 5, 7, 8, 9, 10]

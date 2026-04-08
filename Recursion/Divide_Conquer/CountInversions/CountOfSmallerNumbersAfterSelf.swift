/**
 * Problem: Count of Smaller Numbers After Self
 * Topic: Recursion / Divide_Conquer / CountInversions
 * 
 * Description:
 * You are given an integer array nums and you have to return a new counts 
 * array. The counts array has the property where counts[i] is the number 
 * of smaller elements to the right of nums[i].
 * 
 * Pattern: Enhanced Merge Sort. While merging, if an element from 
 * the right half is placed before an element from the left half, 
 * it means the right element is smaller than all remaining elements 
 * in the left half *after* the current position.
 * 
 * Time Complexity: O(n log n).
 * Space Complexity: O(n).
 */

import Foundation

class Solution {
    struct Element {
        let val: Int
        let originalIndex: Int
    }
    
    /**
     * Counts the number of smaller elements to the right.
     * - Parameters:
     *   - nums: The input integer array.
     * - Returns: Array of counts.
     */
    func countSmaller(_ nums: [Int]) -> [Int] {
        var counts = Array(repeating: 0, count: nums.count)
        var elements = nums.enumerated().map { Element(val: $1, originalIndex: $0) }
        
        _ = mergeSortAndCount(&elements, 0, elements.count - 1, &counts)
        
        return counts
    }
    
    private func mergeSortAndCount(_ elements: inout [Element], _ left: Int, _ right: Int, _ counts: inout [Int]) -> [Element] {
        if left >= right { return [elements[left]] }
        if left + 1 == right {
            if elements[left].val > elements[right].val {
                counts[elements[left].originalIndex] += 1
                elements.swapAt(left, right)
            }
            return [elements[left], elements[right]]
        }
        
        let mid = left + (right - left) / 2
        _ = mergeSortAndCount(&elements, left, mid, &counts)
        _ = mergeSortAndCount(&elements, mid + 1, right, &counts)
        
        // Merge step
        var merged = [Element]()
        var i = left
        var j = mid + 1
        var smallerOnRightCount = 0
        
        while i <= mid && j <= right {
            if elements[i].val > elements[j].val {
                // All elements from the right that are smaller than current left element
                smallerOnRightCount += 1
                merged.append(elements[j])
                j += 1
            } else {
                // When we pick a left element, we add the current count of smaller right elements
                counts[elements[i].originalIndex] += smallerOnRightCount
                merged.append(elements[i])
                i += 1
            }
        }
        
        while i <= mid {
            counts[elements[i].originalIndex] += smallerOnRightCount
            merged.append(elements[i])
            i += 1
        }
        
        while j <= right {
            merged.append(elements[j])
            j += 1
        }
        
        for k in 0..<merged.count {
            elements[left + k] = merged[k]
        }
        
        return merged
    }
}

// --- Test Cases ---
let sol = Solution()
print("Count smaller after self for [5, 2, 6, 1]: \(sol.countSmaller([5, 2, 6, 1]))") // Expected: [2, 1, 1, 0]
print("Count smaller after self for [-1]: \(sol.countSmaller([-1]))")             // Expected: [0]
print("Count smaller after self for [-1, -1]: \(sol.countSmaller([-1, -1]))")     // Expected: [0, 0]

/**
 * Problem: Range Sum Query - Mutable (using Segment Tree)
 * Topic: Range Structures / SegmentTree
 * 
 * Description:
 * Given an integer array nums, handle multiple queries of two types:
 * 1. Update the value of an element at a given index.
 * 2. Return the sum of the elements of nums between indices left 
 * and right inclusive.
 * 
 * Pattern: A Segment Tree allows point updates and range sum queries 
 * in O(log n) time.
 * 
 * Time Complexity: O(n) to build, O(log n) for update and query.
 * Space Complexity: O(n) for the segment tree array.
 */

import Foundation

class NumArray {
    private var tree: [Int]
    private var n: Int

    init(_ nums: [Int]) {
        self.n = nums.count
        if n == 0 {
            self.tree = []
            return
        }
        self.tree = Array(repeating: 0, count: 2 * n)
        build(nums)
    }
    
    private func build(_ nums: [Int]) {
        // Leave nodes correspond to original array elements
        for i in 0..<n {
            tree[n + i] = nums[i]
        }
        // Build the tree by calculating parents
        for i in (1..<n).reversed() {
            tree[i] = tree[2 * i] + tree[2 * i + 1]
        }
    }
    
    func update(_ index: Int, _ val: Int) {
        var pos = index + n
        tree[pos] = val
        while pos > 1 {
            // Move up to the parent and update
            pos /= 2
            tree[pos] = tree[2 * pos] + tree[2 * pos + 1]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var l = left + n
        var r = right + n
        var sum = 0
        while l <= r {
            if l % 2 == 1 {
                sum += tree[l]
                l += 1
            }
            if r % 2 == 0 {
                sum += tree[r]
                r -= 1
            }
            l /= 2
            r /= 2
        }
        return sum
    }
}

// --- Test Cases ---
let numArray = NumArray([1, 3, 5])
print("Initial sumRange(0, 2): \(numArray.sumRange(0, 2))") // Expected: 9
numArray.update(1, 2)
print("After update(1, 2), sumRange(0, 2): \(numArray.sumRange(0, 2))") // Expected: 8

/**
 * Problem: Range Minimum Query (using Segment Tree)
 * Topic: Range Structures / SegmentTree
 * 
 * Description:
 * Given an array and set of queries, find the minimum element in the 
 * range [L, R] for each query.
 * 
 * Pattern: Segment Tree. Each node in the tree stores the minimum 
 * of its children.
 * 
 * Time Complexity: O(n) for build, O(log n) for query/update.
 * Space Complexity: O(n) for the tree array.
 */

import Foundation

class RangeMinimumQuery {
    private var tree: [Int]
    private var n: Int
    
    init(_ nums: [Int]) {
        self.n = nums.count
        self.tree = Array(repeating: Int.max, count: 2 * n)
        
        // Build the tree
        for i in 0..<n {
            tree[n + i] = nums[i]
        }
        for i in (1..<n).reversed() {
            tree[i] = min(tree[2 * i], tree[2 * i + 1])
        }
    }
    
    /**
     * Updates an element at index i to val.
     */
    func update(_ i: Int, _ val: Int) {
        var idx = i + n
        tree[idx] = val
        while idx > 1 {
            idx /= 2
            tree[idx] = min(tree[2 * idx], tree[2 * idx + 1])
        }
    }
    
    /**
     * Queries the minimum in range [l, r].
     */
    func query(_ l: Int, _ r: Int) -> Int {
        var res = Int.max
        var left = l + n
        var right = r + n
        
        while left <= right {
            if left % 2 == 1 {
                res = min(res, tree[left])
                left += 1
            }
            if right % 2 == 0 {
                res = min(res, tree[right])
                right -= 1
            }
            left /= 2
            right /= 2
        }
        
        return res
    }
}

// --- Test Cases ---
let rmq = RangeMinimumQuery([1, 3, 2, 7, 9, 11])
print("Min in [1, 5]: \(rmq.query(1, 5))") // Expected: 2 (from index 2)
rmq.update(2, 10)
print("Min in [1, 5] after update: \(rmq.query(1, 5))") // Expected: 3

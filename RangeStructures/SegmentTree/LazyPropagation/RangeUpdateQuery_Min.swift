/**
 * Problem: Range Update Query (Min Element) with Lazy Propagation
 * Topic: Range Structures / SegmentTree / LazyPropagation
 * 
 * Description:
 * Support range updates (add delta to [l, r]) and range minimum 
 * queries in O(log n) time.
 * 
 * Pattern: Lazy Segment Tree. Each node stores the minimum of its 
 * range. When updating, add delta to the node's min value and 
 * propagate it to descendants.
 * 
 * Time Complexity: O(log n) for update and query.
 * Space Complexity: O(n).
 */

import Foundation

class RangeMinLazy {
    private var tree: [Int]
    private var lazy: [Int]
    private var n: Int
    
    init(_ nums: [Int]) {
        self.n = nums.count
        self.tree = Array(repeating: Int.max, count: 4 * n)
        self.lazy = Array(repeating: 0, count: 4 * n)
        build(nums, 1, 0, n - 1)
    }
    
    private func build(_ nums: [Int], _ node: Int, _ start: Int, _ end: Int) {
        if start == end {
            tree[node] = nums[start]
            return
        }
        let mid = (start + end) / 2
        build(nums, 2 * node, start, mid)
        build(nums, 2 * node + 1, mid + 1, end)
        tree[node] = min(tree[2 * node], tree[2 * node + 1])
    }
    
    private func pushDown(_ node: Int, _ start: Int, _ end: Int) {
        if lazy[node] != 0 {
            tree[node] += lazy[node]
            if start != end {
                lazy[2 * node] += lazy[node]
                lazy[2 * node + 1] += lazy[node]
            }
            lazy[node] = 0
        }
    }
    
    func updateRange(_ l: Int, _ r: Int, _ delta: Int) {
        update(1, 0, n - 1, l, r, delta)
    }
    
    private func update(_ node: Int, _ start: Int, _ end: Int, _ l: Int, _ r: Int, _ delta: Int) {
        pushDown(node, start, end)
        
        if start > end || start > r || end < l { return }
        
        if start >= l && end <= r {
            lazy[node] += delta
            pushDown(node, start, end)
            return
        }
        
        let mid = (start + end) / 2
        update(2 * node, start, mid, l, r, delta)
        update(2 * node + 1, mid + 1, end, l, r, delta)
        tree[node] = min(tree[2 * node], tree[2 * node + 1])
    }
    
    func queryMin(_ l: Int, _ r: Int) -> Int {
        return query(1, 0, n - 1, l, r)
    }
    
    private func query(_ node: Int, _ start: Int, _ end: Int, _ l: Int, _ r: Int) -> Int {
        if start > end || start > r || end < l { return Int.max }
        
        pushDown(node, start, end)
        
        if start >= l && end <= r {
            return tree[node]
        }
        
        let mid = (start + end) / 2
        return min(query(2 * node, start, mid, l, r), query(2 * node + 1, mid + 1, end, l, r))
    }
}

// --- Test Cases ---
let rml = RangeMinLazy([1, 5, 2, 4, 3])
print("Initial min in [1, 4]: \(rml.queryMin(1, 4))") // Expected: 2 (at index 2)
rml.updateRange(0, 2, 10) // [11, 15, 12, 4, 3]
print("Min in [1, 4] after update: \(rml.queryMin(1, 4))") // Expected: 3

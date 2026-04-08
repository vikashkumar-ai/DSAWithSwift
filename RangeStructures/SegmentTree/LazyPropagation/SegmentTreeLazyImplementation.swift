/**
 * Problem: Segment Tree with Lazy Propagation
 * Topic: Range Structures / SegmentTree / LazyPropagation
 * 
 * Description:
 * Lazy Propagation is used to perform range updates in O(log n) time 
 * by delaying the updates to children until they are actually 
 * needed. Each node in the segment tree keeps track of a 'lazy' 
 * value that needs to be added to its children.
 * 
 * Pattern: Range Query with Range Update. Use a 'lazy' array to 
 * store pending updates. Before any operation, push down the 
 * lazy values to descendants.
 * 
 * Time Complexity: O(log n) for range update and range query.
 * Space Complexity: O(n) for tree and lazy arrays.
 */

import Foundation

class SegmentTreeLazy {
    private var tree: [Int]
    private var lazy: [Int]
    private var n: Int
    
    init(_ nums: [Int]) {
        self.n = nums.count
        self.tree = Array(repeating: 0, count: 4 * n)
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
        tree[node] = tree[2 * node] + tree[2 * node + 1]
    }
    
    private func push(_ node: Int, _ start: Int, _ end: Int) {
        if lazy[node] != 0 {
            // Update node value (sum of range)
            tree[node] += (end - start + 1) * lazy[node]
            
            // If not leaf, pass lazy to children
            if start != end {
                lazy[2 * node] += lazy[node]
                lazy[2 * node + 1] += lazy[node]
            }
            lazy[node] = 0 // Clear current lazy
        }
    }
    
    /**
     * Updates range [l, r] with delta.
     */
    func updateRange(_ l: Int, _ r: Int, _ delta: Int) {
        updateRange(1, 0, n - 1, l, r, delta)
    }
    
    private func updateRange(_ node: Int, _ start: Int, _ end: Int, _ l: Int, _ r: Int, _ delta: Int) {
        push(node, start, end)
        
        if start > end || start > r || end < l { return }
        
        if start >= l && end <= r {
            lazy[node] += delta
            push(node, start, end)
            return
        }
        
        let mid = (start + end) / 2
        updateRange(2 * node, start, mid, l, r, delta)
        updateRange(2 * node + 1, mid + 1, end, l, r, delta)
        tree[node] = tree[2 * node] + tree[2 * node + 1]
    }
    
    /**
     * Queries range sum [l, r].
     */
    func queryRange(_ l: Int, _ r: Int) -> Int {
        return queryRange(1, 0, n - 1, l, r)
    }
    
    private func queryRange(_ node: Int, _ start: Int, _ end: Int, _ l: Int, _ r: Int) -> Int {
        if start > end || start > r || end < l { return 0 }
        
        push(node, start, end)
        
        if start >= l && end <= r {
            return tree[node]
        }
        
        let mid = (start + end) / 2
        return queryRange(2 * node, start, mid, l, r) + queryRange(2 * node + 1, mid + 1, end, l, r)
    }
}

// --- Test Cases ---
let st = SegmentTreeLazy([1, 3, 5, 7, 9, 11])
print("Initial sum [1, 3]: \(st.queryRange(1, 3))") // Expected: 15
st.updateRange(1, 5, 10) // Add 10 to indices 1...5
print("Sum [1, 3] after update: \(st.queryRange(1, 3))") // Expected: 45 (15 + 3*10)

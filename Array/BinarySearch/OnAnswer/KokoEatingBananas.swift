/**
 * Problem: Koko Eating Bananas
 * Topic: Array / Binary Search / On Answer
 * 
 * Description:
 * Koko loves to eat bananas. There are n piles of bananas, where the i-th pile 
 * has piles[i] bananas. Koko must finish all the piles within h hours.
 * Find the minimum integer k such that she can eat all the bananas within h hours.
 * 
 * Time Complexity: O(n * log(max(piles))) where n is number of piles.
 * Space Complexity: O(1) as we are only using two pointers for the answer range.
 */

import Foundation

class Solution {
    /**
     * Finds the minimum eating speed k using Binary Search on Answer.
     * - Parameters:
     *   - piles: Array where each element is number of bananas in a pile.
     *   - h: Total hours available to eat all bananas.
     * - Returns: Minimum eating speed.
     */
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var low = 1
        var high = piles.max() ?? 1000000000
        var result = high
        
        while low <= high {
            let mid = low + (high - low) / 2
            
            // Check if she can eat all bananas within h hours at speed mid
            if canEatAll(piles, h, mid) {
                result = mid
                high = mid - 1 // Try finding a smaller speed
            } else {
                low = mid + 1 // Speed too slow, increase it
            }
        }
        
        return result
    }
    
    /**
     * Helper to check if eating all bananas at speed k is possible within h hours.
     */
    private func canEatAll(_ piles: [Int], _ h: Int, _ k: Int) -> Bool {
        var hoursSpent = 0
        for pile in piles {
            // Hours taken for this pile is ceil(pile / k)
            hoursSpent += (pile + k - 1) / k
        }
        return hoursSpent <= h
    }
}

// --- Test Cases ---
let sol = Solution()
let testPiles = [3, 6, 7, 11]
let h = 8
print("Minimum eating speed k to finish \(testPiles) within \(h) hours: \(sol.minEatingSpeed(testPiles, h))") // Expected: 4
vax k = 4 (3/4=1, 6/4=2, 7/4=2, 11/4=3, total=8)

/**
 * Problem: Police and Thieves
 * Topic: Greedy / ResourceAllocation / MinimumPlatforms_Rooms
 * 
 * Description:
 * Given an array of size n such that each element contains either a 'P' 
 * (Police) or 'T' (Thief). Each policeman can catch only one thief. 
 * A policeman can catch a thief who is at most k units away from him. 
 * Find the maximum number of thieves that can be caught.
 * 
 * Pattern: Greedy with Two Pointers. Maintain the indices of police 
 * and thieves in two separate lists and use two pointers to match 
 * them based on the distance constraint.
 * 
 * Time Complexity: O(n).
 * Space Complexity: O(n) to store indices.
 */

import Foundation

class Solution {
    /**
     * Calculates the maximum number of thieves caught.
     * - Parameters:
     *   - arr: Array of 'P' and 'T'.
     *   - k: Max catch distance.
     * - Returns: Caught count.
     */
    func catchThieves(_ arr: [Character], _ k: Int) -> Int {
        var police = [Int]()
        var thieves = [Int]()
        
        for i in 0..<arr.count {
            if arr[i] == "P" { police.append(i) }
            else if arr[i] == "T" { thieves.append(i) }
        }
        
        var caught = 0
        var p = 0, t = 0
        
        while p < police.count && t < thieves.count {
            // Can catch
            if abs(police[p] - thieves[t]) <= k {
                caught += 1
                p += 1
                t += 1
            } else if police[p] < thieves[t] {
                // Policeman is too far behind current thief
                p += 1
            } else {
                // Thief is too far behind current policeman
                t += 1
            }
        }
        
        return caught
    }
}

// --- Test Cases ---
let sol = Solution()
print("Max thieves for [P, T, T, P, T] with k=1: \(sol.catchThieves(["P", "T", "T", "P", "T"], 1))") 
// Expected: 2 (P at 0 catches T at 1, P at 3 catches T at 2 or 4)
print("Max thieves for [T, T, P, P, T, P] with k=2: \(sol.catchThieves(["T", "T", "P", "P", "T", "P"], 2))") 
// Expected: 3

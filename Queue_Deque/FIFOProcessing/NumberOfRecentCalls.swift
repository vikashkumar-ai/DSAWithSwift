/**
 * Problem: Number of Recent Calls
 * Topic: Queue_Deque / FIFOProcessing
 * 
 * Description:
 * You have a RecentCounter class which counts the number of recent 
 * requests within a certain time frame. 
 * Implement the RecentCounter class:
 * - RecentCounter() Initializes the counter with zero recent requests.
 * - int ping(int t) Adds a new request at time t, where t represents 
 *   some time in milliseconds, and returns the number of requests 
 *   that has happened in the past 3000 milliseconds 
 *   (including the new request). Specifically, return the number 
 *   of requests that have happened in the inclusive range [t - 3000, t].
 * 
 * Pattern: Maintain a queue of request timestamps. For each ping, 
 * add the new timestamp and remove timestamps that are older 
 * than t - 3000.
 * 
 * Time Complexity: O(1) average per ping.
 * Space Complexity: O(W) where W is the window size (3000).
 */

import Foundation

class RecentCounter {
    private var requests: [Int] = []
    
    init() {}
    
    /**
     * Records a new request and returns number of recent requests.
     * - Parameters:
     *   - t: Timestamp of the new request.
     * - Returns: Count of requests in [t-3000, t].
     */
    func ping(_ t: Int) -> Int {
        // Step 1: Add current request
        requests.append(t)
        
        // Step 2: Remove requests older than t - 3000
        while !requests.isEmpty && requests.first! < (t - 3000) {
            requests.removeFirst()
        }
        
        // Step 3: Return the current count
        return requests.count
    }
}

// --- Test Cases ---
let counter = RecentCounter()
print("Ping at 1: \(counter.ping(1))")       // Expected: 1
print("Ping at 100: \(counter.ping(100))")   // Expected: 2
print("Ping at 3001: \(counter.ping(3001))") // Expected: 3
print("Ping at 3002: \(counter.ping(3002))") // Expected: 3 ([100, 3001, 3002])

/**
 * Problem: Online Stock Span
 * Topic: Stack / Range_Span
 * 
 * Description:
 * Design an algorithm that collects daily price quotes for some 
 * stock and returns the span of that stock's price for the 
 * current day. The span of the stock's price today is defined 
 * as the maximum number of consecutive days (starting from today 
 * and going backward) for which the stock price was less than or 
 * equal to today's price.
 * 
 * Pattern: Monotonic Decreasing Stack with Aggregate Spans.
 * 1. For each next price 'p':
 *    - Initialize span = 1.
 *    - While !stack.isEmpty && stack.top.price <= current:
 *      - span += stack.pop.span
 *    - stack.push(current, span)
 * 2. Return span.
 * 
 * Time Complexity: O(1) amortized.
 * Space Complexity: O(n).
 */

import Foundation

class StockSpanner {
    struct PriceSpan {
        let price: Int
        let span: Int
    }
    
    private var stack: [PriceSpan]
    
    init() {
        self.stack = []
    }
    
    /**
     * Calculates the span for a new price quote.
     * - Parameters:
     *   - price: Current day's price.
     * - Returns: Span.
     */
    func next(_ price: Int) -> Int {
        var currentSpan = 1
        
        // While current is greater or equal to top, merge the spans
        while !stack.isEmpty && stack.last!.price <= price {
            currentSpan += stack.removeLast().span
        }
        
        stack.append(PriceSpan(price: price, span: currentSpan))
        return currentSpan
    }
}

// --- Test Cases ---
let spanner = StockSpanner()
print("Span for 100: \(spanner.next(100))") // Expected: 1
print("Span for 80:  \(spanner.next(80))")  // Expected: 1
print("Span for 60:  \(spanner.next(60))")  // Expected: 1
print("Span for 70:  \(spanner.next(70))")  // Expected: 2 (60, 70)
print("Span for 60:  \(spanner.next(60))")  // Expected: 1
print("Span for 75:  \(spanner.next(75))")  // Expected: 4 (60, 70, 60, 75)
print("Span for 85:  \(spanner.next(85))")  // Expected: 6 (all except 100)

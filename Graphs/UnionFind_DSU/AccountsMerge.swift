/**
 * Problem: Accounts Merge (Using DSU)
 * Topic: Graphs / UnionFind_DSU
 * 
 * Description:
 * Given a list of accounts where each element accounts[i] is a list 
 * of strings, where the first element is the name and the rest 
 * are emails, we want to merge accounts that have the same 
 * email address. If two accounts have the same email address, 
 * they must belong to the same person.
 * 
 * Pattern: Email-to-Index Mapping with DSU.
 * 1. For each account:
 *    - Map each email to its corresponding account index.
 *    - For all emails in an account, union their indices using DSU.
 * 2. Group all emails by their root account index.
 * 3. Sort and format the merged email list.
 * 
 * Time Complexity: O(TotalEmails * α(N)).
 * Space Complexity: O(TotalEmails).
 */

import Foundation

class AccountsMergeSolver {
    class DSU {
        private var parent: [Int]
        
        init(_ n: Int) {
            parent = Array(0..<n)
        }
        
        func find(_ i: Int) -> Int {
            if parent[i] == i { return i }
            parent[i] = find(parent[i])
            return parent[i]
        }
        
        func union(_ i: Int, _ j: Int) {
            let rootI = find(i)
            let rootJ = find(j)
            if rootI != rootJ {
                parent[rootI] = rootJ
            }
        }
    }
    
    /**
     * Merges accounts with overlapping email addresses.
     * - Parameters:
     *   - accounts: List of [name, email1, email2, ...].
     * - Returns: Merged list of accounts.
     */
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        let n = accounts.count
        let dsu = DSU(n)
        var emailToIndex = [String: Int]()
        
        // Step 1: Map emails to account indices
        for i in 0..<n {
            let emails = Array(accounts[i].dropFirst())
            for email in emails {
                if let existingIndex = emailToIndex[email] {
                    // Union current account index with the existing one
                    dsu.union(i, existingIndex)
                } else {
                    emailToIndex[email] = i
                }
            }
        }
        
        // Step 2: Group emails by their root index
        var merged = [Int: Set<String>]()
        for (email, index) in emailToIndex {
            let root = dsu.find(index)
            merged[root, default: []].insert(email)
        }
        
        // Step 3: Format output
        var result = [[String]]()
        for (index, emails) in merged {
            var account = [accounts[index][0]]
            account.append(contentsOf: emails.sorted())
            result.append(account)
        }
        
        return result
    }
}

// --- Test Cases ---
let solver = AccountsMergeSolver()
let accs = [
    ["John", "johnsmith@mail.com", "john00@mail.com"],
    ["John", "johnnybravo@mail.com"],
    ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
    ["Mary", "mary@mail.com"]
]
let merged = solver.accountsMerge(accs)
print("Accounts merge result: \n\(merged.map { $0.description }.joined(separator: "\n"))")
// Expected: John: [john00, john_newyork, johnsmith], John: [johnnybravo], Mary: [mary]

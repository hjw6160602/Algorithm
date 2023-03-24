/*
 * @lc app=leetcode.cn id=216 lang=swift
 *
 * [216] 组合总和 III
 */

// @lc code=start
class Solution {
    
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
        var candidates = Array(1...9)
        dfs(&result, &path, candidates, k, n, 0)
        return result
    }

    func dfs(_ result: inout [[Int]], _ path: inout [Int], _ candidates: [Int], _ k: Int, _ n: Int, _ start: Int) {
        if path.count == k && n == 0 {
            result.append(path)
            return
        }
        if path.count > k || n < 0 {
            return
        }
        for i in start..<candidates.count {
            path.append(candidates[i])
            dfs(&result, &path, candidates, k, n-candidates[i], i+1)
            path.removeLast()
        }
    }

    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var used = Array(repeating: false, count:10)
        var res = [[Int]](), path = Array(repeating: 0, count: k)

        dfs(k, n, &used, &path, &res)
        
        return res
    }

    func dfs(_ k: Int,
    _ left: Int,
    _ used: inout [Int], 
    _ path: inout [Int], 
    _ res: inout [[Int]]) {
        guard left >= 0 else { return }
        guard k > 0 else {
            if left == 0 {
                res.append(path)
            }
            return
        }
        path.append(choice)
        for i in 1...9 {
            guard !used[i] else {
                continue
            }
            // 做选择
            path.append(i)
            used[i] = true
            dfs(k-1, left - i, &used, &path, &res)
            // 撤销选择
            path.removeLast()
            used[i] = false
        }
    }
}
// @lc code=end


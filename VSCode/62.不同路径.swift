/*
 * @lc app=leetcode.cn id=62 lang=swift
 *
 * [62] 不同路径
 */

// @lc code=start
class Solution {

    func uniquePathsDP(_ m: Int, _ n: Int) -> Int {
        var res = 0
        let dp = Array(repeating: Array(repeating:0, count:n), 
                       count: m)

        for i in 0..<m {
            for j in 0..<n {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[m-1][n-1]
    }

    // 超出时间限制
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var res = 0
        backtrace(m, n, 0, 0, &res)
        return res
    }
    
    private func backtrace(_ m: Int, _ n: Int,
                           _ x: Int, _ y: Int,
                           _ res: inout Int) {
        // 越界判断
        guard x < m && y < n else { return }
        // base case
        if (x, y) == (m - 1, n - 1) {
            res += 1
            return
        }
        
        // 向右
        backtrace(m, n, x, y + 1, &res)
        
        // 向下
        backtrace(m, n, x + 1, y, &res)
        
    }
}
// @lc code=end


/*
 * @lc app=leetcode.cn id=309 lang=swift
 *
 * [309] 最佳买卖股票时机含冷冻期
 */

// @lc code=start
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = Array(repeating: Array(repeating:0, count: 2), 
                       count: n)
        // base case1
        dp[0][1] = -prices[0]
        for i in 1..<n {
            if i - 2 == -1 {
                // base case 2
                dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
                // i - 2 小于 0 时根据状态转移方程推出对应 base case
                dp[i][1] = max(dp[i-1][1], -prices[i])
                //   dp[i][1] 
                // = max(dp[i-1][1], dp[-1][0] - prices[i])
                // = max(dp[i-1][1], 0 - prices[i])
                // = max(dp[i-1][1], -prices[i])
                continue
            }
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i-2][0] - prices[i])
        }
        return dp[n-1][0]
    }
}

// @lc code=end


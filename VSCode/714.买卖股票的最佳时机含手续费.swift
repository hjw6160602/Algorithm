/*
 * @lc app=leetcode.cn id=714 lang=swift
 *
 * [714] 买卖股票的最佳时机含手续费
 */

// @lc code=start
class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var dp = Array(repeating:Array(repeating:0, count: 2), 
                       count: n)
        // base case 
        dp[0][1] = -prices[0] - fee
        for i in 1..<n {
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i] ) 
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i] - fee)
        }
        return dp[n-1][0]
    }

    // 空间复杂度优化版本
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var dp_i0 = 0, dp_i1 = Int.min
        for i in 0..<n {
            var temp = dp_i0
            dp_i0 = max(dp_i0, dp_i1 + prices[i])
            dp_i1 = max(dp_i1, temp - prices[i] - fee)
        }
        return dp_i0
    }

}
// @lc code=end


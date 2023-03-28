/*
 * @lc app=leetcode.cn id=188 lang=swift
 *
 * [188] 买卖股票的最佳时机 IV
 */

// @lc code=start
class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        let maxK = k + 1
        if maxK > n / 2 {
            return maxProfitInf(prices)
        }

        var dp

    }
    // 不限制交易次数的情况
    func maxProfitInf(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = Array(repeating: Array(repeating: 0, count:2),
                       count: n)
        dp[0][1] = -prices[0]
        for i in 1..<n {
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
        }
        return dp[n-1][0]
    }

    // 24 ms 67.67%
    // 14.3 MB 67.67%
    func maxProfitInf2(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp_i0 = 0, dp_i1 = -prices[0]
        for i in 1..<n {
            let temp = dp_i0
            dp_i0 = max(dp_i0, dpi1 + prices[i])
            dp_i1 = max(dp_i1, dp_i0 - prices[i])
        }
        return dp_i0
    }
    
}
// @lc code=end


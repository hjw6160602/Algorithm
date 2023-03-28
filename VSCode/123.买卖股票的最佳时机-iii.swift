/*
 * @lc app=leetcode.cn id=123 lang=swift
 *
 * [123] 买卖股票的最佳时机 III
 */

// @lc code=start
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let maxK = 2, let n = prices.count
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 2),
                                        count:maxK + 1),
                       count:n)
        
        for i in 0..<n {
            // k次交易的遍历 从后往前遍历更符合直觉
            for k in (1...maxK).reversed() {
                if i - 1 == -1 {
                    // base case
                    dp[i][k][1] = - prices[i]
                    continue
                }
                //
                dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
                // 因为是需要买股票所以操作次数减一
                dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i])
            }
        }
        // 穷举了 n × maxK × 2 个状态，正确。
        return dp[n-1][maxK][0]
    }
}
// @lc code=end


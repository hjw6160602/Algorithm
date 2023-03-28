/*
 * @lc app=leetcode.cn id=123 lang=swift
 *
 * [123] 买卖股票的最佳时机 III
 */

// @lc code=start
class Solution {

    // 732 ms 100%
    // 17.6 M 90.48%
    func maxProfit(_ prices: [Int]) -> Int {
        var dp_i10 = 0, dp_i11 = Int.min
        var dp_i20 = 0, dp_i21 = Int.min
        for price in prices {
            dp_i20 = max(dp_i20, dp_i21 + price)
            dp_i21 = max(dp_i21, dp_i10 - price)
            dp_i10 = max(dp_i10, dp_i11 + price)
            dp_i11 = max(dp_i11, -price)
        }
        return dp_i20
    }

    func maxProfitK2(_ prices: [Int]) -> Int {
        var dp_i10 = 0, dp_i11 = Int.min
        var dp_i20 = 0, dp_i21 = Int.min
        for price in prices {
            dp_i20 = max(dp_i20, dp_i21 + price)
            dp_i21 = max(dp_i21, dp_i10 - price)
            dp_i10 = max(dp_i10, dp_i11 + price)
            dp_i11 = max(dp_i11, -price)
        }
        return dp_i20
    }

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


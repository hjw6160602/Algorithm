/*
 * @lc app=leetcode.cn id=122 lang=swift
 *
 * [122] 买卖股票的最佳时机 II
 */

// @lc code=start
class Solution {
    // 24 ms 67.18%
    // 14.3 MB 65.65%
    func maxProfit(_ prices: [Int]) -> Int {
        var max = 0
        
        guard prices.count > 1 else {
            return max
        }
        
        for i in 1..<prices.count where prices[i] > prices[i - 1] {
            max += prices[i] - prices[i - 1]
        }
        
        return max
    }
}
// @lc code=end


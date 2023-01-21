//
//  121.买卖股票的最佳时机.swift
//  DynamicPrograming
//
//  Created by SaiDiCaprio on 2021/2/22.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock

import Foundation

extension Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var maxProfit = 0
        // 默认历史最低价为数组当中的第0位
        var minPrice = prices[0]
        // 从 index 为1 开始卖 算出当天的盈利
        for i in 1..<prices.count {
            // 算出一个 大于 0 的收益出来
            let profit = prices[i] - minPrice
            // 跟默认的最大收益做比较 如果收益更大 就更新
            if profit > maxProfit {
                maxProfit = profit
            }
            // 如果当天的价格 是历史最低价 那么更新值
            if minPrice > prices[i] {
                minPrice = prices[i]
            }
        }
        
        return maxProfit
    }
    
    func maxProfitSwift(prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var maxProfit = 0
        var buyDay = 0
        
        for i in 1 ..< prices.count {
            let profit = prices[i] - prices[buyDay]
            if profit < 0 {
                buyDay = i
            }
            maxProfit = max(profit, maxProfit)
        }
        
        return maxProfit
    }
    
    // 动态规划的方式
    func maxProfitDP(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var diff = [Int](repeating: 0, count: prices.count)
        for i in 1..<prices.count {
            diff[i] = prices[i] - prices[i - 1]
        }
        // 动态规划 53. 转化为最大子序列和
        var dp = [Int](repeating: 0, count: prices.count)
        var res = 0
        for j in 1..<diff.count {
            dp[j] = max(dp[j - 1] + diff[j], diff[j])
            res = max(dp[j], res)
        }
        return res > 0 ? res : 0
    }
     
//    904 ms  35.19%
//    17.3 MB 15.54%
//    通过测试用例：211 / 211
    func maxProfitP1(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var maxProfit = 0, lastMin = prices[0]
        
        for (_, price) in prices.enumerated() {
            defer { lastMin = min( lastMin, price) }
            guard price > lastMin else {
                continue
            }
            
            maxProfit = max(maxProfit, price - lastMin)
        }
        
        return maxProfit
    }
    
//    1052 ms 5.57%
//    17.4 MB 9.97%
    func maxProfitDP2(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var sequence = Array(repeating: 0, count: prices.count)
        
        for i in 1..<prices.count {
            sequence[i] =  prices[i] - prices[i-1]
        }
        
        // 动态规划 53. 转化为最大子序列和
        var maxSum = 0
        // dp[i]代表 以i结尾的 子序列的最大和
        var dp = Array(repeating: 0, count: prices.count)
        for i in 1..<sequence.count {
            dp[i] = max(sequence[i], dp[i-1] + sequence[i])
            maxSum = max(maxSum, dp[i])
        }
        
        return maxSum
    }
}

func testMaxProfit() {
    let x = LeetCode.maxProfitDP2([7,6,4,3,1])
    print(x)
}

// 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
// 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
// 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

// 示例 1：
//       [-6,4, -2, 3,-2]
// 输入：[7, 1, 5, 3, 6, 4]
// 输出：5
// 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
//      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。

// 示例 2：
// 输入：prices = [7,6,4,3,1]
// 输出：0
// 解释：在这种情况下, 没有交易完成, 所以最大利润为 0。

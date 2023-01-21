//
//  322. CoinChange.swift
//  DynamicPrograming
//
//  Created by SaiDiCaprio on 2021/2/4.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode.com/problems/coin-change/

import Foundation

extension Solution {
    
    // 定义状态 dp[i] 凑够i 所需要的最小硬币个数
    // 原问题的解 也是子问题的解
    // 动态转移方程
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        // 先将数组里的每一元素用 当前amount + 1来初始化
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1 ... amount {
            for coin in coins {
                if coin <= i {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
    
    // dp[i] 凑够i 所需要的最小硬币个数
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        guard amount != 0 else {
            return 0
        }
        var dp = Array.init(repeating: -1, count: amount + 1)
        for i in 1 ... amount {
            for coin in coins {
                if (coin == i) {
                    dp [i] = 1
                    break
                }
                if(coin < i && dp[i - coin] != -1) {
                    if (dp[i] == -1) {
                        dp[i] = dp[i - coin] + 1
                    } else {
                        dp[i] = min(dp[i], dp[i - coin] + 1)
                    }
                }
            }
        }
        return dp[amount]
    }
}

// 给定不同面额的硬币 coins 和一个总金额 amount
// 编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1
// 你可以认为每种硬币的数量是无限的
 
// 示例 1：
// 输入：coins = [1, 2, 5], amount = 11
// 输出：3
// 解释：11 = 5 + 5 + 1
 
// 示例 2：
// 输入：coins = [2], amount = 3
// 输出：-1
 
// 示例 3：
// 输入：coins = [1], amount = 0
// 输出：0
 
// 示例 4：
// 输入：coins = [1], amount = 1
// 输出：1
 
// 示例 5：
// 输入：coins = [1], amount = 2
// 输出：2


func testCoinChange() {
    print(LeetCode.coinChange([1,2,5], 11))
    print(LeetCode.coinChange([2], 3))
    print(LeetCode.coinChange([1], 0))
    print(LeetCode.coinChange([1], 2))
}

//1:1
//2:1
//3:2
//4:2
//dp[i] = min(dp[i], dp[i - coin] + 1)

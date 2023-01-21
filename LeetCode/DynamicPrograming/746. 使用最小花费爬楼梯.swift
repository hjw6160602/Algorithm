//
//  746. 使用最小花费爬楼梯.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2022/7/1.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/min-cost-climbing-stairs

import Foundation


extension Solution {

//    24 ms 34.48%
//    13.7 MB 68.97%
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array.init(repeating: 0, count: cost.count + 2)
        for i in 0..<cost.count {
            dp[i+1] = cost[i]
        }
        
        for i in 2..<dp.count {
            dp[i] = min(dp[i-1], dp[i-2]) + dp[i]
        }
        return dp.last!
    }
    
//    16 ms 100.00%
//    13.8 MB 67.24%
    func minCostClimbingStairsP1(_ cost: [Int]) -> Int {
        var first = 0, second = cost[0]
        for i in 1..<cost.count {
            let temp = second
            second = min(first, second) + cost[i]
            first = temp
        }
        
        return min(first, second)
    }
}

func test746minCostClimbingStairs() {
    let stairs = [1,100,1,1,1,100,1,1,100,1]
//    let stairs = [10,15,20]
    let x = LeetCode.minCostClimbingStairsP1(stairs)
    print(x)
}

//给你一个整数数组 cost ，其中 cost[i] 是从楼梯第 i 个台阶向上爬需要支付的费用。一旦你支付此费用，即可选择向上爬一个或者两个台阶。
//
//你可以选择从下标为 0 或下标为 1 的台阶开始爬楼梯。
//
//请你计算并返回达到楼梯顶部的最低花费。

//示例 1：
//输入：cost = [10,15,20]
//输出：15
//解释：你将从下标为 1 的台阶开始。
//- 支付 15 ，向上爬两个台阶，到达楼梯顶部。
//总花费为 15 。

//示例 2：
//输入：cost = [1,100,1,1,1,100,1,1,100,1]
//输出：6

//解释：你将从下标为 0 的台阶开始。
//- 支付 1 ，向上爬两个台阶，到达下标为 2 的台阶。
//- 支付 1 ，向上爬两个台阶，到达下标为 4 的台阶。
//- 支付 1 ，向上爬两个台阶，到达下标为 6 的台阶。
//- 支付 1 ，向上爬一个台阶，到达下标为 7 的台阶。
//- 支付 1 ，向上爬两个台阶，到达下标为 9 的台阶。
//- 支付 1 ，向上爬一个台阶，到达楼梯顶部。
//总花费为 6 。


//2 <= cost.length <= 1000
//0 <= cost[i] <= 999

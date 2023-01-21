//
//  279. 完全平方数.swift
//  Math
//
//  Created by SaiDiCaprio on 2022/7/27.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/perfect-squares

import Foundation

extension Solution {
//  2,4,9,16,25,36,47,64,81,100,121,144,169,196,225

//    320 ms 11.43%
//    13.3 MB 75.71%
    func numSquares(_ n: Int) -> Int {
        guard n > 3 else { return n }

        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        for i in 2...n {
            var meta = i >> 1
            while meta * meta > i {
                meta -= 1
            }
            var minTime = i
            for j in (1...meta).reversed() {
                // 上一个数就是完全平方数直接返回
                guard minTime != 1 else { break }
                minTime = min(minTime, dp[i - j * j] + 1)
            }
            dp[i] = minTime
        }
        
        return dp[n]
    }
    
//    32 ms 41.43%
//    13.4 MB 64.29%
    func numSquaresP1(_ n: Int) -> Int {
        var leastNums = Array(repeating: Int.max, count: n + 1)
        leastNums[0] = 0
        
        for i in 1...n {
            for j in 1...i  {
                if j * j > i {
                    break
                }
                leastNums[i] = min(leastNums[i], leastNums[i - j * j] + 1)
            }
        }
        return leastNums[n]
    }
//     12 9 3  3:3
//     12 4 8  8:2
    // 2 1 1  1:1
    // 3 1 2  2: 2
    // 4 2
}

func test279NumSquares() {
    let x = LeetCode.numSquares(99)
    print(x)
}

//给你一个整数 n ，返回 和为 n 的完全平方数的最少数量 。
//完全平方数 是一个整数，其值等于另一个整数的平方；
//换句话说，其值等于一个整数自乘的积。例如，1、4、9 和 16 都是完全平方数，而 3 和 11 不是。

//示例 1：
//输入：n = 12
//输出：3
//解释：12 = 4 + 4 + 4

//示例 2：
//输入：n = 13
//输出：2
//解释：13 = 4 + 9

//提示：
//1 <= n <= 104

//
//  1025. 除数博弈.swift
//  Math
//
//  Created by 贺嘉炜 on 2022/6/29.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/divisor-game

import Foundation

extension Solution {
//    4 ms
//    100.00%
//    13.5 MB
//    16.67%
    func divisorGame(_ n: Int) -> Bool {
        return n & 1 == 0
    }
    
//    4 ms
//    100.00%
//    13.4 MB
//    33.33%
    func divisorGameP1(_ n: Int) -> Bool {
        var dp = Array(repeating: false, count: n + 2)
        dp[2] = true
        guard n > 3 else {  return dp[n] }
        
        for i in 4...n {
            for j in 1..<i {
                // 从过去的已知结果里找一个 能除尽的 并且能必输的解
                if i % j == 0 && dp[i-j] == false {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[n]
    }
    
}

func test1025DivisorGame() {
    for i in 1..<20 {
        let x = LeetCode.divisorGameP1(i)
        print(x)
    }
    
}

//爱丽丝和鲍勃一起玩游戏，他们轮流行动。爱丽丝先手开局。
//最初，黑板上有一个数字 n 。在每个玩家的回合，玩家需要执行以下操作：
//选出任一 x，满足 0 < x < n 且 n % x == 0 。
//用 n - x 替换黑板上的数字 n 。
//如果玩家无法执行这些操作，就会输掉游戏。
//只有在爱丽丝在游戏中取得胜利时才返回 true 。假设两个玩家都以最佳状态参与游戏。


//示例 1：
//输入：n = 2
//输出：true
//解释：爱丽丝选择 1，鲍勃无法进行操作。

//示例 2：
//输入：n = 3
//输出：false
//解释：爱丽丝选择 1，鲍勃也选择 1，然后爱丽丝无法进行操作。

//提示：
//1 <= n <= 1000

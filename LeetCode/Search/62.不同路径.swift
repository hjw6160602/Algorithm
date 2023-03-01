//
//  62.不同路径.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/8/5.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/unique-paths/

import Foundation

func test62uniquePaths() {
    let m = 3, n = 3
    let x = LeetCode.uniquePaths3(m, n)
    print(x)
}

extension Solution {
//    0 ms 100%
//    13.5 MB 45.45%
    func uniquePaths3(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating:1, count:n)
        for _ in 1..<m {
            var left = 1
            for j in 1..<n {
                let cur = dp[j] + left
                left = cur
                dp[j] = cur
            }
        }
        return dp[n-1]
    }
    
    //    0 ms 100%
    //    13.6 MB 22.73%
    func uniquePaths2(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating:0, count:n),
                       count: m)
        for i in 0..<m { dp[i][0] = 1 }
        for j in 0..<n { dp[0][j] = 1 }
        
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[m-1][n-1]
    }
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 1 && n > 1 else {
            return 1
        }
        var dp = Array(repeating: Array(repeating:0, count:n + 1),
                       count: m + 1)
        for i in 1...m { dp[i][1] = 1 }
        for j in 1...n { dp[1][j] = 1 }
        
        for i in 2...m {
            for j in 2...n {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[m][n]
    }
    
    
    // 超出时间限制
    func uniquePathsOOT(_ m: Int, _ n: Int) -> Int {
        var res = 0
        backtrace(m, n, 0, 0, &res)
        return res
    }
    
    private func backtrace(_ m: Int, _ n: Int,
                           _ x: Int, _ y: Int,
                           _ res: inout Int) {
        // 越界判断
        guard x < m && y < n else { return }
        // base case
        if (x, y) == (m - 1, n - 1) {
            res += 1
            return
        }
        
        // 向右
        backtrace(m, n, x, y + 1, &res)
        
        // 向下
        backtrace(m, n, x + 1, y, &res)
        
    }
}



//一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。
//机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。
//问总共有多少条不同的路径？

//示例 1：
//输入：m = 3, n = 7
//输出：28

//示例 2：
//输入：m = 3, n = 2
//输出：3
//解释：
//从左上角开始，总共有 3 条路径可以到达右下角。
//1. 向右 -> 向下 -> 向下
//2. 向下 -> 向下 -> 向右
//3. 向下 -> 向右 -> 向下
//
//示例 3：
//输入：m = 7, n = 3
//输出：28
//
//示例 4：
//输入：m = 3, n = 3
//输出：6
//
//提示：
//1 <= m, n <= 100
//题目数据保证答案小于等于 2 * 109

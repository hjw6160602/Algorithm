//
//  64. 最小路径和.swift
//  DynamicPrograming
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/minimum-path-sum

import Foundation

extension Solution {
    
//    44 ms 62.10%
//    14.4 MB 19.35%
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n),
                       count: m)
        dp[0][0] = grid[0][0]
        for j in 1..<n {
            dp[0][j] = dp[0][j-1] + grid[0][j]
        }
        for i in 1..<m {
            dp[i][0] = dp[i-1][0] + grid[i][0]
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
            }
        }
        return dp[m-1][n-1]
    }
    
//    52 ms 12.10%
//    14 MB 91.13%
    func minPathSumP1(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = grid[0]
        for j in 1..<n {
            dp[j] += dp[j-1]
        }
        for i in 1..<m {
            dp[0] += grid[i][0]
            for j in 1..<n {
                dp[j] = min(dp[j-1], dp[j]) + grid[i][j]
            }
        }
        return dp[n-1]
    }
    
//    44 ms 62.10%
//    14.5 MB 12.09%
    func minPathSumSoap(_ grid: [[Int]]) -> Int {
        guard grid.count != 0 && grid[0].count != 0 else{
            return 0
        }
        
        let m = grid.count, n = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0{
                    dp[i][j] = grid[i][j]
                } else if i == 0 {
                    dp[i][j] = dp[i][j - 1] + grid[i][j]
                } else if j == 0 {
                    dp[i][j] = dp[i - 1][j] + grid[i][j]
                } else {
                    dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
                }
            }
        }
        return dp[m - 1][n - 1]
    }
    
}

func test64MinPathSum() {
//    let grid = [[1,3,1],[1,5,1],[4,2,1]]
    let grid = [[1,2,3],[4,5,6]]
    let x = LeetCode.minPathSumP1(grid)
    print(x)
}
//给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
//
//说明：每次只能向下或者向右移动一步。
//
//示例 1：
//输入：grid = [[1,3,1],[1,5,1],[4,2,1]]
//输出：7
//解释：因为路径 1→3→1→1→1 的总和最小。
//
//示例 2：
//输入：grid = [[1,2,3],[4,5,6]]
//输出：12
//
//
//提示：
//m == grid.length
//n == grid[i].length
//1 <= m, n <= 200
//0 <= grid[i][j] <= 100

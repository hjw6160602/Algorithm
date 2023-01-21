//
//  47. 礼物的最大价值.swift
//  DynamicPrograming
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/

import Foundation

extension Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        guard grid.count != 0 && grid[0].count != 0 else{
            return 0
        }
        
        let rows = grid.count, cols = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
        dp[0][0] = grid[0][0]
        
        for col in 1..<cols {
            dp[0][col] = dp[0][col - 1] + grid[0][col]
        }
        for row in 1..<rows {
            dp[row][0] = dp[row - 1][0] + grid[row][0]
        }
        
        for row in 1..<rows {
            for col in 1..<cols {
                dp[row][col] = max(dp[row][col - 1], dp[row - 1][col])  + grid[row][col]
            }
        }
        
        return dp[rows - 1][cols - 1]
    }
    
    
//    执行用时：60 ms 击败了 17.53%
//    内存消耗：13.8 MB 击败了 87.63%
//    通过测试用例： 61 / 61
    func maxValueP1(_ grid: [[Int]]) -> Int {
        guard grid.count != 0 else { return 0 }
        
        let rows = grid.count, cols = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
        dp[0][0] = grid[0][0]
        for k in 1..<cols {
            dp[0][k] = dp[0][k-1] + grid[0][k]
        }
        for k in 1..<rows {
            dp[k][0] = dp[k-1][0] + grid[k][0]
        }
        
        for i in 1..<rows {
            for j in 1..<cols {
                dp[i][j] = max(dp[i][j-1], dp[i-1][j]) + grid[i][j]
            }
        }

        return dp[rows - 1][cols - 1]
    }
    
//    MARK: - 优化为一维数组
    //    [1,3,1]
    //    [1,5,1]
    //    [4,2,1]
        
    //    [1, 4, 5]
    //    [2, 9,10]
    //    [6,11,12]
        
    //    [6, 11, 12]
    
//    执行用时：48 ms击败了 97.94%
//    内存消耗：13.3 MB 击败了 100.00%
//    通过测试用例：61 / 61

    func maxValueP2(_ grid: [[Int]]) -> Int {
        guard grid.count != 0 else { return 0 }
        
        let rows = grid.count, cols = grid[0].count
        var dp = grid[0]
        // 将 第0行 的值先累加起来
        for k in 1..<cols {
            dp[k] += dp[k-1]
        }
        // 直接从 第1行 开始遍历
        for i in 1..<rows {
            for j in 0..<cols {
                guard j > 0 else {
                    // 第0列 直接加上去不用做比较
                    dp[j] += grid[i][0]
                    continue
                }
                dp[j] = max(dp[j-1], dp[j]) + grid[i][j]
            }
        }
        return dp[cols - 1]
    }
    
}

func testMaxValue() {
    let array = [
          [1,3,1],
          [1,5,1],
          [4,2,1]
    ]
//    let array = [[1,2,5],[3,2,1]]
    
    let x = LeetCode.maxValueP2(array)
    print(x)
}


// 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。
// 你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。
// 给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？

//示例 1:

//输入:
//[
//  [1,3,1],
//  [1,5,1],
//  [4,2,1]
//]

//输出: 12
//解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物

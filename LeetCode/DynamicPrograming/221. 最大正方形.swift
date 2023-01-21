//
//  221. 最大正方形.swift
//  DynamicPrograming
//
//  Created by SaiDiCaprio on 2022/8/24.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/maximal-square

import Foundation

extension Solution {
    
//    480 ms 11.11%
//    16.2 MB 6.67%
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count != 0 else { return 0 }
        let m = matrix.count, n = matrix[0].count
        
        var dp =  Array(repeating: Array(repeating:0, count: n + 1),
                        count: m + 1)
        var ans = 0
        for i in 1...m {
            for j in 1...n {
                if matrix[i-1][j-1] != "1" {
                    continue
                }
                dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                ans = max(ans, dp[i][j])
            }
        }
        return ans * ans
    }
    
//    460 ms 17.78%
//    16.3 MB 6.67%
    func maximalSquareSoap(_ matrix: [[Character]]) -> Int {
        guard matrix.count != 0 else { return 0 }
        let m = matrix.count, n = matrix[0].count
    
        var max_global = 0
        var maxSquareSide = Array(repeating: Array(repeating:0, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                guard matrix[i][j] != "0" else {
                    continue;
                }
            
                if i == 0 || j == 0 {
                    maxSquareSide[i][j] = 1
                } else {
                    maxSquareSide[i][j] = min(maxSquareSide[i][j - 1], maxSquareSide[i - 1][j], maxSquareSide[i - 1][j - 1]) + 1
                }
                
                max_global = max(max_global, maxSquareSide[i][j])
            }
        }
        
        return max_global * max_global
    }
}

func test221maximalSquare() {
    let matrix: [[Character]] =
    [["1","0","1","0","0"],
     ["1","0","1","1","1"],
     ["1","1","1","1","1"],
     ["1","0","0","1","0"]]
    let x = LeetCode.maximalSquare(matrix)
    print(x)
}

// 在一个由 '0' 和 '1' 组成的二维矩阵内，找到只包含 '1' 的最大正方形，并返回其面积。

//  示例 1：
//  输入：matrix = [["1","0","1","0","0"],
//                 ["1","0","1","1","1"],
//                 ["1","1","1","1","1"],
//                 ["1","0","0","1","0"]]
//  输出：4

//  示例 2：
//  输入：matrix = [["0","1"],["1","0"]]
//  输出：1

//  示例 3：
//  输入：matrix = [["0"]]
//  输出：0

//  提示：
//  m == matrix.length
//  n == matrix[i].length
//  1 <= m, n <= 300
//  matrix[i][j] 为 '0' 或 '1'

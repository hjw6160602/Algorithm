//
//  931. 下降路径最小和.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2023/2/17.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    80 ms 71.43%
//    14 MB 50%
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let m = matrix.count, n = matrix[0].count

//        我们 DP 的初始值就要避开区间 [-10000, 10000]，
//        DP 的初始值只要在区间 (-inf, -10001] U [10001, +inf) 中就可以
        var dp = Array(repeating: Array(repeating: 10001, count: n+2),
                       count: m)
        // 初始化第一行DP数组
        for j in 1...n {
            dp[0][j] = matrix[0][j-1]
        }

        
        for i in 1..<m {
            for j in 1...n {
                dp[i][j] = min(dp[i-1][j-1], dp[i-1][j], dp[i-1][j+1]) + matrix[i][j-1]
            }
        }
        
//        刚才说了，合法答案的区间是 [-10000, 10000]，
//        所以我们的返回值只要大于 10000 就相当于一个永不会取到的最大值。
        var res = 10001
        for k in 1...n {
            res = min(res, dp[m-1][k])
        }
        return res
    }
}

func test931minFallingPathSum() {
    let matrix = [[2,1,3],[6,5,4],[7,8,9]]
    let x = LeetCode.minFallingPathSum(matrix)
    print(x)
}

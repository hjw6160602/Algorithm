//
//  712. 两个字符串的最小ASCII删除和.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2023/2/19.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    12 ms 100% 内存
//    14.9 MB 57.14%
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let s1 = Array(s1), s2 = Array(s2)
        let m = s1.count, n = s2.count
        
        var dp = Array(repeating: Array(repeating: 0, count: n+1),
                       count: m+1)
        
        for i in 1...m {
            for j in 1...n {
                if s1[i-1] == s2[j-1] {
//                    如果相等那么计算一个当前的ascii码
                    dp[i][j] = dp[i-1][j-1] + Int(s1[i-1].asciiValue!)
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        let s1Sum = s1.map{Int($0.asciiValue!)}.reduce(0, +)
        let s2Sum = s2.map{Int($0.asciiValue!)}.reduce(0, +)
        
        return s1Sum - dp[m][n] + s2Sum - dp[m][n]
    }
}

func test712minimumDeleteSum() {
    let s1 = "delete", s2 = "leet"
    let x = LeetCode.minimumDeleteSum(s1, s2)
    print(x)
}

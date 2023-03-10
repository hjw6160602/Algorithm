//
//  712. 两个字符串的最小ASCII删除和.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2023/2/19.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    // 将题目转化为两个字符串最长子序列ASCII和
   //    12 ms 100% 内存
   //    14.9 MB 57.14%
       func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
           let s1 = Array(s1), s2 = Array(s2)
           let m = s1.count, n = s2.count
           //dp[i][j]为以字符s1[i]和字符s2[j]结尾的LCS的ascii和
           var dp = Array(repeating: Array(repeating: 0, count: n+1),
                          count: m+1)
           
           for i in 1...m {
               for j in 1...n {
                   if s1[i-1] == s2[j-1] {
   //                    如果相等那么把当前字符的ascii 加上去
                       dp[i][j] = dp[i-1][j-1] + Int(s1[i-1].asciiValue!)
                   } else {
                       dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                   }
               }
           }
           let s1Sum = s1.map{Int($0.asciiValue!)}.reduce(0, +)
           let s2Sum = s2.map{Int($0.asciiValue!)}.reduce(0, +)
           // 然后将整体的ascii和减去最长子序列ascii和就是 题目所要求的最小删除和
           return s1Sum - dp[m][n] + s2Sum - dp[m][n]
       }
}

func test712minimumDeleteSum() {
    let s1 = "delete", s2 = "leet"
    let x = LeetCode.minimumDeleteSum(s1, s2)
    print(x)
}

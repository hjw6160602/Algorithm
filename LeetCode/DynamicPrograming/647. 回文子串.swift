//
//  647. 回文子串.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2022/8/20.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/palindromic-substrings

import Foundation

extension Solution {
//    24 ms 25.00%
//    15.1 MB  10.94%
    func countSubstrings(_ s: String) -> Int {
        guard s.count > 1 else { return 1 }
        let chars = [Character](s)
        var res = 0
        //  dp[i][j] 代表 s[i...j]是回文串
        var dp = Array(repeating: Array.init(repeating: false, count: s.count),
                       count: s.count)
                
        for i in (0..<s.count).reversed() {
            // 只填写右上角
            for j in i..<s.count {
                // 行和列 相等的直接返回 T
                guard j != i else {
                    dp[i][i] = true
                    res += 1
                    continue
                }
                // 两头的字符必须相当 不相等下一个
                guard chars[i] == chars[j] else { continue }
                
                guard dp[i+1][j-1] || j - i < 2 else {
                    continue
                }
               
                dp[i][j] = true
                res += 1
            }
        }
        return res
    }
}

//       0 1 2 3 4
//       b a b b d
//  0 b  T   T
//  1 a    T   T
//  2 b      T   F
//  3 a        T
//  4 d          T

func test647CountSubstrings() {
    let s = "aaa"
    let x = LeetCode.countSubstrings(s)
    print(x)
}

//给你一个字符串 s ，请你统计并返回这个字符串中 回文子串 的数目。
//回文字符串 是正着读和倒过来读一样的字符串。
//子字符串 是字符串中的由连续字符组成的一个序列。
//具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被视作不同的子串。
//
//
//示例 1：
//输入：s = "abc"
//输出：3
//解释：三个回文子串: "a", "b", "c"
//
//示例 2：
//输入：s = "aaa"
//输出：6
//解释：6个回文子串: "a", "a", "a", "aa", "aa", "aaa"
//
//提示：
//1 <= s.length <= 1000
//s 由小写英文字母组成


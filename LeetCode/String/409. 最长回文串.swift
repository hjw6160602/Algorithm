//
//  409. 最长回文串.swift
//  String
//
//  Created by 贺嘉炜 on 2022/6/30.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/longest-palindrome

import Foundation

extension Solution {
    
//    4 ms 93.18%
//    14.1 MB 50.00%
//    95 / 95
    func longestPalindromeII(_ s: String) -> Int {
        
        var res = Array.init(repeating: 0, count: 128)
        
        for char in s {
            let assic = Int(char.asciiValue!)
            res[assic] += 1
        }
        var count = 0
        for value in res {
            count += (value / 2) * 2
            if count & 1 == 0 && value & 1 == 1 {
                count += 1
            }
        }
        return count

    }
    
//    4 ms 93.18%
//    14.2 MB 45.46%
    func longestPalindromeIIP1(_ s: String) -> Int {
        var res = Array.init(repeating: 0, count: 128)
        
        var count = 0
        for char in s {
            let assic = Int(char.asciiValue!)
            // 如果当前下表索引已经是奇数了 那么就直接加2给count
            if (res[assic] & 1 == 1) {
                count += 2
            }
            res[assic] += 1
        }
        // 当前统计出来了所有偶数对字符的长度 那么如果另外存在奇数的字符直接 +1 作为中心字符
        if count < s.count {
            count += 1
        }
        return count
    }
}

func test409LongestPalindrome() {
    let x = LeetCode.longestPalindromeIIP1("abccccdd")
    print(x)
}

//给定一个包含大写字母和小写字母的字符串 s ，返回 通过这些字母构造成的 最长的回文串 。
//在构造过程中，请注意 区分大小写 。比如 "Aa" 不能当做一个回文字符串。

//示例 1:
//输入:s = "abccccdd"
//输出:7
//解释:
//我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。

//示例 2:
//输入:s = "a"
//输入:1

//示例 3:
//输入:s = "bb"
//输入: 2
//提示:

//1 <= s.length <= 2000
//s 只能由小写和/或大写英文字母组成


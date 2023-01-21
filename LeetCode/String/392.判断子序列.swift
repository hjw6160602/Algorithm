//
//  392.判断子序列.swift
//  String
//
//  Created by 贺嘉炜 on 2022/4/14.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/is-subsequence

import Foundation


extension Solution {
//    1212 ms 5.41%
//    14.2 MB 32.43%
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var i = 0, j = 0
        let sub = [Character](s)
        let whole = [Character](t)
        while i<s.count && j<t.count {
            if sub[i] == whole[j] {
                i += 1
            }
            j += 1
        }
        if i == sub.count {
            return true
        }
        return false
    }
}

func testIsSubsequence() {
//    let x = LeetCode.isSubsequence("abc", "ahbgdc")
    let x = LeetCode.isSubsequence("axc", "ahbgdc")
    print(x)
}

//给定字符串 s 和 t ，判断 s 是否为 t 的子序列。
//字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，"ace"是"abcde"的一个子序列，而"aec"不是）。
//
//进阶：
//如果有大量输入的 S，称作 S1, S2, ... , Sk 其中 k >= 10亿，你需要依次检查它们是否为 T 的子序列。在这种情况下，你会怎样改变代码？
//
//
//示例 1：
//输入：s = "abc", t = "ahbgdc"
//输出：true
//
//示例 2：
//输入：s = "axc", t = "ahbgdc"
//输出：false
//
//
//提示：
//0 <= s.length <= 100
//0 <= t.length <= 10^4
//两个字符串都只由小写字符组成。


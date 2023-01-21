//
//  1143.最长公共子序列.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2021/3/6.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/longest-common-subsequence

import Foundation

extension Solution {
    
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard text1.count > 0 && text2.count > 0 else {
            return 0
        }
        let chars1 = Array(text1)
        let chars2 = Array(text2)
        return _dpOneLineArray(chars1, chars2)
    }
    
    /// 用1行数组来解决
    private func _dpOneLineArray(_ chars1: [Character], _ chars2: [Character]) -> Int {
        if chars1.count == 0 || chars2.count == 0 { return 0 }
        
        var dp = [Int](repeating: 0, count: chars2.count + 1)
        
        for i in 1...chars1.count {
            var current = 0
            for j in 1...chars2.count {
                // 算出新的一行 覆盖上一行内容
                // 需要一个左上角的值 没有办法 从后往前算 因为需要3个值
                let leftTop = current
                current = dp[j]
                if chars1[i - 1] == chars2[j - 1] {
                    dp[j] = leftTop + 1
                } else {
                    dp[j] = max(dp[j - 1], dp[j])
                }
            }
        }
        return dp[chars2.count]
    }
    
    /// 写在一个函数里
    func longestCommonSubsequence2(_ text1: String, _ text2: String) -> Int {
        guard text1.count > 0 && text2.count > 0 else {
            return 0
        }
        // 挑选长度较小的那个字符串作为一位数组的列数
        var rowsTxt = [Character](), colsTxt = [Character]()
        if text1.count < text2.count {
            colsTxt = Array(text1)
            rowsTxt = Array(text2)
        } else {
            rowsTxt = Array(text1)
            colsTxt = Array(text2)
        }
        
        var dp = [Int](repeating: 0, count: colsTxt.count + 1)
        
        for i in 1...rowsTxt.count {
            var current = 0
            for j in 1...colsTxt.count {
                // 算出新的一行 覆盖上一行内容
                let leftTop = current
                current = dp[j]
                if rowsTxt[i - 1] == colsTxt[j - 1] {
                    dp[j] = leftTop + 1
                } else {
                    dp[j] = max(dp[j - 1], dp[j])
                }
            }
        }
        return dp[colsTxt.count]
    }
    
    /// 用较短的作为1维数组来解决
    private func _dpShorterArray(_ chars1: [Character], _ chars2: [Character]) -> Int {
        if chars1.count == 0 || chars2.count == 0 { return 0 }
        
        // 挑选长度较小的那个字符串作为一位数组的列数
        var rowsTxt = chars1, colsTxt = chars2
        if chars1.count < chars2.count {
            colsTxt = chars1
            rowsTxt = chars2
        }
        
        var dp = [Int](repeating: 0, count: colsTxt.count + 1)
        
        for i in 1...rowsTxt.count {
            var current = 0
            for j in 1...colsTxt.count {
                // 算出新的一行 覆盖上一行内容
                let leftTop = current
                current = dp[j]
                if rowsTxt[i - 1] == colsTxt[j - 1] {
                    dp[j] = leftTop + 1
                } else {
                    dp[j] = max(dp[j - 1], dp[j])
                }
            }
        }
        return dp[colsTxt.count]
    }
    
    /// 滚动数组
    private func _dpRollingArray(_ chars1: [Character], _ chars2: [Character]) -> Int {
        if chars1.count == 0 || chars2.count == 0 { return 0 }
        
        var dp = [[Int]](repeating: Array(repeating: 0, count: chars2.count + 1), count: 2)
        
        for i in 1...chars1.count {
            let row = i & 1
            let preRow = (i - 1) & 1
            for j in 1...chars2.count {
                if chars1[i - 1] == chars2[j - 1] {
                    dp[row][j] = dp[preRow][j - 1] + 1
                } else {
                    dp[row][j] = max(dp[preRow][j], dp[row][j - 1])
                }
            }
        }
        return dp[chars1.count & 1][chars2.count]
    }
    
    /// DP用二维数组 解法
    private func _lscDP(_ chars1: [Character], _ chars2: [Character]) -> Int {
        if chars1.count == 0 || chars2.count == 0 {
            return 0
        }
        
        var dp = [[Int]](repeating: Array(repeating: 0, count: chars2.count + 1),
                         count: chars1.count + 1)
        
        for i in 1...chars1.count {
            for j in 1...chars2.count {
                if chars1[i - 1] == chars2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return dp[chars1.count][chars2.count]
    }
    
    // 递归解法 超时
    private func _lscRecur(_ text1: [Character], i: Int, _ text2: [Character], j: Int) -> Int {
        if i == 0 || j == 0 {
            return 0
        }
        
        if text1[i - 1] == text2[j - 1] {
            return _lscRecur(text1, i: i - 1, text2, j: j - 1) + 1
        }
        return max(_lscRecur(text1, i: i - 1, text2, j: j),
                   _lscRecur(text1, i: i, text2, j: j - 1))
    }
}

// 给定两个字符串 text1 和 text2，返回这两个字符串的最长公共子序列的长度。
// 一个字符串的 子序列 是指这样一个新的字符串：
// 它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。
// 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。
// 两个字符串的「公共子序列」是这两个字符串所共同拥有的子序列。
// 若这两个字符串没有公共子序列，则返回 0。

// 示例 1:
// 输入：text1 = "abcde", text2 = "ace"
// 输出：3
// 解释：最长公共子序列是 "ace"，它的长度为 3。
 
// 示例 2:
// 输入：text1 = "abc", text2 = "abc"
// 输出：3
// 解释：最长公共子序列是 "abc"，它的长度为 3。
 
// 示例 3:
// 输入：text1 = "abc", text2 = "def"
// 输出：0
// 解释：两个字符串没有公共子序列，返回 0。
 
// 提示:
// 1 <= text1.length <= 1000
// 1 <= text2.length <= 1000
// 输入的字符串只含有小写英文字符。

func testLongestCommonSubsequence() {
//    let text1 = "abcde"
//    let text2 = "ace"
    let text1 = "ylqpejqbalahwr"
    let text2 = "yrkzavgdmdgtqpg"
    let s = LeetCode.longestCommonSubsequence2(text1, text2)
    print(s)
}

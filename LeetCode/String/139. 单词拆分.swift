//
//  139. 单词拆分.swift
//  String
//
//  Created by SaiDiCaprio on 2022/8/3.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/word-break

import Foundation

extension Solution {
    // 动态规划
//    00 ms 36.67%
//    14.1 MB 74.44%
//    时间复杂度：O(n^2)
//    空间复杂度：O(n)
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//        dp[i] 表示 s 的前 i 位是否可以用 wordDict 中的单词表示
        var dp = Array(repeating: false, count: s.count + 1)
//        初始化 dp[0]=true，空字符可以被表示。
        dp[0] = true
        // 遍历字符串的所有子串，遍历开始索引 i，遍历区间 [0,n)：
        for i in 0..<s.count {
            // 遍历结束索引 j，遍历区间 [i+1,n]
            for j in i+1...s.count {
                let sub = s[i..<j]
// 若 dp[i]=true 且 s[i,j) s[i,⋯,j) 在 wordlist 中：dp[j]=True。
// 解释：dp[i]=True 说明 s 的前 ii 位可以用 wordDict 表示，则 s[i,j)s[i,⋯,j) 出现在 wordDict 中，说明 s 的前 j 位可以表示
                if dp[i] && wordDict.contains(sub) {
                    dp[j] = true
                }
            }
        }
//        返回 dp[n]
        return dp[s.count]
    }
}

func test139WordBreak() {
//    let s = "apple", wordDict = ["apple", "pen"]
    let s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
    let x = LeetCode.wordBreak(s, wordDict)
    print(x)
}

//给你一个字符串 s 和一个字符串列表 wordDict 作为字典。请你判断是否可以利用字典中出现的单词拼接出 s 。
//注意：不要求字典中出现的单词全部都使用，并且字典中的单词可以重复使用。

//示例 1：
//输入: s = "leetcode", wordDict = ["leet", "code"]
//输出: true
//解释: 返回 true 因为 "leetcode" 可以由 "leet" 和 "code" 拼接成。
//
//示例 2：
//输入: s = "applepenapple", wordDict = ["apple", "pen"]
//输出: true
//解释: 返回 true 因为 "applepenapple" 可以由 "apple" "pen" "apple" 拼接成。
//     注意，你可以重复使用字典中的单词。
//
//示例 3：
//输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
//输出: false
//
//
//提示：
//1 <= s.length <= 300
//1 <= wordDict.length <= 1000
//1 <= wordDict[i].length <= 20
//s 和 wordDict[i] 仅有小写英文字母组成
//wordDict 中的所有字符串 互不相同

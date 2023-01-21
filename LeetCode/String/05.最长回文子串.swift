//
//  5.最长回文子串.swift
//  String
//
//  Created by SaiDiCaprio on 2022/1/21.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/longest-palindromic-substring

import Foundation

extension Solution {
    
    // 扩展中心法 优于动态规划 时间O(n^2) 空间无
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        let sChars = Array(s)
        
        var maxLen = 1, start = 0
        
        for i in 0..<sChars.count {
            // 总长度为奇数情况的搜索
            searchPalindrome(sChars, i, i, &start, &maxLen)
            // 总长度为偶数情况的搜索
            searchPalindrome(sChars, i, i + 1, &start, &maxLen)
        }
        
        return String(sChars[start..<start + maxLen])
    }
    
    private func searchPalindrome(_ chars: [Character], _ l: Int, _ r: Int,
                                  _ start: inout Int,
                                  _ maxLen: inout Int) {
        var l = l, r = r
        
        while l >= 0 && r < chars.count && chars[l] == chars[r] {
            l -= 1
            r += 1
        }
        
        if maxLen < r - l - 1 {
            start = l + 1
            maxLen = r - l - 1
        }
    }
    
    // 扩展中心法
    func longestPalindromeP1(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        let sChars = Array(s)
        
        var maxLen = 0, start = 0
        let collection = (1..<sChars.count - 1).reversed()
        for i in collection {
            // 总长度为奇数情况的搜索
            searchPalindrome(sChars, i, i, &start, &maxLen)
            // 总长度为偶数情况的搜索
            searchPalindrome(sChars, i, i + 1, &start, &maxLen)
        }
        
        return String(sChars[start..<start + maxLen])
    }

    // MARK: DP 方式求解
//    936 ms 10.42%
//    15.2 MB 5.21%
//    180 / 180
    func longestPalindromeDP(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        let chars = [Character](s)
        
        var maxLen = 1
        var subSequence = String(chars[0])
        
        var dp = Array(repeating: Array.init(repeating: false, count: s.count),
                       count: s.count)
        
                
        for i in (0..<s.count).reversed() {
            // 只填写右上角
            for j in i..<s.count {
                // 行和列 相等的直接返回 T
                guard j != i else {
                    dp[i][i] = true
                    continue
                }
                // 两头的字符必须相当 不相等下一个
                guard chars[i] == chars[j] else { continue }
                
                guard dp[i+1][j-1] || j - 1 < i + 1 else {
                    continue
                }
               
                dp[i][j] = true
                
                if j - i + 1 > maxLen {
                    maxLen = j - i + 1
                    subSequence = s[i...j]
                }
            }
        }
        
        let string = chars.map{ " \($0)  "}.joined(separator: " ")
        print("    " + string)
        let map = dp.map{ $0.map({ $0 ? "T" : "F" })  }
        for i in 0..<map.count {
            print( "\(chars[i]): \(map[i])")
        }
        
        return subSequence
    }
    
    // MARK: DP 方式求解
//    func longestPalindromeMLC(_ s: String) -> String {
//        let cs = preprocess(chars: [Character](s))
//        var m = Array.init(repeating: 0, count: cs.count)
//
//        print(m)
//
//        return ""
//    }
    
    private func preprocess(chars: [Character]) -> [Character] {
        var res = [Character](repeating: "#", count: chars.count * 2 + 3)
        
        res[0] = "^"
        res[chars.count * 2 + 2] = "$"
        for i in 0..<chars.count {
            let idx = (i + 1) * 2
            res[idx] = chars[i]
        }
        
        return res
    }

}

//       0 1 2 3 4
//       b a b a d
//  0 b  T   T
//  1 a    T   T
//  2 b      T   F
//  3 a        T
//  4 d          T

func testLongestPalindrome() {
    
//    let x = Solution.shared.longestPalindromeMLC("babad")
//    print(x)
}

//给你一个字符串 s，找到 s 中最长的回文子串。

//示例 1：
//输入：s = "babad"
//输出："bab"
//解释："aba" 同样是符合题意的答案。

//示例 2：
//输入：s = "cbbd"
//输出："bb"

//示例 3：
//输入：s = "a"
//输出："a"

//示例 4：
//输入：s = "ac"
//输出："a"

//提示：
//1 <= s.length <= 1000
//s 仅由数字和英文字母（大写和/或小写）组成

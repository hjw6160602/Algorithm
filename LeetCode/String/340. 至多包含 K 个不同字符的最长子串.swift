//
//  340. 至多包含 K 个不同字符的最长子串.swift
//  String
//
//  Created by 贺嘉炜 on 2022/8/5.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/longest-substring-with-at-most-k-distinct-characters

import Foundation

extension Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        guard k > 0 else {
            return 0
        }
        
        let s = Array(s)
        var start = 0, longest = 0, charsFreq = [Character: Int]()
        
        for (i, char) in s.enumerated() {
            if let freq = charsFreq[char] {
                charsFreq[char] = freq + 1
            } else {
                while charsFreq.count == k {
                    longest = max(i - start, longest)
                    
                    guard let freq = charsFreq[s[start]] else {
                        fatalError()
                    }
                    charsFreq[s[start]] = freq == 1 ? nil : freq - 1
                    
                    start += 1
                }
                
                charsFreq[char] = 1
            }
        }
        
        return max(longest, s.count - start)
    }
}

func test340LengthOfLongestSubstringKDistinct() {
    
}

//给定一个字符串 s ，找出 至多 包含 k 个不同字符的最长子串 T。

//示例 1:
//输入: s = "eceba", k = 2
//输出: 3
//解释: 则 T 为 "ece"，所以长度为 3。

//示例 2:
//输入: s = "aa", k = 1
//输出: 2
//解释: 则 T 为 "aa"，所以长度为 2。

//提示：
//1 <= s.length <= 5 * 104
//0 <= k <= 50

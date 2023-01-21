//
//  387.字符串中的第一个唯一字符.swift
//  String
//
//  Created by SaiDiCaprio on 2022/7/4.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/first-unique-character-in-a-string

import Foundation

extension Solution {

//    36 ms 86.57%
//    14.3 MB 47.76%
//    105 / 105
    func firstUniqChar(_ s: String) -> Int {
        var list = Array(repeating: 0, count: 26)
        for char in s {
            let index = Int(char.asciiValue!) - 97
            list[index] += 1
        }
        
        var index = -1
        // 继续便利 字符串 找到第一个统计结果为奇数的字符的index
        for (i, char) in s.enumerated() {
            let assic = Int(char.asciiValue!) - 97
            if (list[assic] == 1) {
                index = i
                break
            }
        }
        
        return index
    }
    
    func firstUniqCharP1(_ s: String) -> Int {
        return 0
    }
    
}

func test387FirstUniqChar() {
    let x = LeetCode.firstUniqChar("aadadaad")
    print(x)
}

//给定一个字符串 s ，找到 它的第一个不重复的字符，并返回它的索引 。如果不存在，则返回 -1 。

//示例 1：
//输入: s = "leetcode"
//输出: 0

//示例 2:
//输入: s = "loveleetcode"
//输出: 2

//示例 3:
//输入: s = "aabb"
//输出: -1

//提示:
//1 <= s.length <= 105
//s 只包含小写字母

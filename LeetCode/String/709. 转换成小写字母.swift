//
//  709. 转换成小写字母.swift
//  String
//
//  Created by 贺嘉炜 on 2022/7/2.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/to-lower-case

import Foundation

extension Solution {
//    4 ms 90.48%
//    14 MB 47.62%
    func toLowerCase(_ s: String) -> String {
        var res = [Character]()
        for char in s {
            var assii = char.asciiValue!
            guard assii > 64 && assii < 91 else {
                res.append(char)
                continue
            }
            assii |= 32
            res.append(Character(UnicodeScalar(assii)))
        }
        return String(res)
    }
}

func test709ToLowerCase() {
    let x = LeetCode.toLowerCase("Hello")
    print(x)
}


//给你一个字符串 s ，将该字符串中的大写字母转换成相同的小写字母，返回新的字符串。

//示例 1：
//输入：s = "Hello"
//输出："hello"

//示例 2：
//输入：s = "here"
//输出："here"

//示例 3：
//输入：s = "LOVELY"
//输出："lovely"

//提示：
//1 <= s.length <= 100
//s 由 ASCII 字符集中的可打印字符组成


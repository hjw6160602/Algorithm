//
//  14.最长公共前缀.swift
//  String
//
//  Created by SaiDiCaprio on 2021/3/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/longest-common-prefix

import Foundation

extension Solution {
    // 220ms
    func longestCommonPrefixSwift (_ strs: [String]) -> String {
        guard let firstStr = strs.first else { return "" }
        
        var res = ""
        
        for (i, char) in firstStr.enumerated() {
            // dropFirst(_ k: Int = 1) returns a Substring struct
            for str in strs.dropFirst() {
                if i == str.count { return res }
                // let index = str.index(str.startIndex, offsetBy: i)
                // let currentStrChar = str[index]
                // easy way: time complexity is linear though
                let currentStrChar = Array(str)[i]
                if char != currentStrChar {
                    return res
                }
            }
            res.append(char)
        }
        return res
    }
    
    // 查找字符串数组中的最长公共前缀  24ms
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        guard strs.count > 1 else { return strs.first! }
        
        var res = [Character]()
        var input = [[Character]].init(repeating: [], count: strs.count)
        
        var minIndex = 200
        var minChars = [Character]()
        for index in 0..<strs.count {
            let str = strs[index]
            let chars = [Character](str)
            // 记录了长度最小的那个串
            if str.count < minIndex {
                minIndex = str.count
                minChars = chars
            }
            input[index] = chars
        }
        
        for j in 0..<minIndex {
            let char = minChars[j]
            for k in 0..<input.count {
                let chars = input[k]
                
                guard chars[j] == char else {
                    return String(res)
                }
            }
            res.append(char)
        }
        
        return String(res)
    }
}

func testLongestCommonPrefix() {
    let strs = ["flower","flow","flight"]
//    let strs = ["dog","racecar","car"]
    let x = LeetCode.longestCommonPrefixSwift(strs) //fl
    print(x)
}


//如果不存在公共前缀，返回空字符串 ""。

//示例 1：
//输入：strs = ["flower","flow","flight"]
//输出："fl"

//示例 2：
//输入：strs = ["dog","racecar","car"]
//输出：""
//解释：输入不存在公共前缀。

//提示：
//0 <= strs.length <= 200
//0 <= strs[i].length <= 200
//strs[i] 仅由小写英文字母组成

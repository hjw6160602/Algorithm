//
//  49. 字母异位词分组.swift
//  Sort
//
//  Created by SaiDiCaprio on 2022/8/8.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/group-anagrams

import Foundation

extension Solution {
    
    //    * Time Complexity: O(nmlogm), m stands for the length of a word
    //    * Space Complexity: O(n)
    //        100 ms 58.18%
    //        16.2 MB 21.82%
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var sortedStrToStrs = [String: [String]]()
        
        for str in strs {
            let sortedStr = String(str.sorted())
            
            sortedStrToStrs[sortedStr, default: []].append(str)
        }
        
        return Array(sortedStrToStrs.values)
    }
    
//    超出时间限制
    func groupAnagramsP1(_ strs: [String]) -> [[String]] {
        var res = [[String]]()
        res.append([strs[0]])
        for i in 1..<strs.count {
            let str = strs[i]
            let cur = asccify(str)
            
            for j in 0...res.count {
                guard j != res.count else {
                    res.append([str])
                    break
                }
                var re = res[j]
                if (asccify(re[0]) == cur) {
                    re.append(str)
                    res[j] = re
                    break
                }
            }
        }
        return res
    }
    
    private func asccify(_ str: String) -> [Int] {
        var cur = Array(repeating: 0, count: 26)
        for char in str {
            let index = Int(char.asciiValue!) - 97
            cur[index] += 1
        }
        return cur
    }
}

func test49GroupAnagrams() {
//    let strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
    let strs =  ["ddddddddddg","dgggggggggg"]
//    [["dgggggggggg"],["ddddddddddg"]]
    let x = LeetCode.groupAnagramsP1(strs)
    print(x)
}

//给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。
//字母异位词 是由重新排列源单词的字母得到的一个新单词，所有源单词中的字母通常恰好只用一次。

//示例 1:
//输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
//输出: [["bat"],["nat","tan"],["ate","eat","tea"]]

//示例 2:
//输入: strs = [""]
//输出: [[""]]

//示例 3:
//输入: strs = ["a"]
//输出: [["a"]]

//提示：
//1 <= strs.length <= 104
//0 <= strs[i].length <= 100
//strs[i] 仅包含小写字母

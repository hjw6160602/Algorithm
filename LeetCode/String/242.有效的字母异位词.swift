//
//  242.有效的字母异位词.swift
//  Array
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/valid-anagram

import Foundation

extension Solution {
    // 利用两个字典去做统计
    
//    执行用时：8 ms  击败了 97.40% 的用户
//    内存消耗15.4 MB 击败了 16.45% 的用户
//    通过测试用例：36 / 36
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sCharsFreq = Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +)
        let tCharsFreq = Dictionary(t.map { ($0, 1) }, uniquingKeysWith: +)
        
        return sCharsFreq == tCharsFreq
    }
    
//    执行用时：8 ms  击败了97.40%
//    内存消耗：13.9 MB 击败了58.44%
//    通过测试用例：36 / 36
    func isAnagramP1(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        var sCharsFreq = Array(repeating: 0, count: 26)
        var tCharsFreq = Array(repeating: 0, count: 26)
        for char in s {
            let index = char.unicodeScalars.first!.value - 97
            sCharsFreq[Int(index)] += 1
        }
        
        for char in t {
            let index = char.unicodeScalars.first!.value - 97
            tCharsFreq[Int(index)] += 1
        }

        return sCharsFreq == tCharsFreq
    }
    
}

func testIsAnagram() {
    let s = Solution.shared.isAnagramP1("rat", "car")
    print(s)
}

//给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

//注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。

//示例 1:

//输入: s = "anagram", t = "nagaram"
//输出: true
//示例 2:

//输入: s = "rat", t = "car"
//输出: false

//提示:

//1 <= s.length, t.length <= 5 * 104
//s 和 t 仅包含小写字母

//进阶: 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？

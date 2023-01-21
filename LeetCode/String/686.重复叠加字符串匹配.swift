//
//  686.重复叠加字符串匹配.swift
//  String
//
//  Created by 贺嘉炜 on 2022/4/25.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/repeated-string-match/

import Foundation

extension Solution {
//    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
//        guard a != b else { return 1 }
//        let ori = Array(a), target = Array(b)
//        guard a.count < b.count else {
//            if a.contains(b) {
//                return 1
//            }
//            if (a + a).contains(b) {
//                return 2
//            }
//            return -1
//        }
//        var _1stIdx = _firstIndex(target, ori)
//        guard j > 0 else { return -1 }
//
//        let prefix = (j != 0)
//        // 如果有前缀 那么重复次数为-1开始
//        var repeatCnt = j > 0 ? -1 : 0
//
//        for i in _1stIdx..<target.count {
//            if j == ori.count {
//                repeatCnt += 1
//                j = 0
//            }
//            // 一旦发现字符不匹配
//            if target[i] != ori[j] {
//                return -1
//            }
//            j += 1
//        }
//
//        // 没找到重复的 返回-1
////        if repeatCnt == 0 { return -1 }
//        // 有前缀 重复次数需要+1
//        if prefix { repeatCnt += 1 }
//        // 有后缀需要repeatCnt+1 无后缀少判断一次也需要加一
//        return repeatCnt + 1
//    }
    
    private func _firstIndex(_ hChars: [Character], _ nChars: [Character]) -> Int {
        let hLen = hChars.count, nLen = nChars.count
        for i in 0...hLen - nLen {
            if hChars[i] == nChars[0] {
                for j in 0..<nLen {
                    if hChars[i + j] != nChars[j] {
                        break
                    }
                    if j + 1 == nLen {
                        return i
                    }
                }
            }
        }
        
        return -1
    }
    
//    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
//
//        let origin = Array(a), target = Array(b)
//
//        var res = 0
//        var index = 0
//        for char in target {
//            guard char == origin[index] else {
//                index = 0
//                continue
//            }
//
//            if index == (origin.count - 1) {
//                index = 0
//                res += 1
//            } else {
//                index += 1
//            }
//
//
//        }
//
//        return res > 0 ? res : -1
//    }
    
}

func test686repeatedStringMatch() {
//    let a = "abcd", b = "cdabcdab" // 3
//    let a = "aa", b = "a" // 1
//    let a = "aaaaaaaaaaaaaaaaaaaaaab", b = "ba" //2
//    let a = "a", b = "a" //1
//    let a = "abc", b = "wxyz"
//    let a = "abcd", b = "cdabcdab"
//    let a = "aaac", b = "aac"
//    let a = "baa", b = "abaab" // 3
//    let x = LeetCode.repeatedStringMatch(a, b)
//    print(x)
}

//686. 重复叠加字符串匹配
//给定两个字符串 a 和 b，寻找重复叠加字符串 a 的最小次数，使得字符串 b 成为叠加后的字符串 a 的子串，如果不存在则返回 -1。
//
//注意：字符串 "abc" 重复叠加 0 次是 ""，重复叠加 1 次是 "abc"，重复叠加 2 次是 "abcabc"。
//
//示例 1：
//输入：a = "abcd", b = "cdabcdab"
//输出：3
//解释：a 重复叠加三遍后为 "abcdabcdabcd", 此时 b 是其子串。
//
//示例 2：
//输入：a = "a", b = "aa"
//输出：2
//
//示例 3：
//输入：a = "a", b = "a"
//输出：1
//
//示例 4：
//输入：a = "abc", b = "wxyz"
//输出：-1
//
//
//提示：
//1 <= a.length <= 104
//1 <= b.length <= 104
//a 和 b 由小写英文字母组成

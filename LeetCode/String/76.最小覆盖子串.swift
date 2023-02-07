//
//  76.最小覆盖子串.swift
//  String
//
//  Created by 贺嘉炜 on 2023/2/7.
//  Copyright © 2023 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/minimum-window-substring/description/

import Foundation


extension Solution {
//    44 ms 4.19% 内存
//    16 MB 35.48%
    func minWindow(_ s: String, _ t: String) -> String {
        var s = [Character](s), t = [Character](t)
    
        var need = [Character: Int](), window = [Character: Int]()
        
        for c in t {
            need[c, default: 0] += 1
        }
        
        var valid = 0
        var left = 0, right = 0
        // 记录最小覆盖子串的 起始索引 以及其长度
        var start = 0, len = Int.max
        while right < s.count {
            // c是将要移入窗口的字符
            let c = s[right]
            // 扩大窗口
            right += 1
            
            // 进行窗口内数据的一系列更新
            if need[c] == nil {
                continue
            }
            window[c, default: 0] += 1
            // 窗口中字符数量达到所需数量时，匹配数+1
            if window[c] == need[c] {
                valid += 1
            }
            
            // 判断左侧窗口是否需要收紧
            while valid == need.count {
                // 这里更新最小覆盖子串
                if right - left < len {
                    start = left
                    len = right - left
                }
                // d 是将要移出窗口的字符
                let d = s[left]
                // 缩小窗口
                left += 1
                //进行窗口内数据的一系列更新
                if need[d] == nil { continue }
                
                if window[d] == need[d] {
                    valid -= 1
                }
                window[d]! -= 1
            }
        }
        // 返回最小覆盖子串
        return (len == Int.max) ? "" : String(s[start..<(start+len)])
    }
}

func testminWindow() {
    let x = LeetCode.minWindow("ADOBECODEBANC", "ABC")
    print(x)
}

//
//  28.实现strStr.swift
//  String
//
//  Created by 贺嘉炜 on 2022/4/1.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
//    0 ms 100.00%
//    14.1 MB 91.50%
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else { return 0 }
        guard haystack.count >= needle.count else { return -1 }
        
        let Haystack = [Character](haystack)
        let Needle = [Character](needle)
        
        for i in 0...(Haystack.count - Needle.count) {
            // 如果首字母都不相等那么不用比了
            guard Haystack[i] == Needle[0] else { continue }
            // 从第1个开始比较 因为第0个已经比较过了
            var isEqual = true
            for j in 1..<Needle.count {
                if Haystack[i + j] != Needle[j] {
                    // 只要发现一个不相等的那么比较结束
                    isEqual = false
                    break
                }
            }
            if isEqual { // 如果找到相等了直接返回i
                return i
            } else if i == Haystack.count - Needle.count {
                // 没找到
                return -1
            }
        }
        return -1
    }
    
    func strStrSwift(_ haystack: String, _ needle: String) -> Int {
        let hChars = Array(haystack), nChars = Array(needle)
        let hLen = hChars.count, nLen = nChars.count
        
        guard hLen >= nLen else { return -1 }
        guard nLen != 0 else { return 0 }
        
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
}

func testIndexOf() {
    let x = LeetCode.strStr("aaa", "aaaa")
    print(x)
}

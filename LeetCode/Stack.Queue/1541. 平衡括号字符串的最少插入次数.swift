//
//  1541. 平衡括号字符串的最少插入次数.swift
//  Stack.Queue
//
//  Created by 贺嘉炜 on 2023/3/5.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func test1541minInsertions() {
    let s = "())"
    let x = LeetCode.minInsertions(s)
    print(x)
}

extension Solution {
//    28 ms 5%
//    15.9 MB
    func minInsertions(_ s: String) -> Int {
        let s = Array(s)
        var res = 0, need = 0
        for i in 0..<s.count {
            if s[i] == "(" {
                need += 2
                // 当遇到左括号时，若对右括号的需求量为奇数，
                // 需要在当前s[i]的前面位置插入 1 个')' 这里是本题的难点
                if need & 1 == 1 {
                    // 插入一个')'
                    res += 1
                    // 对')'的需求减一
                    need -= 1
                }
                continue
            }
            // 来到这里证明 s[i] == ')'
            need -= 1
            if need == -1 {
//                意味着我们遇到一个多余的右括号，显然需要插入一个左括号
                res += 1
                // 这里还需要对右边增加一个')'才行所以need需要恢复为1
                need = 1
            }
        }
        return res + need
    }
    
//    44 ms 25%
//    18.9 MB
    func minInsertionsOld(_ s: String) -> Int {
        let s = Array(s)
        var stack = [Character]()
        var res = 0
        var i = 0
        while i < s.count {
            let char = s[i]
            if char == "(" {
                stack.append(char)
                i += 1
                continue
            }
            // 来到这里证明 char == ')'
            if stack.last != nil {
                stack.removeLast()
                if i+1 == s.count {
                    // 证明char就是最后一位, 需要在末尾添加一个')'
                    res += 1
                    i += 1
                } else if s[i+1] == ")" {
                    // 能够让一个 '(' 匹配到两个连续的'))'
                    i += 2
                } else {
                    // 只能匹配到一个')', 需要在后面添加一个')'
                    res += 1
                    i += 1
                }
            } else {
                // 如果栈里面没有元素证明来到了一个新的位置
                if i+1 == s.count {
                    // 证明char就是最后一位, 需要在末尾添加一个')',并且在前面添加一个'('
                    res += 2
                    i += 1
                } else if s[i+1] == ")" {
                    // 能够让一个 '(' 匹配到两个连续的'))'
                    res += 1
                    i += 2
                } else {
                    res += 2
                    i += 1
                }
            }
        }
        return res + stack.count * 2
    }
}

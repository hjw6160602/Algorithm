//
//  20.有效的字符串.swift
//  Stack.Queue
//
//  Created by SaiDiCaprio on 2021/3/10.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/valid-parentheses

import Foundation

extension Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        // 构造一个映射匹配的map
        let map: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else {
                if stack.last == map[char] {
                    // 如果 栈顶的元素和 char 匹配 就pop栈顶
                    _ = stack.popLast()
                } else {
                    // 不匹配则入栈
                    stack.append(char)
                }
            }
        }
//        print(String(stack))
        return stack.count == 0
    }
    
    // 空间复杂度O(1)
    func isValidSwift(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else if char == ")" {
                guard stack.count != 0 && stack.removeLast() == "(" else {
                    return false
                }
            } else if char == "]" {
                guard stack.count != 0 && stack.removeLast() == "[" else {
                    return false
                }
            } else if char == "}" {
                guard stack.count != 0 && stack.removeLast() == "{" else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
    
    
//    4 ms 67.27%
//    13.9 MB 86.33%
    func isValidP1(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            if char == "{" || char == "[" || char == "(" {
                stack.append(char)
                continue
            }
            if let last = stack.last,
               last == leftOf(char) {
                _ = stack.popLast()
            } else {
                return false
            }
        }
        
        return stack.count == 0
    }
    
    private func leftOf(_ c: Character) -> Character {
        if c == "}" {
            return "{"
        }
        if c == ")" {
            return "("
        }
        return "["
    }
    
}

func testIsValidBracket() {
    let isValid = LeetCode.isValidP1("{[[]}")
    print(isValid)
}


//给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
//有效字符串需满足：
//左括号必须用相同类型的右括号闭合。
//左括号必须以正确的顺序闭合。

//示例 1：
//输入：s = "()"
//输出：true

//示例 2：
//输入：s = "()[]{}"
//输出：true

//示例 3：
//输入：s = "(]"
//输出：false

//示例 4：
//输入：s = "([)]"
//输出：false

//示例 5：
//输入：s = "{[]}"
//输出：true

//提示：
//1 <= s.length <= 104
//s 仅由括号 '()[]{}' 组成

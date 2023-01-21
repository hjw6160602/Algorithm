//
//  151.反转字符串里的单词.swift
//  String
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
//  https://leetcode-cn.com/problems/reverse-words-in-a-string/

import Foundation

extension Solution {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }
    
    /// 要求原地翻转 不允许开辟空间
    func reverseURL(_ url: String) -> String {
        var chars = [Character](url)
        _reverseString(&chars, begin: 0, end: url.count - 1)
        print(String(chars))
        
        var dotIndex = [(Int, Int)]()
        var begin = 0
        for index in 0..<url.count - 1 {
            if chars[index] == " " {
                dotIndex.append((begin, index - 1))
                begin = index + 1
            }
        }
        dotIndex.append((begin, url.count - 1))
        
        print(dotIndex)
        for range in dotIndex {
            _reverseString(&chars, begin: range.0, end: range.1)
            print(String(chars))
        }
        
        return String(chars)
    }
    
    private func _reverseString(_ chars: inout [Character], begin: Int, end: Int) {
        let mid = (end - begin + 1) >> 1
        for index in 0..<mid {
            (chars[begin + index], chars[end - index]) = (chars[end - index], chars[begin + index])
        }
    }
    
//    MARK: - 不调用系统方法 手动翻转
//    执行用时：24 ms 击败了 65.33%
//    内存消耗：13.7 MB 击败了 89.33%
//    通过测试用例：58 / 58
    func reverseWordsP1(_ s: String) -> String {
        guard s.count > 0 else { return s }
        
        var filtered = [Character]()
        // 这里在尾巴后面新增一个空格
        // 来避免后面for循环结束之后是否再次reverse的判断
        removeNeedlessSpace(s + " ", chars: &filtered)
        
        // 2.整体先翻转一遍字符串
        let end = filtered.count - 2
        reverseCharacter(chars: &filtered, begin: 0, end: end)

        // 3.针对碰到空格的位置再翻转一遍
        var begin = 0
        for index in 1..<filtered.count {
            guard filtered[index] == " " else {
                continue
            }
            // 来到这里证明遇到了空格
            reverseCharacter(chars: &filtered, begin: begin, end: index - 1)
            begin = index + 1
        }
        
        return String(filtered[0...end])
    }
    
    private func removeNeedlessSpace(_ s: String, chars filtered: inout [Character]) {
        // 这里初始值设置为true 确保删除头部字符串
        var hasSpace = true
        // 1.取出字符串中的多余空格
        for char in s {
            guard char == " " else {
                hasSpace = false
                filtered.append(char)
                continue
            }
            // 来到这里证明是空格字符
            // 重复空格直接continue
            guard !hasSpace else { continue }
            // 非重复空格添加上去
            hasSpace = true
            filtered.append(" ")
        }
    }
    
    private func reverseCharacter(chars: inout [Character], begin: Int, end: Int) {
        let mid = (end - begin + 1) >> 1
        for i in 0..<mid {
            (chars[begin + i], chars[end - i]) =  (chars[end - i], chars[begin + i])
        }
    }

//    MARK: - 头条代码
//    标题：URL反转
//    描述信息
//    给定形如 `www.toutiao.com` 的 URL，将其转换成 `com.toutiao.www` 的形式，要求必须原地操作
    func reverseURLTouTiao(_ url: String) -> String {
        guard url.count > 0 else { return url }
        
        var chars = [Character](url)
        reverseCharacter(chars: &chars, begin: 0, end: chars.count - 1)
        var begin = 0
        for index in 1..<chars.count {
            guard chars[index] == "." else { continue }
            // 来到这里证明遇到了空格
            reverseCharacter(chars: &chars, begin: begin, end: index - 1)
            begin = index + 1
        }
        // 最后一部分还需要手动再翻转一次
        reverseCharacter(chars: &chars, begin: begin, end: chars.count - 1)
        return String(chars)
    }
    
}

func testReverseWords() {
//    "moc.oaituot.www"
//    "com.toutiao.www"
//    let x = LeetCode.reverseWordsP1("the     sky is blue")
//    let x = LeetCode.reverseWordsP1("  hello world! ")
//    let x = LeetCode.reverseWordsP1("Alice does not even like bob")
//    print(x)
    
    let x = LeetCode.reverseURLTouTiao("www.toutiao.com")
    print(x)
}

//151. 翻转字符串里的单词
//给定一个字符串，逐个翻转字符串中的每个单词。

//说明：
//无空格字符构成一个 单词 。
//输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
//如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。

//示例 1：
//输入："the sky is blue"
//输出："blue is sky the"

//示例 2：
//输入："  hello world!  "
//输出："world! hello"
//解释：输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。

//示例 3：
//输入："a good   example"
//输出："example good a"
//解释：如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。

//示例 4：
//输入：s = "  Bob    Loves  Alice   "
//输出："Alice Loves Bob"

//示例 5：
//输入：s = "Alice does not even like bob"
//输出："bob like even not does Alice"

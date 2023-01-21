//
//  17. 电话号码的字母组合.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/2/23.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number

import Foundation

//0 ms 100.00%
//14 MB 25.47%
class LetterCombination {

    var digits: String = ""
    
    let numberToStr = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
    
    var combinations: [String] = []
    
    var combination: String = ""
    
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return [String]()
        }
        self.digits = digits
        dfs(0)
        return combinations
    }
    
    // 深度优先搜索 正在搜索第idx层
    private func dfs(_ index: Int) {
        // 已经进入到最后一层了，不能再深入
        if combination.count == digits.count {
            // 得到了一个正确的解
            combinations.append(combination)
            return
        }
        
        // 先枚举这一层可以做的所有选择
        let currentStr = fetchCurrentStr(at: index)
        
        for char in currentStr {
            combination.append(char)
            dfs(index + 1)
            combination.removeLast()
        }
        
    }
    private func fetchCurrentStr(at index: Int) -> String {
        guard index >= 0 && index < digits.count else {
            fatalError("Invalid index")
        }
        
        let currentDigitChar = digits[digits.index(digits.startIndex, offsetBy: index)]
        
        guard let currentDigit = Int(String(currentDigitChar)),
              currentDigit >= 0,
                currentDigit < numberToStr.count else {
            fatalError("Invalid digits")
        }
        
        return numberToStr[currentDigit]
    }
    
}

// 4 ms 68.94%
// 13.8 MB 70.81%
class LetterCombinationP1 {

    let numberToStr = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]

    var combination = ""
    // 返回结果 字符串数组
    var res = [String]()

    var digits = ""

    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return [String]()
        }
        self.digits = digits
        _dfs(idx: 0)
        return res
    }

    private func _dfs(idx: Int) {
        // 先枚举这一层可以做的选择
        guard idx < digits.count else {
            // 已经进入到最后一层了 不能再深入
            res.append(combination)
            return
        }
        // 取到当前这层的键盘对应的字母
        let cur: String = digits[idx]
        guard let curNum = Int(cur) else {
            fatalError("Invalid index")
        }
        
        let chars = numberToStr[curNum]

        for char in chars {
            combination.append(char)
            _dfs(idx: idx + 1)
            combination.removeLast()
        }
    }
}

//    4 ms 68.94%
//    14.1 MB 16.77%

class LetterCombinationP2 {

    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return [String]()
        }
        var combinations = [String](), combination = ""
        _dfs(idx: 0,
             combination: &combination,
             res: &combinations,
             digits: digits,
             num2Str: ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"])
        return combinations
    }

    private func _dfs(idx: Int,
                      combination: inout String,
                      res: inout [String],
                      digits: String,
                      num2Str: [String]) {
        // 先枚举这一层可以做的选择
        guard idx < digits.count else {
            // 已经进入到最后一层了 不能再深入
            res.append(combination)
            return
        }
        // 取到当前这层的键盘对应的字母
        let cur: String = digits[idx]
        guard let curNum = Int(cur) else {
            fatalError("Invalid index")
        }
        
        let chars = num2Str[curNum]

        for char in chars {
            combination.append(char)
            _dfs(idx: idx + 1,
                 combination: &combination,
                 res: &res,
                 digits: digits,
                 num2Str: num2Str)
            combination.removeLast()
        }
    }
}

func testLetterCombinations() {
    let lc = LetterCombinationP2()
    let r = lc.letterCombinations("23")
    print(r)
}

//给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
//给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

//示例 1：
//
//输入：digits = "23"
//输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]

//示例 2：
//
//输入：digits = ""
//输出：[]

//示例 3：
//
//输入：digits = "2"
//输出：["a","b","c"]

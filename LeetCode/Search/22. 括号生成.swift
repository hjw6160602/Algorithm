//
//  22. 括号生成.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/2/25.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/generate-parentheses

import Foundation

class GenerateParenthesis {
    
    var capacity = 0
    
    func generateParenthesis(_ n: Int) -> [String] {
        var res: [String] = []
        var string = ""
        self.capacity = n << 1
        dfs(idx: 0, lRemain: n, rRemain: n, path: &string, res: &res)
        return res
    }
    
    /**
     * - idx 搜索的层号
     * - lRemain 左括号的剩余数量
     * - rRemain 右括号的剩余数量
     * - string 用来存放每一层的选择
     * - res 最终的返回结果
     */
    private func dfs(idx: Int,
                     lRemain: Int,
                     rRemain: Int,
                     path: inout String,
                     res: inout [String]) {
        if idx == capacity {
            res.append(path)
            return
        }
        // 枚举这一层所有可能的选择
        // 选择一种可能之后，进入下一层搜索

        // 什么情况可以选择左括号？左括号的数量 > 0
        // 选择左括号，然后进入下一层搜索
        if lRemain > 0 {
            path.append("(")
            dfs(idx: idx + 1, lRemain: lRemain - 1, rRemain: rRemain, path: &path, res: &res)
            path.removeLast()
        }

        // 当左括号、右括号的数量一样时，只能选择左括号
        // 什么情况可以选择右括号？(右括号的数量 > 0) && (右括号的数量 != 左括号的数量)
        // 选择右括号，然后进入下一层搜索
        if rRemain > 0 && lRemain != rRemain {
            path.append(")")
            dfs(idx: idx + 1, lRemain: lRemain, rRemain: rRemain - 1, path: &path, res: &res)
            path.removeLast()
        }
    }
    
    
}

class GenerateParenthesisP1 {
    ///
    var capacity = 0
    ///
    var parenthesis = ""
    ///
    var res = [String]()
    
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [String]() }
        
        self.capacity = n << 1
        _dfs(idx: 0, lRemain: n, rRemain: n)
        return res
    }
    
    private func _dfs(idx: Int, lRemain: Int, rRemain: Int) {
        guard idx < self.capacity else {
            res.append(parenthesis)
            return
        }
        
        if lRemain > 0 {
            parenthesis.append("(")
            _dfs(idx: idx + 1, lRemain: lRemain - 1, rRemain: rRemain)
            parenthesis.removeLast()
        }
        
        if rRemain > 0 && lRemain < rRemain {
            parenthesis.append(")")
            _dfs(idx: idx + 1, lRemain: lRemain, rRemain: rRemain - 1)
            parenthesis.removeLast()
        }
    }
}

func testGenerateParenthesis() {
    let s = GenerateParenthesisP1()
    let res = s.generateParenthesis(3)
    print(res)
}

//数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

//示例 1：
//输入：n = 3
//输出：["((()))","(()())","(())()","()(())","()()()"]

//示例 2：
//输入：n = 1
//输出：["()"]

//提示：
//1 <= n <= 8


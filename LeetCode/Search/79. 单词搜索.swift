//
//  79. 单词搜索.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/8/15.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/word-search

import Foundation


extension Solution {
//    func exist(_ board: [[Character]], _ word: String) -> Bool {
//        let m = board.count, n = board[0].count
//        var visted = Array(repeating: Array.init(repeating: false, count: n),
//                           count: m)
//        var depth = 0
//        _dfs(board, word, m,  n, &visted, 0, 0, &depth)
//        return depth == word.count
//    }
//
//    private func _dfs(_ board: [[Character]],  _ word: String, _ m: Int, _ n: Int,
//                      _ visted: inout [[Bool]], _ i: Int, _ j: Int, _ depth: inout Int){
//        guard depth < word.count else {
//            return
//        }
//
//        guard board[i][j] == word[depth] else {
//            return
//        }
//
//        depth += 1
//        visted[i][j] = true
//
//        if i - 1 > 0 {
//            _dfs(board, word, m,  n, &visted, i - 1, j, &depth)
//        }
//        if i + 1 < m {
//            _dfs(board, word, m,  n, &visted, i + 1, j, &depth)
//        }
//        if j - 1 > 0 {
//            _dfs(board, word, m,  n, &visted, i, j - 1, &depth)
//        }
//        if j + 1 < n {
//            _dfs(board, word, m,  n, &visted, i, j + 1, &depth)
//        }
//
//    }
    
//    124 ms 93.68%
//    14.1 MB 35.79%
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            return false
        }
        
        let m = board.count
        let n = board[0].count
        var visited = Array(repeating: Array.init(repeating: false, count: n),
                                   count: m)
        let wordContent = [Character](word)
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == wordContent[0] && _dfs(board, wordContent, m, n, i, j, &visited, 0) {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func _dfs(_ board: [[Character]], _ wordContent: [Character], _ m: Int, _ n: Int, _ i: Int, _ j: Int, _ visited: inout [[Bool]], _ index: Int) -> Bool {
        if index == wordContent.count {
            return true
        }
        
        guard i >= 0 && i < m && j >= 0 && j < n else {
            return false
        }
        guard !visited[i][j] && board[i][j] == wordContent[index] else {
            return false
        }
        
        visited[i][j] = true
        
        if _dfs(board, wordContent, m, n, i + 1, j, &visited, index + 1) || _dfs(board, wordContent, m, n, i - 1, j, &visited, index + 1) || _dfs(board, wordContent, m, n, i, j + 1, &visited, index + 1) || _dfs(board, wordContent, m, n, i, j - 1, &visited, index + 1) {
            return true
        }
        visited[i][j] = false
        
        return false
    }
    
}

//extension String {
//    subscript (i: Int) -> Character {
//        return self[self.index(self.startIndex, offsetBy: i)]
//    }
//}


func test79Exist() {
    let board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
    let x = LeetCode.exist(board, word)
    print(x)
}

//给定一个 m x n 二维字符网格 board 和一个字符串单词 word
//如果 word 存在于网格中，返回 true 否则，返回 false

//单词必须按照字母顺序，通过相邻的单元格内的字母构成，
//其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。
//同一个单元格内的字母不允许被重复使用。

//示例 1：
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
//输出：true

//示例 2：
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
//输出：true

//示例 3：
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
//输出：false

//提示：
//m == board.length
//n = board[i].length
//1 <= m, n <= 6
//1 <= word.length <= 15
//board 和 word 仅由大小写英文字母组成

//进阶：你可以使用搜索剪枝的技术来优化解决方案，使其在 board 更大的情况下可以更快解决问题？

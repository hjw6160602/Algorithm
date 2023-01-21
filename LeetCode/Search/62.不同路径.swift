//
//  62.不同路径.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/8/5.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/unique-paths/

import Foundation

extension Solution {
    // 超出时间限制
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var path = 0
        _dfs(0, 0, m, n, path: &path)
        return path
    }
    
    private func _dfs(_ i: Int, _ j: Int, _ m: Int, _ n: Int, path: inout Int) {
        guard i < m && j < n else {
            return
        }
        if i == m - 1 && j == n - 1 {
            path += 1
            return
        }
        _dfs(i + 1, j, m, n, path: &path)
        _dfs(i, j + 1, m, n, path: &path)
    }
}

func testUniquePaths() {
    let m = 3, n = 3
    let x = LeetCode.uniquePaths(m, n)
    print(x)
}


//一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。
//机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。
//问总共有多少条不同的路径？

//示例 1：
//输入：m = 3, n = 7
//输出：28

//示例 2：
//输入：m = 3, n = 2
//输出：3
//解释：
//从左上角开始，总共有 3 条路径可以到达右下角。
//1. 向右 -> 向下 -> 向下
//2. 向下 -> 向下 -> 向右
//3. 向下 -> 向右 -> 向下
//
//示例 3：
//输入：m = 7, n = 3
//输出：28
//
//示例 4：
//输入：m = 3, n = 3
//输出：6
//
//提示：
//1 <= m, n <= 100
//题目数据保证答案小于等于 2 * 109

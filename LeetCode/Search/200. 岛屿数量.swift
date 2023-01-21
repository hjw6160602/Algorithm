//
//  200. 岛屿数量.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/7/21.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/number-of-islands

import Foundation

extension Solution {
    
//    208 ms 91.11%
//    16.9 MB 11.66%
//    49 / 49
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0, grid = grid
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                guard grid[i][j] == Character("1") else { continue }
                _dfs(&grid, x: i, y: j)
                count += 1
            }
        }
        return count
    }
    
    private func _dfs(_ grid: inout [[Character]], x: Int, y: Int) {
        guard x >= 0 && x < grid.count,
              y >= 0 && y < grid[0].count,
              grid[x][y] != Character("0") else {
            return
        }
        // 这里将当前节点标记为已经访问过了
        grid[x][y] = Character("0")
        // 右
        _dfs(&grid, x: x, y: y + 1)
        // 下&
        _dfs(&grid, x: x + 1, y: y)
        // 左&
        _dfs(&grid, x: x - 1, y: y)
        // 上&
        _dfs(&grid, x: x, y: y - 1)
    }
}

func test200NumIslands() {
    var grid: [[Character]] = [
      ["1","1","1","1","0"],
      ["1","1","0","1","0"],
      ["1","1","0","0","0"],
      ["0","0","0","0","0"]
    ]
    grid = [
      ["1","1","0","0","0"],
      ["1","1","0","0","0"],
      ["0","0","1","0","0"],
      ["0","0","0","1","1"]
    ]
    let x = LeetCode.numIslands(grid)
    print(x)
}

//给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
//岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。
//此外，你可以假设该网格的四条边均被水包围。

//示例 1：
//输入：grid = [
//  ["1","1","1","1","0"],
//  ["1","1","0","1","0"],
//  ["1","1","0","0","0"],
//  ["0","0","0","0","0"]
//]
//输出：1

//示例 2：
//输入：grid = [
//  ["1","1","0","0","0"],
//  ["1","1","0","0","0"],
//  ["0","0","1","0","0"],
//  ["0","0","0","1","1"]
//]
//输出：3

//提示：
//m == grid.length
//n == grid[i].length
//1 <= m, n <= 300
//grid[i][j] 的值为 '0' 或 '1'

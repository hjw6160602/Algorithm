//
//  994. 腐烂的橘子.swift
//  BreadthFirstSearch
//
//  Created by 贺嘉炜 on 2022/4/12.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/rotting-oranges/

import Foundation


extension Solution {
    
    typealias Axis = (row: Int, col: Int)
    
//    12 ms 86.96%
//    13.9 MB 26.09%
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        
        typealias Axis = (row: Int, col: Int)
        // 广度优先搜索需要入队
        var queue = [Axis]()
        
        var freshCount = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    freshCount += 1
                } else if grid[i][j] == 2 {
                    queue.append((i, j))
                }
            }
        }
        
        var grid = grid, depth = 0
        
        while freshCount > 0 && !queue.isEmpty {
            // 广度优先搜索的深度 层数
            depth += 1
            // 每一层的个数
            let count = queue.count
            for _ in 0..<count {
                // 这里是移除队列头部的元素 而不是
                let orangeIdx = queue.removeFirst()
                let row = orangeIdx.row
                let col = orangeIdx.col
                // up
                if row - 1 >= 0 && grid[row - 1][col] == 1 {
                    grid[row - 1][col] = 2
                    freshCount -= 1
                    queue.append((row - 1, col))
                }
                // down
                if row + 1 < m && grid[row + 1][col] == 1 {
                    grid[row + 1][col] = 2
                    freshCount -= 1
                    queue.append((row + 1, col))
                }
                // left
                if col - 1 >= 0 && grid[row][col - 1] == 1 {
                    grid[row][col - 1] = 2
                    freshCount -= 1
                    queue.append((row, col - 1))
                }
                // right
                if col + 1 < n && grid[row][col + 1] == 1 {
                    grid[row][col + 1] = 2
                    freshCount -= 1
                    queue.append((row, col + 1))
                }
            }
        }
        
        if freshCount > 0 {
            return -1
        } else {
            return depth
        }
    }
}


func testOrangesRotting() {
    let res = LeetCode.orangesRotting([[2,1,1],[1,1,0],[0,1,1]])
    print(res)
}


//在给定的 m x n 网格 grid 中，每个单元格可以有以下三个值之一：

//值 0 代表空单元格；
//值 1 代表新鲜橘子；
//值 2 代表腐烂的橘子。
//每分钟，腐烂的橘子 周围 4 个方向上相邻 的新鲜橘子都会腐烂。
//返回 直到单元格中没有新鲜橘子为止所必须经过的最小分钟数。如果不可能，返回 -1 。

//示例 1：
//输入：grid = [[2,1,1],[1,1,0],[0,1,1]]
//输出：4

//示例 2：
//输入：grid = [[2,1,1],[0,1,1],[1,0,1]]
//输出：-1
//解释：左下角的橘子（第 2 行， 第 0 列）永远不会腐烂，因为腐烂只会发生在 4 个正向上。

//示例 3：
//输入：grid = [[0,2]]
//输出：0
//解释：因为 0 分钟时已经没有新鲜橘子了，所以答案就是 0 。
//
//
//提示：
//
//m == grid.length
//n == grid[i].length
//1 <= m, n <= 10
//grid[i][j] 仅为 0、1 或 2

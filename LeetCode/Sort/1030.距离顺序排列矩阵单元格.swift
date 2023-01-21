//
//  1030.距离顺序排列矩阵单元格.swift
//  Sort
//
//  Created by 贺嘉炜 on 2022/6/20.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/matrix-cells-in-distance-order


import Foundation

extension Solution {
//    116 ms 100.00%
//    15.2 MB 50.00%
//    66 / 66
    func allCellsDistOrder(_ rows: Int, _ cols: Int, _ rCenter: Int, _ cCenter: Int) -> [[Int]] {
        
        var re = Array(repeating: Array(repeating: 0, count: 2),
                       count: rows * cols)
        
        re[0] = [rCenter, cCenter]
        // 4个方向的向量 ↘ ↙ ↖ ↗ 四个方向
        let dr = [1, 1, -1, -1]
        let dc = [1, -1, -1, 1]
        
        var row = rCenter, col = cCenter
        
        var index = 1
        while (index < rows * cols) {
            // 从上顶点开始 进行下一个距离更大的外圈
            row -= 1
            // 同一个i，即为相同的前进方向（分别先后到达上、右、下、左、上顶点）
            for j in 0..<4 { // 四个方向
                // ↘ j = 0 && row = rCenter 右顶点； ↙ j = 1 && col = cCenter 下顶点；
                // ↖ j = 2 && row = rCenter 左顶点； ↗ j = 3 && col = cCenter 上顶点.
                while ((j % 2 == 0 && row != rCenter) ||
                       (j % 2 != 0 && col != cCenter)) {
                    // 确保当前的坐标在 矩阵范围内
                    if (row >= 0 && row < rows &&
                        col >= 0 && col < cols) {
                        // 记录下当前的 坐标
                        re[index][0] = row
                        re[index][1] = col
                        index += 1
                    }
                    // 按照当前方向移动
                    row += dr[j]
                    col += dc[j]
                }
            }
        }
        return re
    }
}


func testAllCellsDistOrder() {
    let x = LeetCode.allCellsDistOrder(2, 3, 1, 2)
    print(x)
}

//给定四个整数 row ,   cols ,  rCenter 和 cCenter 。有一个 rows x cols 的矩阵，你在单元格上的坐标是 (rCenter, cCenter) 。
//
//返回矩阵中的所有单元格的坐标，并按与 (rCenter, cCenter) 的 距离 从最小到最大的顺序排。你可以按 任何 满足此条件的顺序返回答案。
//
//单元格(r1, c1) 和 (r2, c2) 之间的距离为|r1 - r2| + |c1 - c2|。

//示例 1：
//输入：rows = 1, cols = 2, rCenter = 0, cCenter = 0
//输出：[[0,0],[0,1]]
//解释：从 (r0, c0) 到其他单元格的距离为：[0,1]

//示例 2：
//输入：rows = 2, cols = 2, rCenter = 0, cCenter = 1
//输出：[[0,1],[0,0],[1,1],[1,0]]
//解释：从 (r0, c0) 到其他单元格的距离为：[0,1,1,2]
//[[0,1],[1,1],[0,0],[1,0]] 也会被视作正确答案。

//示例 3：
//输入：rows = 2, cols = 3, rCenter = 1, cCenter = 2
//输出：[[1,2],[0,2],[1,1],[0,1],[1,0],[0,0]]
//解释：从 (r0, c0) 到其他单元格的距离为：[0,1,1,2,2,3]
//其他满足题目要求的答案也会被视为正确，例如 [[1,2],[1,1],[0,2],[1,0],[0,1],[0,0]]。

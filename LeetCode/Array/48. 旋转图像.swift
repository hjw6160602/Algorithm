//
//  48. 旋转图像.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/8/1.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/rotate-image

import Foundation

extension Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var x = matrix.count - 1, y = 0
        
        for i in 0..<matrix.count {
            var last = 0
            for j in 0..<matrix[0].count {
                if x < 0 {
                    x = matrix.count - 1
                    y += 1
                }
                last = matrix[i][j]
                matrix[i][j] = matrix[x][y]
                x -= 1
            }
        }
        
        return
    }
    
//    自外向内一共有不超过 n/2 层（单个中心元素不算一层）矩形框。
//    对于第 layer 层矩形框，其框边长 len = n - (layer * 2)，
//    将其顺时针分为 4 份 len−1 的边，对四条边进行元素的循环交换即可。
    
//    4 ms 100.00%
//    13.8 MB 61.35%
    func rotateP1(_ matrix: inout [[Int]]) {
        let n = matrix.count
        
        for layer in 0..<n / 2 {
            let start = layer, end = n - layer - 1
            for i in start..<end {
                let offset = i - start
//                (matrix[start][i], matrix[i][end], matrix[end][end - offset], matrix[end - offset][start]) = (matrix[end - offset][start], matrix[start][i], matrix[i][end], matrix[end][end - offset])
                var temp1 = matrix[start][i]
                matrix[start][i] = matrix[end - offset][start]
                var temp2 = matrix[i][end]
                matrix[i][end] = temp1
                temp1 = matrix[end][end - offset]
                matrix[end][end - offset] = temp2
                matrix[end - offset][start] = matrix[end][end - offset]
            }
        }
    }
//   上边：matrix[start][i] = matrix[end - offset][start]
//   右边：matrix[i][end] = matrix[start][i]
//   底边：matrix[end][end - offset] = matrix[i][end]
//   左边：matrix[end - offset][start] = matrix[end][end - offset]
    
}

func test48Rotate() {
    var matrix = [[1,2,3],[4,5,6],[7,8,9]]
    LeetCode.rotateP1(&matrix)
    print(matrix)
}
//给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。
//你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
//
//示例 1：
//输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
//输出：[[7,4,1],[8,5,2],[9,6,3]]
//
//示例 2：
//输入：matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
//输出：[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
//
//
//提示：
//n == matrix.length == matrix[i].length
//1 <= n <= 20
//-1000 <= matrix[i][j] <= 1000


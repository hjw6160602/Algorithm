//
//  867. 转置矩阵.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/4/24.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/transpose-matrix

import Foundation


extension Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        // 行列容量倒置的res

//        76 ms 100%
//        14.1 MB 72.73%
        var res = Array(repeating: Array(repeating: 0, count: matrix.count),
                        count: matrix[0].count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                res[j][i] = matrix[i][j]
            }
        }
        return res
    }
}


func test867Transpose() {
//    let matrix = [[1,2,3],[4,5,6],[7,8,9]]
    let matrix = [[1,2,3],[4,5,6]]
    let trans = LeetCode.transpose(matrix)
    print(trans)
}


//给你一个二维整数数组 matrix， 返回 matrix 的 转置矩阵 。
//矩阵的 转置 是指将矩阵的主对角线翻转，交换矩阵的行索引与列索引。
//
//示例 1：
//输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
//输出：[[1,4,7],[2,5,8],[3,6,9]]
//
//示例 2：
//输入：matrix = [[1,2,3],[4,5,6]]
//输出：[[1,4],[2,5],[3,6]]
//
//提示：
//m == matrix.length
//n == matrix[i].length
//1 <= m, n <= 1000
//1 <= m * n <= 105
//-109 <= matrix[i][j] <= 109

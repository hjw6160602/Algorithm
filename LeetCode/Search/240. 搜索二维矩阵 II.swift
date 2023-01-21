//
//  240. 搜索二维矩阵 II.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/8/25.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/search-a-2d-matrix-ii

import Foundation

extension Solution {
    
    //    276 ms 15.28%
    //    14.7 MB 48.61%
    func searchMatrixSoap(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else {
            return false
        }
        
        var row = 0, col = matrix[0].count - 1
        
        while row < matrix.count && col >= 0 {
            if matrix[row][col] == target {
                return true
            } else if matrix[row][col] < target {
                row += 1
            } else {
                col -= 1
            }
        }
        
        return false
    }
    
//    248 ms 51.39%
//    14.6 MB 62.50%
    // 遍历 + 枝剪的方式 时间复杂度O(m*n)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count, n = matrix[0].count
        
        for i in 0..<m {
            if matrix[i][0] > target {
                return false
            }
            for j in 0..<n {
                if matrix[i][j] == target {
                    return true
                }
                if matrix[i][j] > target {
                    break
                }
            }
        }
        return false
    }
    
    //    256 ms 28.77%
    //    14.4 MB 84.93%
    // 根据左上角和右上角 来控制和缩小 矩阵范围 当 矩阵范围 缩小到4个值的时候 进入循环求解
    func searchMatrixP1(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count, n = matrix[0].count
        
        typealias Corner = (x: Int, y: Int)
        var topLeft = Corner(x: 0, y: 0)
        var btmRight = Corner(x: m-1, y: n-1)
        
        var i = m >> 1, j = n >> 1
        
        while i >= 0 && j >= 0 {
            if matrix[i][j] == target {
                return true
            }
            if btmRight.x - topLeft.x < 2 && btmRight.y - topLeft.y < 2 {
                return search4Nums(matrix, target, tl: topLeft, br: btmRight)
            }
            if matrix[i][j] > target {
                // 缩小矩阵范围 先记录下上次的 i,j
                btmRight = Corner(x: i, y: j)
                i = (topLeft.x + i) >> 1
                j = (topLeft.y + j) >> 1
            } else {
                // 扩大矩阵范围 先记录下上次的 i,j
                topLeft = Corner(x: i, y: j)
                i = (btmRight.x + i) >> 1
                j = (btmRight.y + j) >> 1
            }
        }
        return false
    }
    
    private func search4Nums(_ matrix: [[Int]], _ target: Int,
                             tl: (x:Int, y:Int),
                             br: (x:Int, y:Int)) -> Bool {
        
        for i in tl.x...br.x {
            if matrix[i][tl.y] > target {
                return false
            }
            for j in tl.y...br.y {
                if matrix[i][j] == target {
                    return true
                }
                if matrix[i][j] > target {
                    break
                }
            }
        }
        return false
    }
}

func test240searchMatrix() {
//    let matrix = [[1,4],[2,5]], target = 2
//    let matrix = [[1,3,5]], target = 5
    let (matrix, target) = testCase3()
    let x = LeetCode.searchMatrixP1(matrix, target)
    print(x)
}

fileprivate func testCase1() -> (matrix: [[Int]], target: Int) {
    let matrix = [[1, 4, 7, 11,15],
                  [2, 5, 8, 12,19],
                  [3, 6, 9, 16,22],
                  [10,13,14,17,24],
                  [18,21,23,26,30]]
    let target = 5
    return (matrix, target)
}

fileprivate func testCase2() -> (matrix: [[Int]], target: Int) {
    let matrix = [[1, 4, 7, 11,15],
                  [2, 5, 8, 12,19],
                  [3, 6, 9, 16,22],
                  [10,13,14,17,24],
                  [18,21,23,26,30]]
    let target = 20
    return (matrix, target)
}

fileprivate func testCase3() -> (matrix: [[Int]], target: Int) {
    let matrix = [[3,6,9,12,17,22],
                  [5,11,11,16,22,26],
                  [10,11,14,16,24,31],
                  [10,15,17,17,29,31],
                  [14,17,20,23,34,37],
                  [19,21,22,28,37,40],
                  [22,22,24,32,37,43]]
     let target = 20
    return (matrix, target)
}


//编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target 。该矩阵具有以下特性：

//每行的元素从左到右升序排列。
//每列的元素从上到下升序排列。

//示例 1：
//输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
//输出：true

//示例 2：
//输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
//输出：false

//提示：
//m == matrix.length
//n == matrix[i].length
//1 <= n, m <= 300
//-109 <= matrix[i][j] <= 109
//每行的所有元素从左到右升序排列
//每列的所有元素从上到下升序排列
//-109 <= target <= 109

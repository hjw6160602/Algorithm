//
//  54.螺旋矩阵.swift
//  Array
//
//  Created by SaiDiCaprio on 2022/2/24.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/spiral-matrix/

import Foundation


extension Solution {
    
    enum Direction {
        case dRight
        case down
        case dLeft
        case up
    }
//    4 ms 68.18%
//    13.9 MB 7.95%
//    23 / 23
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        var top = 0, bottom = matrix.count - 1
        var left = 0, right = matrix[0].count - 1
        var res = [Int]()
        var i = 0, j = 0
        var direction = Direction.dRight
        
        while bottom >= top, right >= left {
            res.append(matrix[i][j])
            
            switch direction {
            case .dRight:
                guard j + 1 <= right else {
                    // 往右走不动了 那么下拐
                    direction = .down
                    top += 1
                    i += 1
                    break
                }
                j += 1
            case .down:
                // 往下走不动了 那么左拐
                guard i + 1 <= bottom else {
                    direction = .dLeft
                    right -= 1
                    j -= 1
                    break
                }
                i += 1
            case .dLeft:
                // 往左走不动了 那么上拐
                guard j - 1 >= left else {
                    direction = .up
                    bottom -= 1
                    i -= 1
                    break
                }
                j -= 1
            case .up:
                // 往上走不动了 那么右拐
                guard i - 1 >= top else {
                    direction = .dRight
                    left += 1
                    j += 1
                    break
                }
                i -= 1
            }
        }
        return res
    }
    
    func spiralOrderSwift(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        
        guard matrix.count != 0 else {
            return res
        }
        
        var startX = 0
        var endX = matrix.count - 1
        var startY = 0
        var endY = matrix[0].count - 1
        
        while true {
            // top
            for i in startY...endY {
                res.append(matrix[startX][i])
            }
            startX += 1
            if startX > endX {
                break
            }
            
            // right
            for i in startX...endX {
                res.append(matrix[i][endY])
            }
            endY -= 1
            if startY > endY {
                break
            }
            
            // bottom
            for i in stride(from: endY, through: startY, by: -1) {
                res.append(matrix[endX][i])
            }
            endX -= 1
            if startX > endX {
                break
            }
            
            // left
            for i in stride(from: endX, through: startX, by: -1) {
                res.append(matrix[i][startY])
            }
            startY += 1
            if startY > endY {
                break
            }
        }
        
        return res
    }
}

func testSpiralOrder() {
//    let x = Solution.shared.spiralOrder([[1, 2, 3, 4],[5, 6, 7, 8],[9, 10,11,12]])
    let x = Solution.shared.spiralOrder([[1, 2, 3],[4, 5, 6],[7, 8, 9]])
    print(x)
}


//54. 螺旋矩阵
//给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。

//示例 1：
//输入：matrix =
//  [[1, 2, 3],
//   [4, 5, 6],
//   [7, 8, 9]]
//输出：[1,2,3,6,9,8,7,4,5]

//示例 2：
//输入：matrix =
//   [[1, 2, 3, 4],
//    [5, 6, 7, 8],
//    [9, 10,11,12]]
//输出：[1,2,3,4,8,12,11,10,9,5,6,7]

//提示：
//m == matrix.length
//n == matrix[i].length
//1 <= m, n <= 10
//-100 <= matrix[i][j] <= 100

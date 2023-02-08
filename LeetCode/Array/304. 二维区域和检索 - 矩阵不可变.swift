//
//  304. 二维区域和检索 - 矩阵不可变.swift
//  Array
//
//  Created by 贺嘉炜 on 2023/2/8.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

class NumMatrix {

    var preSum = [[Int]]()

//    2228 ms 5.88%
//    17.1 MB 64.71%
    init(_ matrix: [[Int]]) {
        let m = matrix.count, n = matrix[0].count

        if m == 0 || n == 0 { return }
        // 注意Swift里面的二维数组行数和列数的 定义位置
        preSum = Array(repeating: Array(repeating: 0, count: n+1),
                       count: m+1)

        for i in 1...m {
            for j in 1...n {
                preSum[i][j] = preSum[i-1][j] + preSum[i][j-1] - preSum[i-1][j-1] + matrix[i-1][j-1]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return preSum[row2+1][col2+1] - preSum[row1][col2+1] - preSum[row2+1][col1] + preSum[row1][col1]
    }
}

func test304NumMatrix() {
    let matrix = NumMatrix([[-4,-5]])
    let x = matrix.sumRegion(0, 0, 0, 0)
    let y = matrix.sumRegion(0, 0, 0, 1)
    let z = matrix.sumRegion(0, 1, 0, 1)
    print(x,y,z)
}


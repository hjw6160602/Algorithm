//
//  118.杨辉三角.swift
//  Math
//
//  Created by SaiDiCaprio on 2022/7/26.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {

//    4 ms 71.03%
//    13.9 M 20.56%
//    14 / 14
    func generate(_ numRows: Int) -> [[Int]] {
        var res: [[Int]] = [[1]]
        guard numRows > 1 else { return res }
        
        var last = res[0]
        for i in 1..<numRows {
            var path = Array(repeating: 1, count: i + 1)
            for j in 1..<i {
                let cur = last[j-1] + last[j]
                path[j] = cur
            }
            last = path
            res.append(path)
        }
        return res
    }
}


func test118Generate() {
    let x = LeetCode.generate(5)
    print(x)
}

//给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。
//在「杨辉三角」中，每个数是它左上方和右上方的数的和。
//
//示例 1:
//输入: numRows = 5
//输出: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
//
//示例 2:
//输入: numRows = 1
//输出: [[1]]
//
//提示:
//1 <= numRows <= 30

//
//  119. 杨辉三角 II.swift
//  Math
//
//  Created by 贺嘉炜 on 2022/7/2.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/pascals-triangle-ii

import Foundation

extension Solution {

//    4 ms 55.41%
//    13.6 MB 74.32%
    func getRow(_ rowIndex: Int) -> [Int] {
        var res = Array(repeating: 1, count: rowIndex + 1)
        guard rowIndex > 1 else { return res }
        for i in 2...rowIndex {
            let last = res
            for j in 1..<i {
                res[j] = last[j-1] + last[j]
            }
        }
        return res
    }
}

//   1
//  1 1
// 1 2 1
//1 3 3 1

func test119GetRow() {
    let x = LeetCode.getRow(4)
    print(x)
}



//给定一个非负索引 rowIndex，返回「杨辉三角」的第 rowIndex 行。
//在「杨辉三角」中，每个数是它左上方和右上方的数的和。
//
//示例 1:
//输入: rowIndex = 3
//输出: [1,3,3,1]
//
//示例 2:
//输入: rowIndex = 0
//输出: [1]
//
//示例 3:
//输入: rowIndex = 1
//输出: [1,1]
//
//提示:
//0 <= rowIndex <= 33

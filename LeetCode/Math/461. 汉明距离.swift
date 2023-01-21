//
//  461. 汉明距离.swift
//  Math
//
//  Created by 贺嘉炜 on 2022/7/2.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/hamming-distance

import Foundation


extension Solution {

//    4 ms 42.00%
//    13.6 MB 5.00%
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var f = x ^ y
        var count = 0
        while f != 0 {
            if (f & 1) == 1 {
                count += 1
            }
            f = f >> 1
        }
        return f
    }
    
//    0 ms  100.00%
//    13.4 MB 50.00%
    func hammingDistanceP1(_ x: Int, _ y: Int) -> Int {
        return (x ^ y).nonzeroBitCount
    }
}

func test461HammingDistance() {
    let x = LeetCode.hammingDistance(1, 4)
    print(x)
}

//两个整数之间的 汉明距离 指的是这两个数字对应二进制位不同的位置的数目。
//给你两个整数 x 和 y，计算并返回它们之间的汉明距离。

//示例 1：
//输入：x = 1, y = 4

//输出：2
//解释：
//1   (0 0 0 1)
//4   (0 1 0 0)
//       ↑   ↑
//上面的箭头指出了对应二进制位不同的位置。

//示例 2：
//输入：x = 3, y = 1
//输出：1

//提示：
//0 <= x, y <= 2^31 - 1

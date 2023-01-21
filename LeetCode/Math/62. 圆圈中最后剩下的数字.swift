//
//  62. 圆圈中最后剩下的数字.swift
//  Math
//
//  Created by SaiDiCaprio on 2021/2/24.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof

import Foundation

// f(n,m) = (f(n-1, m) + m) % n
extension Solution {
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var res = 0
        for _ in 2..<n {
            res = (res + m) % m
        }
        return res
    }
}

func testLastRemaining() {
    let x = LeetCode.lastRemaining(5, 3)
    print(x)
}

// 0, 1, ···, n-1 这n个数字排成一个圆圈
// 从数字0开始，每次从这个圆圈里删除第m个数字（删除后从下一个数字开始计数）
// 求出这个圆圈里剩下的最后一个数字

// 例如，0、1、2、3、4这5个数字组成一个圆圈，
// 从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3

//示例 1：
//输入: n = 5, m = 3
//输出: 3

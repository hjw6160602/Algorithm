//
//  371. 两整数之和.swift
//  Math
//
//  Created by 贺嘉炜 on 2022/7/1.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/sum-of-two-integers/

import Foundation

extension Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while b != 0 {
//            print(b) 最后一次的b 是 Int.min
            let carry = (a & b) << 1
            a = a ^ b
            b = carry
        }
        return a
    }
    
//    0 ms 100.00%
//    13.5 MB 38.46%
//    25 / 25
    func getSumP1(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while b != 0 { // 这里必须写 b != 0
            (b, a) = ((a & b) << 1, a ^ b)
        }
        return a
    }
    
    func getSumSOAP(a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 { // 这里必须写 b != 0
            (a, b) = (a ^ b, (a & b) << 1)
        }
        
        return a
    }
}


func test371GetSum() {
    let x = LeetCode.getSum(-1, 1)
    
//    let x = LeetCode.getSum(2, 3)
    print(x)
}
//给你两个整数 a 和 b ，不使用 运算符 + 和 - ​​​​​​​，计算并返回两整数之和。
//
//示例 1：
//输入：a = 1, b = 2
//输出：3
//
//示例 2：
//输入：a = 2, b = 3
//输出：5
//
//提示：
//-1000 <= a, b <= 1000


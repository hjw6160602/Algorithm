//
//  507. 完美数.swift
//  Math
//
//  Created by SaiDiCaprio on 2022/7/1.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/perfect-number

import Foundation

extension Solution {
    
//    4 ms 61.54%
//    13.4 MB 38.46%
//    98 / 98
    func checkPerfectNumber(_ num: Int) -> Bool {
        guard num > 5 else { return false }
        var res = 1
        let count = Int(sqrt(Double(num)))
        for i in 2...count {
            // 判断num 是否可以除尽i
//            print(i)
            if num % i == 0 {
                res += i
                res += (num / i)
            }
        }
        return res == num
    }
    
//    0 ms 100.00%
//    13.2 MB 76.92%
//    98 / 98
    func checkPerfectNumberP1(_ num: Int) -> Bool {
        guard num > 5 else { return false }
        var res = 1, i = 2
        while i * i < num {
            if num % i == 0 {
                res += i
                res += (num / i)
            }
            i += 1
        }
        return res == num
    }
}


func test507CheckPerfectNumber() {
    let x  = LeetCode.checkPerfectNumberP1(496)
    print(x)
    
}


//对于一个 正整数，如果它和除了它自身以外的所有 正因子 之和相等，我们称它为 「完美数」。
//给定一个 整数 n， 如果是完美数，返回 true；否则返回 false。

//示例 1：
//输入：num = 28
//输出：true
//解释：28 = 1 + 2 + 4 + 7 + 14
//1, 2, 4, 7, 和 14 是 28 的所有正因子。

//示例 2：
//输入：num = 7
//输出：false

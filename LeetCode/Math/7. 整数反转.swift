//
//  7. 整数反转.swift
//  Math
//
//  Created by SaiDiCaprio on 2021/3/10.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/reverse-integer

import Foundation

extension Solution {
    /// 32 位的有符号整数 x ，返回x中每位上的数字反转后的结果
    func reverse(_ x: Int) -> Int {
        guard x <= Int32.max && x >= Int32.min else {
            return 0
        }
        var x = x
        var flag = 1
        if x < 0 {
            flag = -1
            x = x * -1
        }
        
        var res = 0
        while x > 0 {
            let mod = x % 10
            res = res * 10 + mod
            x = x / 10
        }
        
        if res > Int32.max {
            return 0
        }
        return flag * res
    }
    
    func reverseSwift(_ x: Int) -> Int {
        var res = 0
        var x = x
        while x != 0 {
            // 这里有点反人类
            if res > Int(Int32.max) / 10 || res < Int(Int32.min) / 10 {
                return 0
            }
            res = res * 10 + x % 10
            x = x / 10
        }
        return res
    }
    
//    func reverse(_ x: Int) -> Int {
//        guard x <= Int32.max && x >= Int32.min else {
//            return 0
//        }
//        var x = x
//        var flag = 1
//        if x < 0 {
//            flag = -1
//            x = x * -1
//        }
//
//        var res = 0
//        while x > 0 {
//            let mod = x % 10
//            res = res * 10 + mod
//            x = x / 10
//        }
//
//        if res > Int32.max {
//            return 0
//        }
//        return flag * res
//    }
}

func testIntReverse() {
                           //9646324351
                           //2147483647
    let x = LeetCode.reverse(-2147483648)
//    9646324351
    print(x)
}






// 示例 1：
// 输入：x = 123
// 输出：321
 
// 示例 2：
// 输入：x = -123
// 输出：-321
 
// 示例 3：
// 输入：x = 120
// 输出：21
 
// 示例 4：
// 输入：x = 0
// 输出：0
 
// 提示：
// -2^31 <= x <= 2^31 - 1


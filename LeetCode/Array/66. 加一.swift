//
//  66. 加一.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/4/21.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/plus-one

import Foundation

extension Solution {
//    0 ms 100.00%
//    13.8 MB 59.88%
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits, carry = 1
        var i = digits.count - 1
        while i >= 0 {
            digits[i] += carry
            guard digits[i] > 9 else {
                return digits
            }
            digits[i] = 0
            i -= 1
        }
        return [1] + digits
    }
}

func test66PlusOne() {
    let x = LeetCode.plusOne([0])
    print(x)
}

//给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
//最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
//你可以假设除了整数 0 之外，这个整数不会以零开头。
//
//示例 1：
//输入：digits = [1,2,3]
//输出：[1,2,4]
//解释：输入数组表示数字 123。
//
//示例 2：
//输入：digits = [4,3,2,1]
//输出：[4,3,2,2]
//解释：输入数组表示数字 4321。
//
//示例 3：
//输入：digits = [0]
//输出：[1]
// 
//
//提示：
//1 <= digits.length <= 100
//0 <= digits[i] <= 9

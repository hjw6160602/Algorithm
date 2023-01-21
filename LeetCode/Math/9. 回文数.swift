//
//  9. 回文数.swift
//  Math
//
//  Created by SaiDiCaprio on 2021/3/11.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/palindrome-number/

import Foundation

// 给你一个整数 x 如果是一个回文整数 返回 true 否则返回 false
extension Solution {
    
    // 不用字符串的解法
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        var x = x
        var div = 1
        // 这里可以确定是几位数
        while (x / div >= 10) {
            div = div * 10
        }
        while (x > 0) {
            let left = x / div
            let right = x % 10
            
            if (left != right) {
                return false
            }
            // 掐头去尾
            x = (x % div) / 10
            // 除数也相应减少2位
            div = div / 100
        }
        return true
    }
    
    // 使用字符串的解法
    func isPalindromeString(_ x: Int) -> Bool {
        let str = String(x)
        let chars = [Character](str)
        let maxIndex = str.count - 1
        let mid = str.count >> 1
        for index in 0..<mid {
            guard chars[index] == chars[maxIndex - index] else {
                return false
            }
        }
        return true
    }
}

func testIsPalindrome() {
    // 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数
    let res = LeetCode.isPalindrome(1221)
    print(res)
}

//示例 1：
//输入：x = 121
//输出：true

//示例 2：
//输入：x = -121
//输出：false
//解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数

//示例 3：
//输入：x = 10
//输出：false
//解释：从右向左读, 为 01 。因此它不是一个回文数

//示例 4：
//输入：x = -101
//输出：false

//进阶：你能不将整数转为字符串来解决这个问题吗？

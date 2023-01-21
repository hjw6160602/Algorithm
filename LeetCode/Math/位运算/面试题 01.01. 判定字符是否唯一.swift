//
//  面试题 01.01. 判定字符是否唯一.swift
//  Math
//
//  Created by 贺嘉炜 on 2022/7/27.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/is-unique-lcci

import Foundation
extension Solution {
//  1. 基于bool数组的方法：
//  ['a','z']之间，使用bool数组的做法是定义一个长度为26的初始值全为bool数组，逐个字符遍历astr，
//    如果bool数组中对应的下标（'a'->0, ..., 'z'->25）的值为1则重复出现，返回false，否则设置对应下标值为1。

//  2. 基于位运算的方法：
// 26个bit对应着26个字符，对于一个字符c，检查对应下标的bit值即可判断是否重复。
//    那么难点在于如何检查？这里我们可以通过位运算来完成。
//    首先计算出字符char离'a'这个字符的距离，即我们要位移的距离，用move_bit表示，那么使用左移运算符1 << move_bit则可以得到对应下标为1，其余下标为0的数，如字符char = 'c'，则得到的数为000...00100，将这个数跟mark做与运算，由于这个数只有一个位为1，其他位为0，那么与运算的结果中，其他位肯定是0，而对应的下标位是否0则取决于之前这个字符有没有出现过，若出现过则被标记为1，那么与运算的结果就不为0；若之前没有出现过，则对应位的与运算的结果也是0，那么整个结果也为0。对于没有出现过的字符，我们用或运算mark | (1 << move_bit)将对应下标位的值置为1。

    func isUnique(_ astr: String) -> Bool {
//        我们可以使用一个int类型的变量（下文用mark表示）来代替长度为26的bool数组
        var mask: Int = 0
        for char in astr {
            let bitCode = char.asciiValue! - 97
            if mask & (1 << bitCode) != 0 {
                return false
            }
            mask |= (1 << bitCode)
        }
        return true
    }
}
func test0101IsUnique() {
    let x = LeetCode.isUnique("leetcode")
    print(x)
}

//实现一个算法，确定一个字符串 s 的所有字符是否全都不同。

//示例 1：
//输入: s = "leetcode"
//输出: false
//
//示例 2：
//输入: s = "abc"
//输出: true
//限制：
//
//0 <= len(s) <= 100
//s[i]仅包含小写字母
//如果你不使用额外的数据结构，会很加分。


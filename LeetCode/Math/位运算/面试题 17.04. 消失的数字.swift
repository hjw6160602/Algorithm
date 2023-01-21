//
//  面试题 17.04. 消失的数字.swift
//  Math
//
//  Created by SaiDiCaprio on 2022/12/7.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/missing-number-lcci/

import Foundation


extension Solution {

//    100 ms 100%
//    13.9 MB 100%
    func missingNumber(_ nums: [Int]) -> Int {
        var res = 0
        // 先和新补的索引异或一下
        res ^= nums.count
        // 和其他的元素、索引做异或
        for (i, num) in nums.enumerated() {
            res ^= (i ^ num)
        }
        return res
    }
    
    func missingNumberP1(_ nums: [Int]) -> Int {
        var res = 0
        // 新补的索引
        res = nums.count
        // 剩下索引和蒜素的差加起来
        for (i, num) in nums.enumerated() {
            res += i - num
        }
        return res
    }
}

func testMissingNumber() {
    let x = LeetCode.missingNumberP1([9,6,4,2,3,5,7,0,1])
    print(x)
}


//数组nums包含从0到n的所有整数，但其中缺了一个。请编写代码找出那个缺失的整数。你有办法在O(n)时间内完成吗？
//注意：本题相对书上原题稍作改动

//示例 1：
//输入：[3,0,1]
//输出：2

//示例 2：
//输入：[9,6,4,2,3,5,7,0,1]
//输出：8

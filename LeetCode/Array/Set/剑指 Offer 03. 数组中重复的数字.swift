//
//  剑指 Offer 03. 数组中重复的数字.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/7/23.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof

import Foundation

extension Solution {

//    232 ms 81.91%
//    17.8 MB 47.87%
//    26 / 26
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var set: Set<Int> = Set()
        for num in nums {
            guard !set.contains(num) else {
                return num
            }
            set.insert(num)
        }
        return -1
    }
    

//    220 ms 100.00%
//    17.4 MB 98.40%
    // 原地交换
//    即 在一个长度为 n 的数组 nums 里的所有数字都在 0 ~ n-1 的范围内 。
//    说明：数组元素的 索引 和 值 是 一对多 的关系。
//    因此，可遍历数组并通过交换操作，使元素的 索引 与 值 一一对应（即 nums[i] = i）。因而，就能通过索引映射对应的值，起到与字典等价的作用
    func findRepeatNumberSwap(_ nums: [Int]) -> Int {
        var nums = nums
        var index = 0
        while index < nums.count {
            let num = nums[index]
            // 一旦发现 相等那么去判断下一个元素
            if num == index {
                index += 1
                continue
            }
            // 如果当前索引不配位 ，并且原索引已经有索引了 那么返回这个配位的元素
            if nums[num] == num {
                return num
            }
            nums.swapAt(index, num)
            index = num + 1
        }
        return -1
    }
}

func test217FindRepeatNumber() {
    let nums = [3,4,2,1,1,0]
    let x = LeetCode.findRepeatNumberSwap(nums)
    print(x)
}

//找出数组中重复的数字。
//
//在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。
//
//示例 1：
//输入：
//[2, 3, 1, 0, 2, 5, 3]
//输出：2 或 3
//
//
//限制：
//2 <= n <= 100000



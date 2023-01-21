//
//  217. 存在重复元素.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/7/23.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/contains-duplicate

import Foundation

extension Solution {
    
//    408 ms 56.88%
//    17.8 MB 55.44%
//    70 / 70
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = Set()
        for num in nums {
            guard !set.contains(num) else {
                return true
            }
            set.insert(num)
        }
        return false
    }
    
}

func test217ContainsDuplicate() {
    let nums = [1,2,3,1]
    let x = LeetCode.containsDuplicate(nums)
    print(x)
}


//给你一个整数数组 nums 。如果任一值在数组中出现 至少两次 ，返回 true ；如果数组中每个元素互不相同，返回 false 。
//
//示例 1：
//输入：nums = [1,2,3,1]
//输出：true
//
//示例 2：
//输入：nums = [1,2,3,4]
//输出：false
//示例 3：
//
//输入：nums = [1,1,1,3,3,4,3,2,4,2]
//输出：true
//
//提示：
//1 <= nums.length <= 105
//-109 <= nums[i] <= 109

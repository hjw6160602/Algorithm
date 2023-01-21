//
//  55. 跳跃游戏.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/7/19.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/jump-game

import Foundation

extension Solution {
    

//    336 ms 43.23%
//    13.9 MB 86.45%
//    170 / 170
    func canJump(_ nums: [Int]) -> Bool {
        
        var maxPos = 0, i = 0
        while i <= maxPos {
            guard maxPos < nums.count-1 else {
                return true
            }
            if nums[i] + i >= maxPos {
                maxPos = max(maxPos, nums[i] + i)
            }
            i += 1
        }
        return false
    }
}

func test55CanJump() {
    let x = LeetCode.canJump([3,2,1,0,4])
    print(x)
}

//给定一个非负整数数组 nums ，你最初位于数组的 第一个下标 。
//
//数组中的每个元素代表你在该位置可以跳跃的最大长度。
//
//判断你是否能够到达最后一个下标。

//示例 1：
//输入：nums = [2,3,1,1,4]
//输出：true
//解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。

//示例 2：
//输入：nums = [3,2,1,0,4]
//输出：false
//解释：无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。

//提示：
//1 <= nums.length <= 3 * 104
//0 <= nums[i] <= 105

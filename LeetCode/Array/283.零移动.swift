//
//  283.零移动.swift
//  Array
//
//  Created by SaiDiCaprio on 2021/12/8.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/move-zeroes/

import Foundation

extension Solution {
    
//    执行用时：168 ms  在所有 Swift 提交中击败了 72.32% 的用户
//    内存消耗：14.5 MB 在所有 Swift 提交中击败了 59.59% 的用户
//    通过测试用例：74 / 74
    func moveZeroes(_ nums: inout [Int]) {
        // 记录上一个为零的位置
        var lastZero = 0
        // 思路：一次遍历
        for i in 1..<nums.count {
            if nums[i] == 0 {
                // 动态移动lastZero的位置
                if nums[lastZero] != 0 {
                    lastZero = i
                }
                continue
            }
            // 如果遍历到当前的我位置值为〇 那么做处理
            if nums[lastZero] == 0 {
                nums[lastZero] = nums[i]
                nums[i] = 0
                lastZero += 1
            }
        }
    }
    
    
//    执行用时：172 ms 在所有 Swift 提交中击败了 52.21% 的用户
//    内存消耗：14.6 MB 在所有 Swift 提交中击败了 36.53% 的用户
//    通过测试用例： 74 / 74
    func moveZeroesSwift(_ nums: inout [Int]) {
        var nonZeroIdx = 0
        
        for num in nums where num != 0 {
            nums[nonZeroIdx] = num
            nonZeroIdx += 1
        }
        
        while nonZeroIdx < nums.count {
            nums[nonZeroIdx] = 0
            nonZeroIdx += 1
        }
    }
    
    func moveZeroesP1(_ nums: inout [Int]) {
        var cur = 0
        for i in 0..<nums.count {
            guard nums[i] != 0 else { continue }
            if cur != i {
                nums[cur] = nums[i]
                nums[i] = 0
            }
            cur += 1
        }
    }
}

func testMoveZeroes() {
    var nums = [2,1]
//    var nums = [1,0,0,3,12]
//    var nums = [45192,0,-659,-52359,-99225,-75991,0,-15155,27382,59818,0,-30645,-17025,81209,887,64648]
    Solution.shared.moveZeroesP1(&nums)
    print(nums)
}




//给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
//
//示例:
//
//输入: [0,1,0,3,12]
//输出: [1,3,12,0,0]
//说明:
//
//必须在原数组上操作，不能拷贝额外的数组。
//尽量减少操作次数。

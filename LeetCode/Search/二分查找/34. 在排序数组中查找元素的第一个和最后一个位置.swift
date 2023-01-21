//
//  34. 在排序数组中查找元素的第一个和最后一个位置.swift
//  Search
//
//  Created by 贺嘉炜 on 2022/7/25.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array

import Foundation

extension Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [-1, -1]
        
        var l = 0, r = nums.count - 1
        var m = -1, n = -1
        var mid = (l + r) >> 1
        while l <= r {
            guard nums[mid] != target else {
                m = mid
                n = mid
                break
            }
            if nums[mid] < target {
                l = mid + 1
            } else if nums[mid] > target {
                r = mid - 1
            }
            mid = (l + r) >> 1
        }
        while m > 0 && nums[m - 1] == target {
            m -= 1
        }
        while n >= 0 && n < nums.count && (nums[n] == target) {
            n += 1
        }
        
        res = [m, n]
        return res
    }
}

func test34SearchRange() {
//    let nums = [5,7,7,8,8,10], target = 6
    let nums = [2,2], target = 2
//    let nums = [1], target = 1
    let x = LeetCode.searchRange(nums, target)
    print(x)
}

//给你一个按照非递减顺序排列的整数数组 nums，和一个目标值 target。请你找出给定目标值在数组中的开始位置和结束位置。
//如果数组中不存在目标值 target，返回 [-1, -1]。
//你必须设计并实现时间复杂度为 O(log n) 的算法解决此问题。
//
//
//示例 1：
//输入：nums = [5,7,7,8,8,10], target = 8
//输出：[3,4]
//
//示例 2：
//输入：nums = [5,7,7,8,8,10], target = 6
//输出：[-1,-1]
//
//示例 3：
//输入：nums = [], target = 0
//输出：[-1,-1]
//
//提示：
//0 <= nums.length <= 105
//-109 <= nums[i] <= 109
//nums 是一个非递减数组
//-109 <= target <= 109

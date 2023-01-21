//
//  33. 搜索旋转排序数组.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/7/8.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/search-in-rotated-sorted-array/

import Foundation


extension Solution {
//    16 ms 18.09%
//    14 MB 47.24%
//    195 / 195

    func searchIndexFromRotateArray(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 1 else {
            // 如果只有一个元素 那么直接判断是否相等
            return (nums[0] == target) ? 0 : -1
        }
        
        var left = 0, right = nums.count - 1
        var mid = (left + right) / 2
        while left < right {
            if target == nums[mid] { return mid }
            // 右侧有序
            if nums[mid] <= nums[right] {
                if target > nums[mid] && target <= nums[right] {
                    // 在右侧序列中
                    left = mid + 1
                } else {
                    // 不在右侧有序序列中 在左侧无序序列中
                    right = mid
                }
            } else {
                // 右侧无序 代表左侧有序
                if target < nums[mid] && target >= nums[left] {
                    // 在左侧序列中
                    right = mid
                } else {
                    // 不在左侧序列中
                    left = mid + 1
                }
            }
            mid = (left + right) / 2
        }
        if target == nums[mid] { return mid }
        
        return -1
    }
    
//    16 ms 18.09%
//    13.8 MB 81.91%
    func searchIndexP1(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, mid = 0, right = nums.count - 1
        while left <= right {
            mid = (left + right) / 2
            if target == nums[mid] { return mid }
            // 右侧有序
            if nums[mid] <= nums[right] {
                if target > nums[mid] && target <= nums[right] {
                    // 在右侧序列中
                    left = mid + 1
                } else {
                    // 不在右侧有序序列中 在左侧无序序列中
                    right = mid - 1
                }
            } else {
                // 右侧无序 代表左侧有序
                if target < nums[mid] && target >= nums[left] {
                    // 在左侧序列中
                    right = mid - 1
                } else {
                    // 不在左侧序列中
                    left = mid + 1
                }
            }
        }
        return -1
    }
}

func test33Search() {
//    let nums = [4,5,6,7,0,1,2], target = 0
    let nums = [0,1], target = 1
    let x = LeetCode.searchIndexP1(nums, target)
    print(x)
}

//整数数组 nums 按升序排列，数组中的值 互不相同 。
//在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。
//给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

//你必须设计一个时间复杂度为 O(log n) 的算法解决此问题。

//示例 1：
//输入：nums = [4,5,6,7,0,1,2], target = 0
//输出：4

//示例 2：
//输入：nums = [4,5,6,7,0,1,2], target = 3
//输出：-1

//示例 3：
//输入：nums = [1], target = 0
//输出：-1

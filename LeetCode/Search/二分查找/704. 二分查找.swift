//
//  704. 二分查找.swift
//  BreadthFirstSearch
//
//  Created by 贺嘉炜 on 2022/4/12.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/binary-search

import Foundation

extension Solution {
    
//    220 ms 92.86%
//    14 MB 62.30%
//    47 / 47
    func search(_ nums: [Int], _ target: Int) -> Int {
        return _binarySearch(nums, target: target, left: 0, right: nums.count - 1)
    }
    
    private func _binarySearch(_ nums:[Int], target: Int, left: Int, right: Int) -> Int {
        guard right >= left else {
            return -1
        }
        let mid = (right - left) / 2 + left
        guard nums[mid] != target else {
            return mid
        }
        if nums[mid] > target {
            return _binarySearch(nums, target: target, left: left, right: mid - 1)
        } else {
            return _binarySearch(nums, target: target, left: mid + 1, right: right)
        }
        
    }
    
}

func testBinarySearch() {
//    let index = LeetCode.search([-1,0,3,5,9,12], 9)
    let index = LeetCode.search([-1,0,3,5,9,12], 2)
    print(index)
}


//给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。
//
//
//示例 1:
//输入: nums = [-1,0,3,5,9,12], target = 9
//输出: 4
//解释: 9 出现在 nums 中并且下标为 4
//
//示例 2:
//输入: nums = [-1,0,3,5,9,12], target = 2
//输出: -1
//解释: 2 不存在 nums 中因此返回 -1
//提示：
//
//你可以假设 nums 中的所有元素是不重复的。
//n 将在 [1, 10000]之间。
//nums 的每个元素都将在 [-9999, 9999]之间。


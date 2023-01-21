//
//  912.排序数组.swift
//  Sort
//
//  Created by SaiDiCaprio on 2022/7/19.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/sort-an-array/

import Foundation

extension Solution {

//    1200 ms 41.57%
//    17.5 MB 96.22%
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        quickSortN(&nums, 0, nums.count - 1)
        return nums
    }
    
    private func quickSortN(_ nums: inout [Int], _ low: Int, _ high: Int) {
        guard low < high else { return }
        // 指定基准值
        let pivot = nums[low]
        // 确定左右指针位置
        var l = low, r = high
        
        while l < r {
            while l < r && nums[r] >= pivot {
                r -= 1
            }
            while l < r && nums[l] <= pivot {
                l += 1
            }
            if l < r {
                nums.swapAt(l, r)
            }
        }
        // 当左右指针相遇 交换基准值位置
        nums.swapAt(l, low)
        
        if low < l {
            quickSortN(&nums, low, l-1)
        }
        if r < high {
            quickSortN(&nums, r + 1, high)
        }
    }
}

func test912SortArray() {
    let nums = [5,1,1,2,0,0]
    let x = LeetCode.sortArray(nums)
    print(x)
}
//给你一个整数数组 nums，请你将该数组升序排列。

//示例 1：
//输入：nums = [5,2,3,1]
//输出：[1,2,3,5]
//
//示例 2：
//输入：nums = [5,1,1,2,0,0]
//输出：[0,0,1,1,2,5]

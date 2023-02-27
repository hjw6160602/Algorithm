//
//  34. 在排序数组中查找元素的第一个和最后一个位置.swift
//  Search
//
//  Created by 贺嘉炜 on 2022/7/25.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array

import Foundation

func test34SearchRange() {
//    let nums = [5,7,7,8,8,10], target = 6
//    let nums = [2,2], target = 2
//    let nums = [1], target = 1
//    let nums = [Int](), target = 0
    let nums = [1,2,2], target = 2
//    let nums = [1,2,3,3,3,3,4,5,9], target = 3
    let x = LeetCode.searchRange(nums, target)
    print(x)
}

extension Solution {
//    64 ms 5.43%
//    14.7 MB 94.56%
    // 细节是魔鬼 啊
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let res = [-1, -1]
        
        var l = 0, r = nums.count
        // 区间左闭右开[l, r)
        while l < r {
            let mid = l + (r - l) >> 1
            if nums[mid] == target {
                // 已经找到了 数组中的数字
                // 相等的时候要分别再去寻找左右边界
                var lm =  mid, rm =  mid
                while l < lm {
                    let tmp = l + (lm - l) >> 1
                    if nums[tmp] != target {
                        l = tmp + 1
                    } else {
                        lm = tmp
                    }
                }
                
                while rm < r {
                    // rm 如果直接取中值会在 r = rm + 1 的时候永远无法降低 所以需要/2 + 1
                    let tmp =  rm + (r - rm) >> 1 + 1
                    // 防止数组越界 在这种时候将r降下来
                    if tmp >= nums.count {
                        r = r - 1
                        continue
                    }
                    if nums[tmp] != target {
                        r = tmp - 1
                    } else {
                        rm = tmp
                    }
                }
                return [lm, rm]
            } else if nums[mid] > target {
                r = mid
            } else if nums[mid] < target {
                l = mid + 1
            }
        }
        return res
    }
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

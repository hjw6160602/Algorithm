//
//  300.最长递增子序列.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2021/3/6.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/longest-increasing-subsequence

import Foundation

extension Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var res = 1
        var dp = Array(repeating: 1, count: nums.count)
        // 动态规划 时间复杂度为 O(n^2)
        for i in 0 ..< nums.count {
            for j in 0 ..< i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            res = max(res, dp[i])
        }
        return res
    }
    
    // 二分搜索 时间复杂度降低到 O(n log(n))
    func lengthOfLIS2(_ nums: [Int]) -> Int {
        // 把每个数字看做一张扑克牌 从左到右按顺序处理每一张扑克牌
        guard nums.count > 0 else { return 0 }
        // 牌堆的数量
        var len = 0
        // 牌堆顶部数组
        var top = [Int](repeating: 0, count: nums.count)
        // 遍历所有的牌
        for num in nums {
            var begin = 0
            var end = len
            while begin < end {
                let mid = (begin + end) >> 1
                if num <= top[mid] {
                    end = mid
                } else {
                    begin = mid + 1
                }
            }
            // 覆盖牌顶
            top[begin] = num
            // 检查是否要新建一个牌堆
            if begin == len { len += 1 }
        }
        return len
    }
    
//    private func search(index: Int) {
//
//        return
//    }
}

func testLengthOfLIS() {
    let nums = [10,9,2,5,3,7,101,18]//[2,3,7,101]
    print(LeetCode.lengthOfLIS2(nums))
}

// 给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。
// 子序列是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。
// 例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。

// 示例 1：
// 输入：nums = [10,9,2,5,3,7,101,18]
// 输出：4
// 解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。
 
// 示例 2：
// 输入：nums = [0,1,0,3,2,3]
// 输出：4
 
// 示例 3：
// 输入：nums = [7,7,7,7,7,7,7]
// 输出：1
 
// 提示：
// 1 <= nums.length <= 2500
// -104 <= nums[i] <= 104
 
// 进阶：
// 你可以设计时间复杂度为 O(n2) 的解决方案吗？
// 你能将算法的时间复杂度降低到 O(n log(n)) 吗?

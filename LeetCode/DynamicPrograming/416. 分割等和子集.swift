//
//  416. 分割等和子集.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2022/7/22.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/partition-equal-subset-sum

import Foundation

extension Solution {

//    292 ms 5.71%
//    15.3 MB 30.00%
    
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce( 0,+ )
        guard sum & 1 == 0 else {
            return false
        }
        
        let target = sum >> 1
//        dp[i][j]: 在 [0,i] 区间内 是否可以选择0个或者多个数 他们的和等于 j
        
        var dp = Array(repeating: Array.init(repeating: false, count: target + 1),
                        count: nums.count)
        
        if nums[0] <= target {
            dp[0][nums[0]] = true
        }
        // 从nums[1]开始遍历
        for i in 1..<nums.count {
            // 从后一个数开始
            for j in 1...target {
                if nums[i] == j {
                    dp[i][j] = true
                    continue
                }
                dp[i][j] = dp[i-1][j]
                guard j - nums[i] > 0 else {
                    continue
                }
                dp[i][j] = (dp[i][j] || dp[i-1][j-nums[i]])
            }
        }
        let x = nums.count - 1
//        for d in dp {
//            print(d)
//        }
        return dp[x][target]
    }
}

func test416CanPartition() {
    let nums = [1,2,3,5]
//    let nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,90]
    let x = LeetCode.canPartition(nums)
    print(x)
}

//给你一个 只包含正整数 的 非空 数组 nums 。请你判断是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。
//
//示例 1：
//输入：nums = [1,5,11,5]
//输出：true
//解释：数组可以分割成 [1, 5, 5] 和 [11] 。
//
//示例 2：
//输入：nums = [1,2,3,5]
//输出：false
//解释：数组不能分割成两个元素和相等的子集。
//
//
//提示：
//1 <= nums.length <= 200
//1 <= nums[i] <= 100

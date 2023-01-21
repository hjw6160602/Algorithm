//
//  494. 目标和.swift
//  DynamicPrograming
//
//  Created by SaiDiCaprio on 2022/9/5.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/target-sum

import Foundation

extension Solution {
    //    4 ms 98.00%
    //    13.7 MB 82.00%
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let sum = nums.reduce(0, +)
        // sum − 2⋅neg = target
        // neg = (sum - target) / 2
        let diff = sum - target
//        由于数组 nums 中的元素都是非负整数，neg 也必须是非负整数，
//        所以上式成立的前提是 sum−target 是非负偶数。若不符合该条件可直接返回 0
        if diff < 0 || diff % 2 != 0 {
            return 0
        }
        
        let neg = diff / 2
        var dp = [Int](repeating: 0, count: neg + 1)
        dp[0] = 1
        for num in nums {
            var j = neg
            while j >= num {
                dp[j] += dp[j - num]
                j -= 1
            }
        }
        return dp[neg]
    }
    
    func findTargetSumWays2(_ nums: [Int], _ target: Int) -> Int {
        let sum = nums.reduce(0, +)
        // sum − 2⋅neg = target
        // neg = (sum - target) / 2
        let diff = sum - target
//        由于数组 nums 中的元素都是非负整数，neg 也必须是非负整数，
//        所以上式成立的前提是 sum−target 是非负偶数。若不符合该条件可直接返回 0
        if diff < 0 || diff % 2 != 0 {
            return 0
        }
        
        let neg = diff / 2
        var dp = [Int](repeating: 0, count: neg + 1)
        dp[0] = 1
        for num in nums {
            var j = neg
            while j >= num {
                dp[j] += dp[j - num]
                j -= 1
            }
        }
        return dp[neg]
    }
    
}

func test492FindTargetSumWays() {
    let nums = [1,1,1,1,1], target = 3
    let x = LeetCode.findTargetSumWays(nums, target)
    print(x)
}


//给你一个整数数组 nums 和一个整数 target 。
//
//向数组中的每个整数前添加 '+' 或 '-' ，然后串联起所有整数，可以构造一个 表达式 ：
//
//例如，nums = [2, 1] ，可以在 2 之前添加 '+' ，在 1 之前添加 '-' ，然后串联起来得到表达式 "+2-1" 。
//返回可以通过上述方法构造的、运算结果等于 target 的不同 表达式 的数目。

//示例 1：
//输入：nums = [1,1,1,1,1], target = 3
//输出：5
//解释：一共有 5 种方法让最终目标和为 3 。
//-1 + 1 + 1 + 1 + 1 = 3
//+1 - 1 + 1 + 1 + 1 = 3
//+1 + 1 - 1 + 1 + 1 = 3
//+1 + 1 + 1 - 1 + 1 = 3
//+1 + 1 + 1 + 1 - 1 = 3




//示例 2：
//输入：nums = [1], target = 1
//输出：1

//提示：
//1 <= nums.length <= 20
//0 <= nums[i] <= 1000
//0 <= sum(nums[i]) <= 1000
//-1000 <= target <= 1000

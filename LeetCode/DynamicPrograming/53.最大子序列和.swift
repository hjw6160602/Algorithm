//
//  53.最大子序列和.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2021/3/7.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/maximum-subarray

import Foundation

extension Solution {
    //
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var res = nums[0]
        for i in 1..<nums.count {
            dp[i] = max(dp[i - 1] + nums[i], nums[i])
            res = max(res, dp[i])
        }
        return res
    }
    
    func maxSubArraySwift(nums: [Int]) -> Int {
        var max_current = nums[0]
        var max_global = nums[0]
        
        for i in 1..<nums.count {
            max_current = max(max_current + nums[i], nums[i])
            max_global = max(max_current, max_global)
        }
        
        return max_global
    }
    
    // 暴力求解
    func maxSubArrayForce(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var res = Int.min
        for i in 0..<nums.count {
            var sum = 0
            for j in i..<nums.count {
                sum += nums[j]
                res = max(res, sum)
            }
        }
        return res
    }
}

func testMaxSubArray() {
    let res = LeetCode.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
    print(res)
}


//给定一个整数数组 nums 找到一个具有最大和的连续子数组（子数组最少包含一个元素）返回其最大和。

//示例 1：
//输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
//输出：6
//解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。

//示例 2：
//输入：nums = [1]
//输出：1

//示例 3：
//输入：nums = [0]
//输出：0

//示例 4：
//输入：nums = [-1]
//输出：-1

//示例 5：
//输入：nums = [-100000]
//输出：-100000

//提示：
//1 <= nums.length <= 3 * 104
//-105 <= nums[i] <= 105

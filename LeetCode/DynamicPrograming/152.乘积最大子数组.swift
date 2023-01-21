//
//  152.乘积最大子数组.swift
//  DynamicPrograming
//
//  Created by SaiDiCaprio on 2022/7/25.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/maximum-product-subarray

import Foundation

/**
 * 核心思路：动态规划
 * 看到最字很容易想到动态规划，去找最优子结构
 * 看到在状态定义过程中，可以定义一个以当前下标i结尾的最大乘积作为dp[i]
 * 但是 这道题目由于存在负数 可能会影响到最终的乘积的大小 所以 dp[i]代表的不仅仅是最大值，最小值也需要保存
 * 所以：dp[i] = [max(i), min(i)]
 * 状态转移：dp[i] = (max && min) (min(i-1) * num, max(i-1) * num, num)
 */
extension Solution {
    
//    24 ms 91.43%
//    14.8 MB 5.71%
    func maxProductDP1(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var dp = Array(repeating: [1, 1], count: nums.count + 1)

        var res = 0
        
        for i in 1...nums.count {
            let num = nums[i - 1]
            
            let minNum = min(dp[i-1][0] * num, dp[i-1][1] * num, num)
            let maxNum = max(dp[i-1][0] * num, dp[i-1][1] * num, num)
            dp[i] = [minNum, maxNum]
            
            res = max(res, dp[i][1])
        }
        print(dp)
        return res
    }
    
    
//    24 ms 91.43%
//    14.1 MB 84.29%
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        var res = 0
        var lastMin = 1, lastMax = 1
        
        for i in 1...nums.count {
            let num = nums[i - 1]
            let x = min(lastMin * num, lastMax * num, num)
            let y = max(lastMin * num, lastMax * num, num)
            (lastMin, lastMax) = (x, y)
            res = max(res, lastMax)
        }
        return res
    }
    
//    28 ms 50.00%
//    14 MB 95.71%
    func maxProductSoap(nums: [Int]) -> Int {
        var min_soFar = nums[0]
        var max_soFar = nums[0]
        var max_global = nums[0]
        
        for i in 1..<nums.count {
            let a = max_soFar * nums[i]
            let b = min_soFar * nums[i]
            
            max_soFar = max(a, b, nums[i])
            min_soFar = min(a, b, nums[i])
            
            max_global = max(max_global, max_soFar)
        }
        return max_global
    }
    
}

func test152MaxProduct() {
//    testCase0()
//    testCase6()
    testCase1280()
}


func testCase0() {
    let nums = [-2,0,-1]
    let x = LeetCode.maxProduct(nums)
    print(x)
}

func testCase6() {
    let nums = [2,3,-2,4]
    let x = LeetCode.maxProduct(nums)
    print(x)
}

func testCase1280() {
    let nums = [1,2,-1,-2,2,1,-2,1,4,-5,4]
    let x = LeetCode.maxProduct(nums)
    print(x)
//
//    let y = LeetCode.maxProduct1(nums)
//    print(y)
}


//给你一个整数数组 nums ，请你找出数组中乘积最大的非空连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。
//
//测试用例的答案是一个 32-位 整数。
//子数组 是数组的连续子序列。
//
//示例 1:
//输入: nums = [2,3,-2,4]
//输出: 6
//解释: 子数组 [2,3] 有最大乘积 6。
//
//示例 2:
//输入: nums = [-2,0,-1]
//输出: 0
//解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。
//
//
//提示:
//1 <= nums.length <= 2 * 104
//-10 <= nums[i] <= 10
//nums 的任何前缀或后缀的乘积都 保证 是一个 32-位 整数

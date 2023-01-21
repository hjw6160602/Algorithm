//
//  198. 打家劫舍.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2022/3/29.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/house-robber


import Foundation

extension Solution {
    
//    4 ms 75.00%
//    13.7 MB 62.74% 68 / 68

    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var robbed = nums[0], clear = 0
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = robbed
        
        for i in 1..<nums.count {
            // 抢劫当前的
            if clear + nums[i] > robbed {
                dp[i] = clear + nums[i]
                robbed = dp[i]
                clear = dp[i-1]
            } else { // 不抢当前的
                dp[i] = dp[i-1]
                clear = dp[i-1]
            }
        }
        
        return dp[nums.count-1]
    }
    
//    4 ms 75.00%
//    14 MB  9.80%
//    68 / 68

    func robSwift(_ nums: [Int]) -> Int {
        var curt = 0, prev = 0
        
        for num in nums {
            (curt, prev) = (max(curt, prev + num), curt)
        }
        
        return curt
    }
}

func testRob() {
    let res = LeetCode.robSwift([1,2,3,1])
    print(res)
}


//你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
//给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。

//示例 1：
//输入：[1,2,3,1]
//输出：4
//解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
//     偷窃到的最高金额 = 1 + 3 = 4 。

// [2,1,1,9,7]

//示例 2：
//输入：[2,7,9,3,1]
//输出：12
//解释：偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
//     偷窃到的最高金额 = 2 + 9 + 1 = 12 。

//提示：
//
//1 <= nums.length <= 100
//0 <= nums[i] <= 400

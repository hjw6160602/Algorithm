//
//  剑指 Offer 42. 连续子数组的最大和.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2022/7/27.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    144 ms 6.93%
//    16.1 MB 54.46%
    func maxSubArrayO1(_ nums: [Int]) -> Int {
        var dp = Array(repeating: Int.min, count: nums.count)
        dp[0] = nums[0]
        var res = nums[0]
        for i in 1..<nums.count {
            dp[i] = max(dp[i-1] + nums[i], nums[i])
            res = max(res, dp[i])
        }
        return res
    }
    
//    112 ms 30.69%
//    16.1 MB 51.49%
    func maxSubArrayO2(_ nums: [Int]) -> Int {
//        guard nums.count > 1 else { return nums[0] }
        var last = nums[0], res = nums[0]
        for i in 1..<nums.count {
            let cur = max(last + nums[i], nums[i])
            res = max(res, cur)
            last = cur
        }
        return res
    }
}

func test42MaxSubArray() {
    let nums = [-2,1,-3,4,-1,2,1,-5,4]
    let x = LeetCode.maxSubArrayO2(nums)
    print(x)
}


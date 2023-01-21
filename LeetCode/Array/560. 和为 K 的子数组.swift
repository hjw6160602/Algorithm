//
//  560. 和为 K 的子数组.swift
//  Array
//
//  Created by SaiDiCaprio on 2022/7/22.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/subarray-sum-equals-k

import Foundation

extension Solution {
    
//    1304 ms  6.42%
//    14.7 MB 71.56%
//    92 / 92
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        
        for i in 0..<nums.count {
            if nums[i] == k {
                print("单元素数组：\(i) : \(nums[i])")
                res += 1
            }
            guard i != nums.count - 1 else { break }
            var target = k - nums[i]
            for j in i+1..<nums.count {
                if target == nums[j] {
                    print("以当前结尾的：\(j) : \(nums[j])")
                    res += 1
                }
                target -= nums[j]
            }
        }
        return res
    }
}

func test560SubarraySum() {

//    let nums = [1,1,1], k = 2
//    let nums = [1,2,3], k = 3
//    let nums = [1,-1,0], k = 0
    let nums = [0,3,-3, 0], k = 0
    let x = LeetCode.subarraySum(nums, k)
    print(x)
}

//给你一个整数数组 nums 和一个整数 k ，请你统计并返回 该数组中和为 k 的连续子数组的个数 。

//示例 1：
//输入：nums = [1,1,1], k = 2
//输出：2

//示例 2：
//输入：nums = [1,2,3], k = 3
//输出：2

//提示：
//1 <= nums.length <= 2 * 104
//-1000 <= nums[i] <= 1000
//-107 <= k <= 107

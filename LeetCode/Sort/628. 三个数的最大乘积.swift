//
//  628. 三个数的最大乘积.swift
//  Sort
//
//  Created by 贺嘉炜 on 2022/6/27.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/maximum-product-of-three-numbers

import Foundation

extension Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        let n = nums.count
        var nums = nums
        nums.sort()
        return max(nums[0]*nums[1]*nums[n-1], nums[n-3]*nums[n-2]*nums[n-1])
        
    }
}

func testMaximumProduct() {
    let nums = [4,8,0,-2,-4]
    let x = LeetCode.maximumProduct(nums)
    print(x)
}


//给你一个整型数组 nums ，在数组中找出由三个数组成的最大乘积，并输出这个乘积。
//示例 1：
//输入：nums = [1,2,3]

//输出：6
//示例 2：
//输入：nums = [1,2,3,4]
//输出：24

//示例 3：
//输入：nums = [-1,-2,-3]
//输出：-6

//提示：
//3 <= nums.length <= 104
//-1000 <= nums[i] <= 1000


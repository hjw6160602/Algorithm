//
//  581. 最短无序连续子数组.swift
//  Sort
//
//  Created by SaiDiCaprio on 2022/8/17.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/shortest-unsorted-continuous-subarray

import Foundation


extension Solution {
//    [2,6,4,8,10,9,15] [6,4,8,10,9]
//    [6,4,8,10,9] -> [4,6,8,9,10]
//    [2,4,6,8,9,10,15]
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        var nums = nums
        var left = 1, right = 1
        
        for i in 1..<nums.count {
            let num = nums[i]
            if num > nums[i-1] {
                left = i
                break
            }
        }
        
        for j in left+1..<nums.count {
            let num = nums[j]
            if num < nums[j-1] {
                nums.swapAt(j, j-1)
                right = j
            }
        }
        
        return right == left ? 0 : right - left + 1
    }
    
    
//    132 ms 96.00%
//    14.1 MB 68.00%
    func findUnsortedSubarrayP1(_ nums: [Int]) -> Int {
        //初始化
        let n = nums.count
        var min = nums[n-1]
        var max = nums[0]
        var begin = 0, end = -1;
        //遍历
        for i in 0..<nums.count {
            //从左到右维持最大值，寻找右边界end
            if nums[i] < max {
                end = i
            } else {
                max = nums[i]
            }
            //从右到左维持最小值，寻找左边界begin
            if nums[n - i - 1] > min {
                begin = n-i-1
            } else {
                min = nums[n - i - 1]
            }
        }
        return end - begin + 1
    }
}

func test581FindUnsortedSubarray() {
    let nums = [2,1]
//    let nums = [1,2,3,4]
    let x = LeetCode.findUnsortedSubarray(nums)
    print(x)
}


//给你一个整数数组 nums ，你需要找出一个 连续子数组 ，如果对这个子数组进行升序排序，那么整个数组都会变为升序排序。
//请你找出符合题意的 最短 子数组，并输出它的长度。

//示例 1：
//输入：nums = [2,6,4,8,10,9,15]
//输出：5
//解释：你只需要对 [6, 4, 8, 10, 9] 进行升序排序，那么整个表都会变为升序排序。
//
//示例 2：
//输入：nums = [1,2,3,4]
//输出：0
//
//示例 3：
//输入：nums = [1]
//输出：0
//
//提示：
//1 <= nums.length <= 104
//-105 <= nums[i] <= 105


//
//  448.找到数组中消失的数字.swift
//  String
//
//  Created by 贺嘉炜 on 2022/4/12.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/find-all-numbers-disappeared-in-an-array

import Foundation

extension Solution {
    
//    296 ms 95.96%
//    16 MB 63.64%
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = [Int]()

        for i in 0..<nums.count {
            let index = abs(nums[i]) - 1
            if nums[index] > 0 {
                nums[index] = -nums[index]
            }
        }

        for i in 0..<nums.count {
            if nums[i] > 0 {
              result.append(i+1)
            }
        }

        return result
    }
}

func testFindDisappearNumbers() {
    let res = LeetCode.findDisappearedNumbers([4,3,2,7,8,2,3,1])
    print(res)
}

//给你一个含 n 个整数的数组 nums ，其中 nums[i] 在区间 [1, n] 内。请你找出所有在 [1, n] 范围内但没有出现在 nums 中的数字，并以数组的形式返回结果。
//
//示例 1：
//输入：nums = [4,3,2,7,8,2,3,1]
//输出：[5,6]
//
//示例 2：
//输入：nums = [1,1]
//输出：[2]
//
//
//提示：
//n == nums.length
//1 <= n <= 105
//1 <= nums[i] <= n
//进阶：你能在不使用额外空间且时间复杂度为 O(n) 的情况下解决这个问题吗? 你可以假定返回的数组不算在额外空间内。

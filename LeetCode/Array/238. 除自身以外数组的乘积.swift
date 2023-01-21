//
//  238. 除自身以外数组的乘积.swift
//  Array
//
//  Created by SaiDiCaprio on 2022/8/23.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/product-of-array-except-self

import Foundation

extension Solution {
//    40 ms 50.00%
//    20.2 MB 51.32%
//    22 / 22
    func productExceptSelfSoap(_ nums: [Int]) -> [Int] {
        var zeroCount = 0
        let total = nums.reduce(1) {
            if $1 == 0 {
                zeroCount += 1
            }
            return $0 * ($1 == 0 ? 1 : $1)
        }
        if zeroCount > 1 {return nums.map({_ in return 0})}
        return nums.map({
            if zeroCount == 1 {
                return ($0 == 0 ? total : 0)
            } else {
                return ($0 == 0 ? total : total / $0)
            }
        })
    }
    
//    136 ms 73.68%
//    20.2 MB 55.26%
//    Dynamic Programming,
//    track Left and Right product lists at the same time and just use one additional array.
    func productExceptSelfP1(_ nums: [Int]) -> [Int] {
        var arr = Array(repeating: 1, count: nums.count)
        // 上半区矩形区域的乘积
        for i in (0..<(nums.count - 1)).reversed() {
            arr[i] = arr[i + 1] * nums[i + 1]
        }
        
        var left = 1
        for i in 0..<nums.count {
            if i == 0 {
                arr[i] = left * arr[i]
            } else {
                left = left * nums[i - 1]
                arr[i] = left * arr[i]
            }
        }
        
        return  arr
    }
    
//    https://leetcode.cn/problems/gou-jian-cheng-ji-shu-zu-lcof/
//    solution/mian-shi-ti-66-gou-jian-cheng-ji-shu-zu-biao-ge-fe/
//    128 ms 100.00%
//    22.4 MB 18.18%
    func productExceptSelfP2(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = Array.init(repeating: 0, count: n)
        ans[0] = 1
        for i in 1..<nums.count {
            ans[i] = ans[i-1] * nums[i-1]
        }
        
        var tmp = 1
        for i in (0..<nums.count-1).reversed() {
            tmp *= nums[i+1]
            ans[i] *= tmp
        }
        
        return ans
    }
    
}

func test238productExceptSelf() {
    let nums = [1,2,3,4]
    let x = LeetCode.productExceptSelfP2(nums)
    print(x)
}

//  给你一个整数数组 nums，返回 数组 answer ，其中 answer[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积 。
//  题目数据 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内。
//  请不要使用除法，且在 O(n) 时间复杂度内完成此题。
  
//  示例 1:
//  输入: nums = [1,2,3,4]
//  输出: [24,12,8,6]
  
//  示例 2:
//  输入: nums = [-1,1,0,-3,3]
//  输出: [0,0,9,0,0]
  
//  提示：
//  2 <= nums.length <= 105
//  -30 <= nums[i] <= 30
//  保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内
  
//  进阶：你可以在 O(1) 的额外空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组不被视为额外空间。）
  

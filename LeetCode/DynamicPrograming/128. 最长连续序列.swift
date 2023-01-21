//
//  128. 最长连续序列.swift
//  DynamicPrograming
//
//  Created by SaiDiCaprio on 2022/7/28.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/longest-consecutive-sequence

import Foundation

extension Solution {
    
//    332 ms  53.51%
//    20.9 MB 36.84%
    // 1. 集合Set的方法
    func longestConsecutiveSoap(_ nums: [Int]) -> Int {
        // 用集合的方式来处理  讲当前数组直接放入集合
        var set = Set<Int>(nums), longest = 0
        
        for num in nums {
            var currentLength = 1
            dfs(num, &set, &longest, &currentLength)
        }
        
        return longest
    }
    
    private func dfs(_ num: Int, _ set: inout Set<Int>, _ longest: inout Int, _ length: inout Int) {
        if !set.contains(num) {
            // 如果不包含要找的数 直接return
            return
        }
        
        longest = max(longest, length)
        set.remove(num)
        length += 1
        // 寻找连续的数
        dfs(num + 1, &set, &longest, &length)
        dfs(num - 1, &set, &longest, &length)
    }
    
//    348 ms 40.35%
//    23.2 MB 15.79%
    // 2. 哈希表map的方法
    func longestConsecutive(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        var res = 0
        for num in nums {
            guard map[num] == nil else {
                // 过滤重复元素
                continue
            }
            let left = map[num - 1] ?? 0
            let right = map[num + 1] ?? 0
            
            let curLength = 1 + left + right
            // 根据 curLength 更新最大长度 res 的值
            res = max(res, curLength)
            // 更新当前num的长度值
            map[num] = curLength
            // 更新区间两端点的长度值
            map[num - left] = curLength
            map[num + right] = curLength
        }
        return res
    }
}

func test128LongestConsecutive() {
//    let nums = [-7,-1,3,-9,-4,7,-3,2,4,9,4,-9,8,-7,5,-1,-7]
    let nums = [100,4,200,1,3,2]
    let x = LeetCode.longestConsecutive(nums)
    print(x)
}

//给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。
//请你设计并实现时间复杂度为 O(n) 的算法解决此问题。

//示例 1：
//输入：nums = [100,4,200,1,3,2]
//输出：4
//解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。

//示例 2：
//输入：nums = [0,3,7,2,5,8,4,6,0,1]
//输出：9
//解释：最长数字连续序列是 [0,1,2,3,4,5,6,7,8]。它的长度为 9。

//提示：
//0 <= nums.length <= 105
//-109 <= nums[i] <= 109

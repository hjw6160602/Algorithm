//
//  11. 盛最多水的容器.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/7/18.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/container-with-most-water

import Foundation

extension Solution {

//    492 ms 69.65%
//    17.6 MB 96.75%
//    60 / 60
    func maxArea(_ height: [Int]) -> Int {
        var res = 0
        var left = 0 ,right = height.count - 1

        while left < right {
            var water = right - left
            if height[left] < height[right] {
                water *= height[left]
                left += 1
            } else {
                water *= height[right]
                right -= 1
            }
            res = max(res, water)
        }
        return res
    }
}

func test11MasArea() {
    let x = LeetCode.maxArea([1,1])
    print(x)
}

//给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。
//找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
//返回容器可以储存的最大水量。
//说明：你不能倾斜容器。
//
//示例 1：
//输入：[1,8,6,2,5,4,8,3,7]
//输出：49
//解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
//
//示例 2：
//输入：height = [1,1]
//输出：1
//
//提示：
//n == height.length
//2 <= n <= 105
//0 <= height[i] <= 104

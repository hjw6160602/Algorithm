//
//  42.接雨水.swift
//  Array
//
//  Created by SaiDiCaprio on 2022/2/24.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/trapping-rain-water

import Foundation

extension Solution {
//    56 ms 39.81%
//    14.4 MB 9.72%
//    321 / 321

    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else {
            return 0
        }
        
        var water = 0
        
        var leftMax = Array(repeating: 0, count: height.count)
        var rightMax = leftMax
        
        leftMax[0] = height[0]
        for i in 1..<height.count {
            leftMax[i] = max(leftMax[i-1], height[i])
        }
        
        rightMax[height.count-1] = height.last!
        for j in (0..<height.count-1).reversed() {
            rightMax[j] = max(rightMax[j+1], height[j])
        }
        for k in 1..<height.count-1 {
            let lowerMax = min(leftMax[k], rightMax[k])
            
            water += (lowerMax - height[k])
        }
        
        return water
    }
}

func testTrap() {
    let x = Solution.shared.trap([4,2,0,3,2,5])
    print(x)
    
}

//给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

//示例 1：
//输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
//输出：6
//解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。

//示例 2：
//输入：height = [4,2,0,3,2,5]
//输出：9

//提示：
//n == height.length
//1 <= n <= 2 * 104
//0 <= height[i] <= 105

//
//  11. 盛最多水的容器.swift
//  DynamicPrograming
//
//  Created by SaiDiCaprio on 2021/2/24.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/container-with-most-water

import Foundation

extension Solution {
    
    // 双指针 时间O(n)
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        
        var l = 0, r = height.count - 1
        
        
        return maxArea
    }
    
    
}

func textMaxArea() {
    let maxArea = LeetCode.maxArea([])
    print(maxArea)
}

// 给你 n 个非负整数 a1，a2，...，an，
// 每个数代表坐标中的一个点 (i, ai)
// 在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)
// 找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
//
// 说明：你不能倾斜容器。

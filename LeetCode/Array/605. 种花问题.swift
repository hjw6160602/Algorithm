//
//  605. 种花问题.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/6/30.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/can-place-flowers

import Foundation


extension Solution {
    
//    76 ms 55.17%
//    14.4 MB  6.90%
//    124 / 124
//    根据上述计算方法，计算花坛中可以种入的花的最多数量，判断是否大于或等于 nn 即可。具体做法如下。
//    维护 prev 表示上一朵已经种植的花的下标位置，初始时prev=−1，表示尚未遇到任何已经种植的花。

//    从左往右遍历数组 flowerbed，当遇到flowerbed[i]=1 时根据 prev 和 i 的值计算上一个区间内可以种植花的最多数量，然后令 prev=i，继续遍历数组 flowerbed 剩下的元素。

//    遍历数组 flowerbed 结束后，根据数组 prev 和长度 m 的值计算最后一个区间内可以种植花的最多数量。
//    判断整个花坛内可以种入的花的最多数量是否大于或等于 n。
    
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var count = 0
        let m = flowerbed.count
        
        var prev = -1
        
        for i in 0..<m {
            guard flowerbed[i] == 1 else { continue }
            if prev < 0 {
                // 左半部分可以种的花等于 当前index直接除以2
                count += i / 2
            } else {
                // 中间部分可以种的花 等于 两个索引的差 -2 后再 除以2
                count += (i - prev - 2) / 2
            }
            prev = i
        }
        
        if prev < 0 {
            // 如果 数组1盆花都没种 那么 数量等于(m + 1) / 2
            count = (m + 1) / 2
        } else {
            // 最后计算右半部分
            count += (m - prev - 1) / 2
        }
        
        return count >= n
    }
    
//    80 ms 20.69%
//    14 MB 82.76%
    func canPlaceFlowersP1(_ flowerbed: [Int], _ n: Int) -> Bool {
        
        var len = flowerbed.count, i = 0, n = n
        
        while i < len && n > 0 {
            if flowerbed[i] == 1 {
                i += 2
            } else if (i == (len - 1) || flowerbed[i + 1] == 0) {
                // 注意 这里 判断条件的顺序不能调整 前面i == (len - 1)判断能保证不越界！
                // 跳了2格之后如果后面一格也是空的 那么就可以在当前位置种花
                n -= 1
                i += 2
            } else {
                // 跳了2格之后如果后面一格也是有花的 那么跳3格 到后1格的再后2格去
                i += 3
            }
        }
        
        return n <= 0
    }
}

func test606CanPlaceFlowers() {
    let x = LeetCode.canPlaceFlowersP1([1,0,0,0,1,0,0], 2)
    print(x)
}

//假设有一个很长的花坛，一部分地块种植了花，另一部分却没有。可是，花不能种植在相邻的地块上，它们会争夺水源，两者都会死去。
//
//给你一个整数数组  flowerbed 表示花坛，由若干 0 和 1 组成，其中 0 表示没种植花，1 表示种植了花。另有一个数 n ，能否在不打破种植规则的情况下种入 n 朵花？能则返回 true ，不能则返回 false。

//示例 1：
//输入：flowerbed = [1,0,0,0,1], n = 1
//输出：true

//示例 2：
//输入：flowerbed = [1,0,0,0,1], n = 2
//输出：false

//提示：
//1 <= flowerbed.length <= 2 * 104
//flowerbed[i] 为 0 或 1
//flowerbed 中不存在相邻的两朵花
//0 <= n <= flowerbed.length

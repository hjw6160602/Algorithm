//
//  492. 构造矩形.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/4/22.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/construct-the-rectangle

import Foundation

extension Solution {
    func constructRectangle(_ area: Int) -> [Int] {
        guard area > 3 else {
            return [area, 1]
        }
        let mid = area / 2
        var w = mid, l = mid
        while w <= l {
            
            if l * w > area {
                l = (l - w) / 2 + w
                w = area / l
                continue
            }
            
            if l * w == area {
                if w > l {
                    (w, l) = (l, w)
                }
                return [l, w]
            }
            
//            if w * l == 0 {
//                w = area / mid
//                if w > l {
//                    (w, l) = (l, w)
//                }
//                return [l, w]
//            }
//
            
        }
        
        return [area, 1]
    }
}

func test492ConstructRectangle() {
    let x = LeetCode.constructRectangle(122122)
    print(x)
}


// 作为一位web开发者， 懂得怎样去规划一个页面的尺寸是很重要的。 所以，现给定一个具体的矩形页面面积，你的任务是设计一个长度为 L 和宽度为 W 且满足以下要求的矩形的页面。
// 要求：
// 你设计的矩形页面必须等于给定的目标面积。
// 宽度 W 不应大于长度 L ，换言之，要求 L >= W 。
// 长度 L 和宽度 W 之间的差距应当尽可能小。
// 返回一个 数组 [L, W]，其中 L 和 W 是你按照顺序设计的网页的长度和宽度。

// 示例1：
// 输入: 4
// 输出: [2, 2]
// 解释: 目标面积是 4， 所有可能的构造方案有 [1,4], [2,2], [4,1]。
// 但是根据要求2，[1,4] 不符合要求; 根据要求3，[2,2] 比 [4,1] 更能符合要求. 所以输出长度 L 为 2， 宽度 W 为 2。

// 示例 2:
// 输入: area = 37
// 输出: [37,1]
//
// 示例 3:
// 输入: area = 122122
// 输出: [427,286]

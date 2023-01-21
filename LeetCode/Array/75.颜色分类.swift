//
//  75.颜色分类.swift
//  Array
//
//  Created by 贺嘉炜 on 2021/3/14.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/sort-colors

import Foundation

extension Solution {
    // 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序
    // 使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        var red = 0
        var blue = nums.count - 1
        var white = 0
        while white <= blue {
            if nums[white] == 2 {
                (nums[white], nums[blue]) = (nums[blue], nums[white])
                blue -= 1
            } else if nums[white] == 0 {
                (nums[white], nums[red]) = (nums[red], nums[white])
                red += 1
                white += 1
            } else { // 白色的时候直接跳过
                white += 1
            }
        }
    }
    
//    执行用时：4 ms 在所有 Swift 提交中击败了 81.73% 的用户
//    内存消耗：13.6 MB 在所有 Swift 提交中击败了 50.96% 的用户
//    通过测试用例：87 / 87
    func sortColorsPractice(_ nums: inout [Int]) {
        
        var red = 0
        var blue = nums.count - 1
        var white = 0
        
        while white <= blue {
            if nums[white] == 0 {
                (nums[red], nums[white]) = (nums[white], nums[red])
                red += 1
                white += 1
            } else if nums[white] == 2 {
                (nums[blue], nums[white]) = (nums[white], nums[blue])
                blue -= 1 // 交换完之后左边red不用着急去+1 需要再次判断
                
            } else { // 白色的时候直接跳过
                white += 1
            }
        }
    }
}

func testSortColors() {
    var colors = [2,0,2,1,1,0]
//    var colors = [1]
    LeetCode.sortColorsPractice(&colors)
    print(colors)
}

// 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
 
// 示例 1：
// 输入：nums = [2,0,2,1,1,0]
// 输出：[0,0,1,1,2,2]
 
// 示例 2：
// 输入：nums = [2,0,1]
// 输出：[0,1,2]
 
// 示例 3：
// 输入：nums = [0]
// 输出：[0]
 
// 示例 4：
// 输入：nums = [1]
// 输出：[1]

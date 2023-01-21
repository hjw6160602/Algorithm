//
//  75. Sort Colors.swift
//
//  Created by SaiDiCaprio on 2021/1/27.
//  Copyright © 2021 SaiDiCaprio. All rights reserved.
//  https://leetcode-cn.com/problems/sort-colors

// 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，
// 使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
//

func sortColors(_ nums: inout [Int]) {
    var red = 0, blue = nums.count - 1, i = 0
    while i <= blue {
        if nums[i] == 0 {
            _swap(&nums, i, red)
            red += 1
            i += 1
        } else if nums[i] == 1 {
            i += 1
        } else {
            _swap(&nums, i, blue)
            blue -= 1
        }
    }
}

private func _swap<T>(_ nums: inout [T], _ p: Int, _ q: Int) {
    (nums[p], nums[q]) = (nums[q], nums[p])
}

var nums = [2,0,2,1,1,0]
sortColors(&nums)

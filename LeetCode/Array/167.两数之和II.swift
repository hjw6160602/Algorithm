//
//  167.两数之和II.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/3/30.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted

import Foundation

// 给定一个target
extension Solution {
//    64 ms 40.26%
//    14.8 MB 5.19%
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        var res = Array(repeating: 0, count: 2)
        for (index, num) in nums.enumerated() {
            if let lastIndex = dict[num] {
                res[0] = lastIndex
                res[1] = index + 1
                return res
            }
            dict[target - num] = index + 1
        }
        return [Int]()
    }
    
//    56 ms 70.56%
//    14.6 MB 16.45%
    func twoSumSwift2(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count <= 1 {
            return [Int]()
        }
        
        var left = 0, right = nums.count - 1
        
        while left < right {
            if nums[left] + nums[right] < target {
                left += 1
            } else if nums[left] + nums[right] > target {
                right -= 1
            } else {
                return [left + 1, right + 1]
            }
        }
        
        return [Int]()
    }
}

func testTwoSum2() {
//    let res = LeetCode.twoSum2([2,7,11,15], 9)
//    let res = LeetCode.twoSum2([2,3,4], 6)
    let res = Solution.shared.twoSum2([-1,0], -1)
    print(res)
}
//
//给你一个下标从 1 开始的整数数组 numbers ，该数组已按 非递减顺序排列  ，请你从数组中找出满足相加之和等于目标数 target 的两个数。如果设这两个数分别是 numbers[index1] 和 numbers[index2] ，则 1 <= index1 < index2 <= numbers.length 。
//
//以长度为 2 的整数数组 [index1, index2] 的形式返回这两个整数的下标 index1 和 index2。
//
//你可以假设每个输入 只对应唯一的答案 ，而且你 不可以 重复使用相同的元素。
//
//你所设计的解决方案必须只使用常量级的额外空间。
//
//
//示例 1：
//输入：numbers = [2,7,11,15], target = 9
//输出：[1,2]
//解释：2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。返回 [1, 2] 。

//示例 2：
//输入：numbers = [2,3,4], target = 6
//输出：[1,3]
//解释：2 与 4 之和等于目标数 6 。因此 index1 = 1, index2 = 3 。返回 [1, 3] 。

//示例 3：
//输入：numbers = [-1,0], target = -1
//输出：[1,2]
//解释：-1 与 0 之和等于目标数 -1 。因此 index1 = 1, index2 = 2 。返回 [1, 2] 。
//
//
//提示：
//2 <= numbers.length <= 3 * 104
//-1000 <= numbers[i] <= 1000
//numbers 按 非递减顺序 排列
//-1000 <= target <= 1000
//仅存在一个有效答案


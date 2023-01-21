//
//  496. 下一个更大元素 I.swift
//  Stack.Queue
//
//  Created by SaiDiCaprio on 2022/7/1.
//  Copyright © 2022 saidicaprio. All rights reserved.
// https://leetcode.cn/problems/next-greater-element-i

import Foundation

extension Solution {
    
//    16 ms 86.11%
//    14 MB 38.89%
//    15 / 15
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res = Array.init(repeating: -1, count: nums1.count)
        let n = nums2.count
        for i in 0..<nums1.count {
            var j = 0
            // 遍历找到 nums 中 相等的字符串
            while j < n, nums1[i] != nums2[j] {
                j += 1
            }
            var k = j + 1
            // 这里 写 < nums1[i] < nums2[j] 都一样
            while k < n, nums2[k] < nums1[i] {
                k += 1
            }
            
            res[i] = k < n ? nums2[k] : -1
        }
        return res
    }

    /// 单调栈
    /// 执行用时：
//    20 ms 13.89%
//    14.2 MB  5.55%
    func nextGreaterElementP1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res = Array.init(repeating: -1, count: nums1.count)
        var stack = [Int]()
        var map = [Int: Int]()
        for i in (0..<nums2.count).reversed() {
            let num = nums2[i]
            while !stack.isEmpty, num >= stack.last! {
                // 各自矮的出栈因为他们的存在没有意义
                stack.removeLast()
            }
            map[num] = stack.isEmpty ? -1 : stack.last!
            stack.append(num)
        }
        
        for i in 0..<nums1.count {
            res[i] = map[nums1[i]]!
        }
        return res
    }
}

func test496NextGreaterElement() {
//    let nums1 = [4,6,3,2], nums2 = [2,5,3,6,8,4,7,1]
//    let nums1 = [4,1,2], nums2 = [1,3,4,2]
//    let nums1 = [2, 4], nums2 = [1,2,3,4]
    let nums1 = [1,3,5,2,4], nums2 = [6,5,4,3,2,1,7]
    let x = LeetCode.nextGreaterElementP1(nums1, nums2)
    print(x)
}

//nums1 中数字 x 的 下一个更大元素 是指 x 在 nums2 中对应位置 右侧 的 第一个 比 x 大的元素。
//给你两个 没有重复元素 的数组 nums1 和 nums2 ，下标从 0 开始计数，其中nums1 是 nums2 的子集。
//对于每个 0 <= i < nums1.length ，找出满足 nums1[i] == nums2[j] 的下标 j ，并且在 nums2 确定 nums2[j] 的 下一个更大元素 。如果不存在下一个更大元素，那么本次查询的答案是 -1 。
//返回一个长度为 nums1.length 的数组 ans 作为答案，满足 ans[i] 是如上所述的 下一个更大元素 。


//示例 1：
//输入：.
//输出：[-1,3,-1]
//解释：nums1 中每个值的下一个更大元素如下所述：
//- 4 ，用加粗斜体标识，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
//- 1 ，用加粗斜体标识，nums2 = [1,3,4,2]。下一个更大元素是 3 。
//- 2 ，用加粗斜体标识，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。

//示例 2：
//输入：nums1 = [2,4], nums2 = [1,2,3,4].
//输出：[3,-1]
//解释：nums1 中每个值的下一个更大元素如下所述：
//- 2 ，用加粗斜体标识，nums2 = [1,2,3,4]。下一个更大元素是 3 。
//- 4 ，用加粗斜体标识，nums2 = [1,2,3,4]。不存在下一个更大元素，所以答案是 -1 。
//
//
//提示：
//1 <= nums1.length <= nums2.length <= 1000
//0 <= nums1[i], nums2[i] <= 104
//nums1和nums2中所有整数 互不相同
//nums1 中的所有整数同样出现在 nums2 中

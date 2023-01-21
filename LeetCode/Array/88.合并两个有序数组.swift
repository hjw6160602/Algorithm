//
//  88.合并两个有序数组.swift
//  Array
//
//  Created by 贺嘉炜 on 2021/3/14.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/merge-sorted-array

import Foundation

extension Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i1 = m - 1
        var i2 = n - 1
        var cur = nums1.count - 1
        
        while i2 >= 0 {
            // i1 >= 0 写错成 i1 > 0Le
            if i1 >= 0 && nums1[i1] > nums2[i2]  {
                // 第1个数组的最后位数值比较大
                nums1[cur] = nums1[i1]
                cur -= 1
                i1 -= 1
            } else { // i1<=0 || nums2[i2] >= nums1[i1]
                // 第2个数组的最后位数值比较大
                nums1[cur] = nums2[i2]
                cur -= 1
                i2 -= 1
            }
        }
    }
    
    
//    执行用时： 4 ms 在所有 Swift 提交中击败了 99.71% 的用户
//    内存消耗：  13.6 MB 在所有 Swift 提交中击败了 55.88% 的用户
//    通过测试用例：59 / 59
    func mergePractice1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var first = m - 1
        var second = n - 1
        
        for i in (0..<nums1.count).reversed() {
            if second < 0 { return }
            if first >= 0 && nums1[first] > nums2[second] {
                nums1[i] = nums1[first]
                first -= 1
            } else {
                nums1[i] = nums2[second]
                second -= 1
            }
        }
    }
    
//    执行用时：8 ms 在所有 Swift 提交中击败了 73.82% 的用户
//    内存消耗：13.6 MB 在所有 Swift 提交中击败了 67.65% 的用户
//    通过测试用例：59 / 59
    func mergePractice2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var first = m - 1
        var second = n - 1
        var cur = nums1.count - 1
        
        while second >= 0 {
            if first >= 0 && nums1[first] > nums2[second] {
                nums1[cur] = nums1[first]
                first -= 1
            } else {
                nums1[cur] = nums2[second]
                second -= 1
            }
            cur -= 1
        }
    }
    
}

func testMerge() {
    var nums1 = [1,2,3,0,0,0]
    let m = 3
    let nums2 = [2,5,6]
    let n = 3
//    var nums1 = [2,0]
//    let m = 1
//    let nums2 = [1]
//    let n = 1
    LeetCode.mergePractice1(&nums1, m, nums2, n)
    print(nums1)
}


//给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
//初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
//你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。

//示例 1：
//输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//输出：[1,2,2,3,5,6]

//示例 2：
//输入：nums1 = [1], m = 1, nums2 = [], n = 0
//输出：[1]

//提示：
//nums1.length == m + n
//nums2.length == n
//0 <= m, n <= 200
//1 <= m + n <= 200
//-109 <= nums1[i], nums2[i] <= 109

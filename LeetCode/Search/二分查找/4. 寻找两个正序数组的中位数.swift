//
//  4. 寻找两个正序数组的中位数.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/7/13.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/median-of-two-sorted-arrays

import Foundation

extension Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var l1 = 0, r1 = nums1.count - 1
        var l2 = 0, r2 = nums2.count - 1
        var mid1 = (l1 + r1) / 2
        var mid2 = (l2 + r2) / 2
        
        while l1 <= r1 && l2 <= r2 {
            if nums1[mid1] < nums2[mid2] {
                // 左边数组中间的数字比较小
                r1 = mid1 - 1
            } else {
                l2 = mid2 + 1
            }
            mid1 = (l1 + r1) / 2
            mid2 = (l2 + r2) / 2
        }
        
//        guard right >= 0 else {
//            return Double(nums1[mid1] / 2)
//        }
//        guard left < nums1.count else {
//            return Double(nums2[mid2] / 2)
//        }
        
        var left = 0, right = nums1.count + nums2.count - 1
        
        var mid = (left + right) / 2
        
        while left <= right {
            
            
            
        }
        
        
        return Double((nums1[mid1] + nums2[mid2]) / 2)
    }
    
    
//    60 ms 87.54%
//    14.1 MB 87.20%
//    2094 / 2094
//        For arrays of m and n numbers, nums1 and nums2, where m <= n.
// *      To find an index of mid1 in nums1, to separate the arrays into left and right parts:
// *      nums1[0, 1, ..., mid1 - 1] | nums1[mid1, mid1 + 1, ..., m]
// *      nums2[0, 1, ..., mid2 - 1] | nums2[mid2, mid2 + 1, ..., n]
// *
// *      Make sure:
// *              1. count of left = count of right
// *              2. max of left <= min of right
    func findMedianSortedArraysP1(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count, n = nums2.count
        
        if m > n {
            // 确保 nums1的长度比较小 nums2的长度比较大
            return findMedianSortedArrays(nums2, nums1)
        }

        let halfLength: Int = (m + n + 1) >> 1
        // 这里的b 代表nums1的左边界 e代表nums1的 右边界
        var b = 0, e = m
        // 这里的核心思路在于找到 合并数组后的 maxOfLeft minOfRight
        var maxOfLeft = 0, minOfRight = 0
        
        while b <= e {
            let mid1 = (b + e) >> 1
            // 由于 nums1比较短 所以 为了保证划分后两边数组长度相等或者相差为1
            // 需要将 mid2 划分在 halfLength - mid1
            // 确保 (0..mid1) + (0..mid2) = (mid1+1..m) + (mid2+1..n)
            let mid2 = halfLength - mid1
            
            if mid1 > 0 && mid2 < n && nums1[mid1 - 1] > nums2[mid2] {
                // 如果nums1中的数比较大 那么就将nums1的右边界 e 移动到 mid1-1 的位置
                e = mid1 - 1
            } else if mid2 > 0 && mid1 < m && nums1[mid1] < nums2[mid2 - 1] {
                // 如果nums2中的数字大 那么就将  nums1的 左边界 移动到 mid1+1的位置
                b = mid1 + 1
            } else { // 来到这里证明 mid1越界 || mid2越界 || nums1 和 nums2 所在索引的数字相等
                // 这里要找到maxOfLeft
                if mid1 == 0 {
                    // nums1 遍历完了 maxOfLeft 就是 nums2中的 mid2 - 1 所在值
                    maxOfLeft = nums2[mid2 - 1]
                } else if mid2 == 0 {
                    // nums2 遍历完了 maxOfLeft 就是 nums1中  mid1 - 1 所在值
                    maxOfLeft = nums1[mid1 - 1]
                } else {
                    // 都没有遍历完 那么取 nums1 和 nums2 所在索引的 较大值
                    maxOfLeft = max(nums1[mid1 - 1], nums2[mid2 - 1])
                }
                
                if (m + n) % 2 == 1 {
                    // 如果合并后的数组总数是奇数 那么直接返回maxOfLeft
                    return Double(maxOfLeft)
                }
                
                // 来到这里证明合并后的数组是偶数，需要找到 minOfRight
                if mid1 == m {
                    // nums1 数组 遍历完了 minOfRight 存在于nums2中
                    minOfRight = nums2[mid2]
                } else if mid2 == n {
                    // nums2 数组 遍历完了 minOfRight 存在于nums1中
                    minOfRight = nums1[mid1]
                } else {
                    // 如果都没有遍历完 那么取 nums1 和 nums2 所在索引的 较小值
                    minOfRight = min(nums1[mid1], nums2[mid2])
                }
                break
            }
        }
        return Double(maxOfLeft + minOfRight) / 2.0
    }
}

func test4findMedianSortedArrays() {
//    [1,5,7,9,11]         2
//    [2,4, 6,8,12，14]   2 offset = 2
    
//    [1,2,4,5, 6,7, 8,9,11,12]  = 6.5  10 / 2
    let x = LeetCode.findMedianSortedArrays([1,3], [1,2,3])
    print(x)
}

//给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
//算法的时间复杂度应该为 O(log (m+n)) 。

//示例 1：
//输入：nums1 = [1,3], nums2 = [2]
//输出：2.00000
//解释：合并数组 = [1,2,3] ，中位数 2

//示例 2：
//输入：nums1 = [1,2], nums2 = [3,4]
//输出：2.50000
//解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5


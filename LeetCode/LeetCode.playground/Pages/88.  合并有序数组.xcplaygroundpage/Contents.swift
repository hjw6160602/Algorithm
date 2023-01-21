//
//  MergeSortedArray.swift
//
//  Created by SaiDiCaprio on 2021/1/27.
//  Copyright © 2021 SaiDiCaprio. All rights reserved.
//  https://leetcode-cn.com/problems/merge-sorted-array/

//
//输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//输出：[1,2,2,3,5,6]
//示例 2：
//
//输入：nums1 = [1], m = 1, nums2 = [], n = 0
//输出：[1]

//func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//    var i = m - 1, j = n - 1
//
//    while i >= 0 || j >= 0 {
//        if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
//            nums1[i + j + 1] = nums1[i]
//            i -= 1
//        } else {
//            nums1[i + j + 1] = nums2[j]
//            j -= 1
//        }
//    }
//}

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var cur = m + n - 1
    var i = m - 1
    var j = n - 1
    while j >= 0 || i >= 0 {
        if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
            nums1[cur] = nums1[i]
            i -= 1
            cur -= 1
        } else {
            nums1[cur] = nums2[j]
            j -= 1
            cur -= 1
        }
    }
}

func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var cur = m + n - 1
    var i = m - 1
    var j = n - 1
    while j >= 0  {
        if i >= 0 && nums1[i] > nums2[j] {
            nums1[cur] = nums1[i]
            i -= 1
            cur -= 1
        } else {
            nums1[cur] = nums2[j]
            j -= 1
            cur -= 1
        }
    }
}

var nums1 = [1,3,5,0,0,0]
merge2(&nums1, 3, [2,4,6], 3)

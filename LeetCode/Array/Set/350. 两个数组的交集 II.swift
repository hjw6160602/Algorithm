//
//  350. 两个数组的交集 II.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/7/26.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/intersection-of-two-arrays-ii

import Foundation

extension Solution {

//    20 ms 14.91%
//    13.8 MB 77.02%
    func intersect2P1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res = [Int]()
        var set = nums1
        for num in nums2 {
            var finda = false
            for j in 0..<set.count where !finda {
                guard num == set[j] else{
                    continue
                }
                res.append(num)
                set[j] = -1
                finda = true
            }
        }
        
        return res
    }
    
    func intersect2P2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count > nums2.count {
            return intersect2P2(nums2, nums1)
        }
        
        var res = [Int]()
        let set = nums1.sorted()
        let nums = nums2.sorted()
        print(set, nums)
//        var i = 0
//        for num in nums {
//            for j in i..<set.count {
//                guard num == set[j] else { continue }
//                res.append(num)
//                i += 1
//            }
//        }
        return res
    }
    
//    12 ms 99.38%
//    14 MB 40.99%
    
    func intersectSoap(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var numsFreq = Dictionary(nums1.map { ($0, 1) }, uniquingKeysWith: +)
        var res = [Int]()
        
        for num in nums2 {
            if let freq = numsFreq[num], freq > 0 {
                res.append(num)
                numsFreq[num] = freq - 1
            }
        }
        return res
    }
}

func test350Intersect() {
//    [-1,-1] [1,2,2,1]
    
//    let nums1 = [1,2,2,1], nums2 = [2,2]
    let nums1 = [9,4,8,4,9,3], nums2 = [4,9,3]
    let x = LeetCode.intersectSoap(nums1, nums2)
    print(x)
}


//给你两个整数数组 nums1 和 nums2 ，请你以数组形式返回两数组的交集。
//返回结果中每个元素出现的次数，应与元素在两个数组中都出现的次数一致（如果出现次数不一致，则考虑取较小值）。可以不考虑输出结果的顺序。
//
//示例 1：
//输入： [1,2,2,1], nums2 = [2,2]
//输出：[2,2]
//
//示例 2:  9 1 4 1
//输入：nums1 = [-1,-1,5], nums2 = [9,4,9,8,4]
//输出：[4,9]
//
//提示：
//
//1 <= nums1.length, nums2.length <= 1000
//0 <= nums1[i], nums2[i] <= 1000
//
//进阶
//如果给定的数组已经排好序呢？你将如何优化你的算法？
//如果 nums1 的大小比 nums2 小，哪种方法更优？
//如果 nums2 的元素存储在磁盘上，内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？

//
//  16.16.部分排序.swift
//  Array
//
//  Created by SaiDiCaprio on 2021/12/9.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/sub-sort-lcci/

import Foundation

extension Solution {
    func subSort(_ array: [Int]) -> [Int] {
//        var first = 0
//        var second = array.count - 1
//
//        for i in 1..<array.count - 1 {
//            if array[i] < array[first] {
//                first = i
//                break
//            }
//        }
//
//        for j in (first..<array.count - 1).reversed() {
//            if array[j] > array[first] || array[j] {
//                first = i
//                break
//            }
//        }
//
//        if first == 0 && second == array.count - 1 {
            return [-1, -1]
//        }
//        return [first, second]
    }
}

func testSubSort() {
    let array = [1,2,4,7,10,11,7,12,6,7,16,18,19]
//    var colors = [1]
    let index = LeetCode.subSort(array)
    print(index)
}


// 给定一个整数数组，编写一个函数，找出索引m和n，
// 只要将索引区间[m,n]的元素排好序，整个数组就是有序的。注意：n-m尽量最小，
// 也就是说，找出符合条件的最短序列。函数返回值为[m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。
//
//示例：
//
//输入： [1,2,4,  7,10,11,7,12,6,7,  16,18,19]
//输出： [3,9]
//提示：
//
//0 <= len(array) <= 1000000

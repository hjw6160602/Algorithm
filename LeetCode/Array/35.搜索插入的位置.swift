//
//  35.搜索插入的位置.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/4/2.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    20 ms 99.33%
//    14.4 MB 5.17%
//    64 / 64
    // 没有跑通的case：第一位就比较小 返回0的情况
    // start 比 end 大的情况没考虑
    // start 有可能会出现在末尾的情况
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard target > nums[0] else { return 0}
        let res = _binarySearch(nums, start: 1, end: nums.count - 1, target: target)
        return res
    }
    
    private func _binarySearch(_ nums: [Int],
                               start: Int,
                               end: Int,
                               target: Int) -> Int {
        guard start < nums.count else { return start }
        guard start <= end else {
            return target > nums[start] ? (start + 1) : start
        }
        
        let midIndex = (end - start) / 2 + start
        guard nums[midIndex] != target else {
            return midIndex
        }
        if nums[midIndex] > target {
            return _binarySearch(nums, start: start, end: midIndex - 1, target: target)
        } else {
            return _binarySearch(nums, start: midIndex + 1, end: end, target: target)
        }
    }
    
//    20 ms 99.33%
//    14.1 MB 27.72%
    func searchInsertSwift(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var left = 0
        var right = nums.count - 1
        var mid = 0
        
        while left + 1 < right {
            mid = (right - left) / 2 + left
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid
            } else {
                right = mid
            }
        }
        
        if nums[right] < target {
            return right + 1
        }
        if nums[left] >= target {
            return left
        }
        return right
    }
}

func testSearchInsert() {
//    let x = LeetCode.searchInsert([1,3,5,6], 5)
//    let x = LeetCode.searchInsert([1,3,5,6], 2)
//    let x = LeetCode.searchInsert([1,3,5,6], 7)
    let x = LeetCode.searchInsertSwift([1,3], 0)
//    let x = LeetCode.searchInsert([3,5,7,9,10], 8)
    
    
    print(x)
}

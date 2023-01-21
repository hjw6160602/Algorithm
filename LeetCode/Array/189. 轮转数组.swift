//
//  189. 轮转数组.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/4/19.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    892 ms 24.68%
//    21.2 MB 31.33%
    func rotate(_ nums: inout [Int], _ k: Int) {
        let times = k % nums.count
        for _ in 0..<times {
            let num = nums.removeLast()
            nums.insert(num, at: 0)
        }
    }
    
    func rotateP1(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let k = k % n
        for _ in 0..<(n - k) {
            
        }
    }
    
    func rotateSwift(_ nums: inout [Int], _ k: Int) {
        guard nums.count > 0 && k > 0 else {
            return
        }
        let k = k % nums.count
        guard k != 0 else {
            return
        }
        _reverse(&nums, 0, nums.count - 1)
        _reverse(&nums, 0, k - 1)
        _reverse(&nums, k, nums.count - 1)
    }
    
    private func _reverse(_ nums: inout [Int], _ startIdx: Int, _ endIdx: Int) {
        // edge case
        if startIdx < 0 || endIdx > nums.count || startIdx >= endIdx {
            return
        }
        
        var startIdx = startIdx
        var endIdx = endIdx
        
        while startIdx < endIdx {
            _swap(&nums, startIdx, endIdx)
            startIdx += 1
            endIdx -= 1
        }
    }
    
    private func _swap<T>(_ nums: inout Array<T>, _ p: Int, _ q: Int) {
        (nums[p], nums[q]) = (nums[q], nums[p])
    }
}

func test189Rotate() {
//    var nums = [1,2,3,4,5,6,7], k = 2
    var nums = [-1,-100,3,99], k = 2
    LeetCode.rotate(&nums, k)
    print(nums)
}

//
//  41.缺失的第一个正数 .swift
//  Array
//
//  Created by 贺嘉炜 on 2023/2/26.
//  Copyright © 2023 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/first-missing-positive/

import Foundation

func test41firstMissingPositive() {
    let nums = [2,1]
//    let nums = [1,1]
//    let nums = [0,1,2]
//    let nums = [3,4,-1,1]
    let x = LeetCode.firstMissingPositive(nums)
    print(x)
}

extension Solution {
    // 原地交换方案 注意 数组错位
    // [1 2 3 4 5]
    //  0 1 2 3 4
//    276 ms 10.34%
//    17.9 MB 93.10%
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        
        var i = 0
        while i < nums.count {
            var target = nums[i]
            // 判断元素是否是正数，且 坐标 是否越界 最后判断 是否一一对应。
            while target > 0 && target-1 < nums.count && nums[target-1] != target {
                // 不停的去交换 元素 直到换进来的元素不参与 那么去下一个位置交换
                let next = nums[target-1]
                nums[target-1] = target
                target = next
            }
            i += 1
        }
        
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
    
    //    368 ms 6.90%
    //    18 MB 93.10%
    func firstMissingPositiveBool(_ nums: [Int]) -> Int {
        
        var isFillArray = Array(repeating: false, count: nums.count+2)
        var minPosNo = 1
        for num in nums {
            if num > 0 {
                minPosNo = min(minPosNo, num)
            }
        }

        for num in nums {
            if num > 0 && num < isFillArray.count {
                isFillArray[num] = true
            }
        }

        for i in 1..<isFillArray.count {
            if isFillArray[i] == false {
                return i
            }
        }
        return minPosNo
    }
}



//
//  268. 丢失的数字.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/4/19.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        var sum = 0
        for num in nums {
            sum += num
        }
        return n * (1 + n) / 2 - sum
    }
    
//    96 ms 91.57%
//    14.1 MB 55.42%
    func missingNumberSwift(_ nums: [Int]) -> Int {
        return nums.count * (nums.count + 1) / 2 - nums.reduce(0, +)
    }
    
//    120 ms 13.24%
//    14.2 MB 42.65%
    
    func missingNumberDong(_ nums: [Int]) -> Int {
        let n = nums.count
        var res = 0
        // 新补的索引
        res += n
        for (i, num) in nums.enumerated() {
            res += (i - num)
        }
        return res
    }
}

func test268MissingNumber() {
//    let x = LeetCode.missingNumber([0])
    let x = LeetCode.missingNumber([0, 1])
//    let x = LeetCode.missingNumber([3,0,1])
//    let x = LeetCode.missingNumber([9,6,4,2,3,5,7,0,1])
    print(x)
}

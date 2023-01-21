//
//  剑指 Offer 66. 构建乘积数组.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/8/23.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    func constructArr(_ a: [Int]) -> [Int] {
        var b = Array(repeating: 0, count: a.count)
        b[0] = 1
        for i in 1..<a.count {
            b[i] = b[i-1] * a[i-1]
        }
        var temp = 1
        for i in (0..<a.count-2).reversed() {
            temp *= a[i+1]
            b[i] *= temp
        }
        return b
    }
}

func test66constructArr() {
    let nums = [1,2,3,4,5]
    let x = LeetCode.constructArr(nums)
    print(x)
}

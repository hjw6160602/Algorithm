//
//  File.swift
//  Math
//
//  Created by 贺嘉炜 on 2023/3/13.
//  Copyright © 2023 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/integer-to-roman/submissions/412884580/

import Foundation

//enum Test: Int {
//    a,
//    b = 2,
//    c,
//    d
//}


enum Test: Int {
    case a
    case b = 2
    case c
    case d
}

func intToRoman() {
    let test = Test(rawValue: 1)
    print(test)
//    let nums = [3,4,9,58,1994]
//    for num in nums {
//        let x = LeetCode.int2Roman(num)
//        print(x)
//    }
}
extension Solution {
    func intToRoman(_ num: Int) -> String {
//        20 ms  76.12%
//        13.9 MB 13.43%
        let nums = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let romans = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        
        var num = num
        // 结果数组
        var resArr = [String]()
        
        for i in 0..<nums.count {
            while num >= nums[i] {
                
                num -= nums[i]
                
                resArr.append(romans[i])
            }
        }
        return resArr.joined()
    }
    
}

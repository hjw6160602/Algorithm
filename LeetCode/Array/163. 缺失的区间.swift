//
//  163. 缺失的区间.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/7/24.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
//    4 ms 28.57%
//    13.7 MB 85.71%
    
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        guard nums.count > 0 else {
            if lower != upper {
                return ["\(lower)->\(upper)"]
            } else {
                return ["\(upper)"]
            }
        }
        let n = nums.count
        
        var lower = lower, last = Int.min
        var res = [String](), i = 0
        
        while i < n {
            defer {
                last = nums[i]
                i += 1
            }
            guard nums[i] >= lower else { continue }
    
            if nums[i] == lower {
                lower += 1
                continue
            }
            let rNum = nums[i] - 1
            let lNum = last + 1 < lower ? lower: last + 1
            appendRange(&res, lNum, rNum)
            lower = nums[i] + 1
        }
        if nums[n-1] < upper {
            appendRange(&res, lower, upper)
        }
        return res
    }
    
    private func appendRange(_ res: inout [String], _ lower: Int, _ upper: Int) {
        if lower == upper {
            res.append("\(upper)")
        } else {
            res.append("\(lower)->\(upper)")
        }
    }
}

func test163FindMissingRanges() {
//    let nums = [0, 1, 3, 50, 75]
//    let lower = 0, upper = 99
////    let nums = [3]
    
    let nums:[Int] = []
    let lower = 1, upper = 2
    
//    let nums = [-1]
//    let lower = -1, upper = 0
    let x = LeetCode.findMissingRanges(nums, lower, upper)
    print(x)
}




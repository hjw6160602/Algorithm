//
//  169. 多数元素.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/4/20.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation


extension Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0, candidate = 0
        
        for num in nums {
            if count == 0 {
                candidate = num
                print("taste candidate!")
            }
            
            count += (candidate == num) ? 1 : -1
            print("num: \(num), count: \(count)")
        }
        
        return candidate
    }
}

func test169MajorityElement() {
    let x = LeetCode.majorityElement([2,2,1,1,1,2,2])
    print(x)
}

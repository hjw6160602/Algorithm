//
//  136.只出现一次的数字.swift
//  String
//
//  Created by 贺嘉炜 on 2022/4/7.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
//    92 ms 94.07%
//    14.5 MB 38.58%
    
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        
        for num in nums {
            res ^= num
            print("num:\(num)，res:\(res)" )
        }
        
        return res
    }
}

func testSingleNum() {
    let x = LeetCode.singleNumber([4,1,2,1,2])
    print(x)
}

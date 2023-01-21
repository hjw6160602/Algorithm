//
//  338. 比特位计数.swift
//  Math
//
//  Created by 贺嘉炜 on 2022/7/19.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    32 ms 85.88%
//    18.8 MB 67.06%
//    15 / 15
    func countBits(_ n: Int) -> [Int] {
        var res = Array(repeating: 0, count: n + 1)
        for i in 0...n {
            var count = 0, j = i
            while j > 0 {
                if j & 1 == 1 {
                    count += 1
                }
                j = j >> 1
            }
            res[i] = count
        }
        return res
    }
}

func test338CountBits() {
    let x  = LeetCode.countBits(2)
    print(x)
}

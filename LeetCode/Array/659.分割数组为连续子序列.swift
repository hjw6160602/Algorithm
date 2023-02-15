//
//  659.分割数组为连续子序列.swift
//  Array
//
//  Created by 贺嘉炜 on 2023/2/15.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        var freq = [Int: Int]()
        var need = [Int: Int]()
        for num in nums {
            freq[num, default: 0] += 1
        }

        for num in nums {
            if freq[num] == 0 {
                // 已经被用到其他子序列中
                continue
            }
            // 先判断 v 是否能接到其他子序列后面
            if need[num, default: 0] > 0 {
                freq[num]! -= 1
                need[num]! -= 1
                need[num+1, default: 0] += 1
            } else if freq[num]! > 0 && freq[num+1, default:0] > 0 && freq[num+2, default:0] > 0 {
                // 将 v 作为开头，新建一个长度为 3 的子序列 [v,v+1,v+2]
                freq[num]! -= 1
                freq[num+1]! -= 1
                freq[num+2]! -= 1
                // 对 v + 3 的需求加一
                need[num+3, default: 0] += 1
            } else {
                return false
            }
        }
        return true
    }
}


func test659isPossible() {
    let x = LeetCode.isPossible([1,2,3,3,4,5])
    print(x)
}

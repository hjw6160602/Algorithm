//
//  31.下一个排列.swift
//  Array
//
//  Created by SaiDiCaprio on 2022/7/20.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation


extension Solution {
    func nextPermutation(_ nums: inout [Int]) {
        //[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]
        //[1.2.3.4] [1,2,4,3],[1,3,2,4],[]
    }
}

func test31NextPermutation() {
    var nums = [2,1,3]
    LeetCode.nextPermutation(&nums)
    print(nums)
}

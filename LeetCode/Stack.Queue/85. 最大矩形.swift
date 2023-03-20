//
//  85. 最大矩形.swift
//  Stack.Queue
//
//  Created by 贺嘉炜 on 2023/3/20.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
//    188 ms 100%
//    14.8 MB 60%
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        var res = 0
        var heights = Array(repeating: 0, count: matrix[0].count)
        for row in 0..<matrix.count {
            //遍历每一列，更新高度
            for col in 0..<matrix[0].count {
                if (matrix[row][col] == "1") {
                    // 当前层为1 在上一层基础上高度+1
                    heights[col] += 1;
                } else {
                    // 当前层出现了0 直接恢复高度到0
                    heights[col] = 0;
                }
            }
            //调用最大矩阵面积的解法，更新函数
            res = max(res, largestArea(heights));
        }
        return res
    }
}

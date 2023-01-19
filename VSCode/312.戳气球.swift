//
//  312. 戳气球.swift
//  DynamicPrograming
//
//  Created by WillJay on 2023/1/19.
//  Copyright © 2023 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/burst-balloons/
//

// @lc code=start

// 60 ms 45.45%
// 4.3 MB 81.82%

class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        let n: Int = nums.count
        var points: [Int] = Array(repeating: 1, count: n+2)
        for i in 0..<n {
            points[i+1] = nums[i]
        }

        var dp = Array(repeating: Array(repeating: 0, count: n+2), 
                       count: n+2)
        for i in (0...n).reversed() {
            for j in i+1...n+1 {
                for k in (i+1..<j) {
                    dp[i][j] = max(
                        dp[i][j], 
                        dp[i][k] + points[i] * points[k] * points[j] + dp[k][j]
                    )
                }
            }
        }
        return dp[0][n+1]
    }
}

// @lc code=end


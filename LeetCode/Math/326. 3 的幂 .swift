//
//  326. 3 的幂 .swift
//  Math
//
//  Created by 贺嘉炜 on 2022/7/2.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/power-of-three

import Foundation

extension Solution {
//    52 ms 41.18%
//    14.1 MB 47.06%
    func isPowerOfThree(_ n: Int) -> Bool {
        var n = n
        while n > 0 && n % 3 == 0 {
            n = n / 3
        }
        return n == 1
    }
    
//    60 ms 17.65%
//    14.2 MB 25.00%
    func isPowerOfThreeP1(_ n: Int) -> Bool {
        return n > 0 && 1162261467 % n == 0
    }
    
//    32 ms 97.06%
//    13.9 MB 82.35%
    func isPowerOfThreeP2(_ n: Int) -> Bool {
        var y = 1
        while y < n {
            y *= 3
        }
        return y == n
    }
}

func test326IsPowerOfThree() {
    let x = LeetCode.isPowerOfThreeP2(3)
    print(x)
}

//给定一个整数，写一个函数来判断它是否是 3 的幂次方。如果是，返回 true ；否则，返回 false 。
//
//整数 n 是 3 的幂次方需满足：存在整数 x 使得 n == 3x
//
//
//
//示例 1：
//
//输入：n = 27
//输出：true
//示例 2：
//
//输入：n = 0
//输出：false
//示例 3：
//
//输入：n = 9
//输出：true
//示例 4：
//
//输入：n = 45
//输出：false
//
//
//提示：
//
//-231 <= n <= 231 - 1

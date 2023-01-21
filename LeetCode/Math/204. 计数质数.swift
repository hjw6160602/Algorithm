//
//  204. 计数质数.swift
//  Math
//
//  Created by 贺嘉炜 on 2022/7/3.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/count-primes

import Foundation

extension Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        var isPrime = Array(repeating: true, count: n)
        for i in 2..<n {
            // 从2 开始去找因数
            var j = 2
            while j * j <= i {
                // 如果不能整除那么直接 continue
                guard i % j == 0 else {
                    j += 1
                    continue
                }
                // 来到这里证明找到了因数 j
                isPrime[i] = false
                var k = j * 2
                while k < n {
                    // 将后面数组中所有该因数的倍数全部标记为false
                    isPrime[i] = false
                    k += k
                }
                j += 1
            }
        }
        // 计数器找到当前数组中所有质数的个数
        var count = 0
//        var x = "\(n) 的质因数："
        for index in 2..<n where isPrime[index] {
//            x.append("\(index),")
            count += 1
        }
//        print(x)
        return count
    }
}


func test204CountPrimes() {
    let x = LeetCode.countPrimes(5000000)
    print(x)
}

//给定整数 n ，返回 所有小于非负整数 n 的质数的数量 。
//
//示例 1：
//输入：n = 10
//输出：4
//解释：小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
//
//示例 2：
//输入：n = 0
//输出：0
//
//示例 3：
//输入：n = 1
//输出：0
//
//提示：
//0 <= n <= 5 * 10^6

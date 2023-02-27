//
//  204. 计数质数.swift
//  Math
//
//  Created by 贺嘉炜 on 2022/7/3.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/count-primes

import Foundation
func test204CountPrimes() {
    let x = PrimesCount().countPrimes(5000000)
    print(x)
}

class PrimesCount {
    var primeList = [2, 3, 5, 7, 11, 13]

    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else {
            return 0
        }
        var res = 0
        for prime in primeList {
            guard prime < n else {
                return res
            }
            res += 1
        }
        let tailPrime = primeList.last!
        for i in tailPrime+1..<n {
            if isPrime(i) {
                primeList.append(i)
                res += 1
            }
        }
        return res
    }

    private func isPrime(_ n: Int) -> Bool {
        // 除数最大试到n / 3
        var maxDiv = Int(sqrt(Double(n)))
        let tailPrime = primeList.last!
        if n < tailPrime {
            for prime in primeList {
                if prime == n {
                    return true
                }
            }
        }
        for i in 2...maxDiv {
            let res = n / i
            // 不用区域运算而是用是否相乘后刚好等于n
            if res * i == n {
                return false
            }
        }
        return true
    }
}

extension Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else {
            return 0
        }
        
        // init isPrime bool array
        var isPrime = Array(repeating: true, count: n)
        isPrime[0] = false
        isPrime[1] = false
        
        // count prime number
        var count = 0
        for num in 2..<n {
            guard isPrime[num] else {
                continue
            }
            
            count += 1
            // 如果当前是素数
            var nextNum = num * num
            // 就把从 i*i 开始，i 的所有倍数都设置为 false。
            while nextNum < n {
                isPrime[nextNum] = false
                nextNum += num
            }
        }
        
        return count
    }
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

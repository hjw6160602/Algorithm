//
//  412. Fizz Buzz.swift
//  String
//
//  Created by 贺嘉炜 on 2022/7/31.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/fizz-buzz

import Foundation

extension Solution {
    
//        20 ms 86.36%
//        13.9 MB 100.00%
    func fizzBuzz(_ n: Int) -> [String] {
        var res = [String]()
        for i in 1...n {
            var num = ""
            var needChange  = false
            if i % 3 == 0 {
                num = "Fizz"
                needChange = true
            }
            if i % 5 == 0 {
                num.append("Buzz")
                needChange = true
            }
            if !needChange {
                num = "\(i)"
            }
            res.append(num)
        }
        return res
    }
    
//    20 ms 86.36%
//    14 MB 98.48%
    func fizzBuzzP1(_ n: Int) -> [String] {
        var res = [String]()
        for i in 1...n {
            var num = ""
            if i % 3 == 0 {
                num = "Fizz"
            }
            if i % 5 == 0 {
                num.append("Buzz")
            }
            if num.count == 0 {
                num = "\(i)"
            }
            res.append(num)
        }
        return res
    }
}

func test412FizzBuzz() {
    let x = LeetCode.fizzBuzzP1(15)
    print(x)
}

//给你一个整数 n ，找出从 1 到 n 各个整数的 Fizz Buzz 表示，并用字符串数组 answer（下标从 1 开始）返回结果，其中：
//
//answer[i] == "FizzBuzz" 如果 i 同时是 3 和 5 的倍数。
//answer[i] == "Fizz" 如果 i 是 3 的倍数。
//answer[i] == "Buzz" 如果 i 是 5 的倍数。
//answer[i] == i （以字符串形式）如果上述条件全不满足。
//
//示例 1：
//输入：n = 3
//输出：["1","2","Fizz"]
//
//示例 2：
//输入：n = 5
//输出：["1","2","Fizz","4","Buzz"]
//
//示例 3：
//输入：n = 15
//输出：["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]

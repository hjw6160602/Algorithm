//
//  70. Climbing Stairs.swift
//  DynamicPrograming
//
//  Created by saidicaprio on 2019/4/11.
//  Copyright © 2019 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/climbing-stairs

extension Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        } else if n == 2 {
            return 2
        }
        var sum1 = 1
        var sum2 = 2
        for _ in 3...n {
            sum2 = sum1 + sum2
            sum1 = sum2 - sum1
        }
        return sum2
    }
    
    func climbStairsSwift(_ n: Int) -> Int {
        if n < 0 {
            return 0
        }
        if n == 0 || n == 1 {
            return 1
        }
        
        var prev = 0, post = 1, total = 0
        
        for _ in 1...n {
            total = prev + post
            
            prev = post
            post = total
        }
        return total
    }
}

extension Solution {
    // 递推版本
    func climbStairsRecurrence(_ n: Int) -> Int {
        if n == 1 {
            return 1
        } else if n == 2 {
            return 2
        }
        var sum1 = 1
        var sum2 = 1
        var sum = sum1 + sum2
        for _ in 2...n {
            sum = sum1 + sum2
            sum1 = sum2
            sum2 = sum
        }
        return sum
    }
    
    /// 最Low的写法 用原始递归
    func climbStairsLow(_ n: Int) -> Int {
        if n == 1 {
            return 1
        } else if n == 2 {
            return 2
        }
        var steps = [Int](repeating: 0, count: n + 1)
        steps[1] = 1
        steps[2] = 2
        return _helper(n, &steps)
    }
    
    private func _helper(_ n: Int, _ steps: inout [Int]) -> Int {
        if steps[n] != 0 {
            return steps[n]
        }
        steps[n] = _helper(n - 1, &steps) + _helper(n - 2, &steps)
        return steps[n]
    }
    
    func climbStairsArray(_ n: Int) -> Int {
        if n == 1 {
            return 1
        } else if n == 2 {
            return 2
        }
        var array = [Int](repeating: 0, count: n + 1)
        array[1] = 1
        array[2] = 2
        return _climbArray(n - 1, &array) + _climbArray(n - 2, &array)
    }
    
    private func _climbArray(_ n: Int, _ array: inout [Int])  -> Int {
        if array[n] == 0 {
            array[n] = _climbArray(n - 1, &array) + _climbArray(n - 2, &array)
        }
        return array[n]
    }
}

 func testClimbStairs() {
    let res = LeetCode.climbStairs(10)
    print(res)
}

//假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
//每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
//注意：给定 n 是一个正整数。

//示例 1：
//输入： 2
//输出： 2
//解释： 有两种方法可以爬到楼顶。
//1.  1 阶 + 1 阶
//2.  2 阶

//示例 2：
//输入： 3
//输出： 3
//解释： 有三种方法可以爬到楼顶。
//1.  1 阶 + 1 阶 + 1 阶
//2.  1 阶 + 2 阶
//3.  2 阶 + 1 阶

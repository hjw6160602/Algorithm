//
//  509.斐波那契数.swift
//  Math
//
//  Created by 贺嘉炜 on 2021/3/7.
//  Copyright © 2021 saidicaprio. All rights reserved.
//

import Foundation

// 递归解法
extension Solution {
    func fib(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 2 else { return 1 }
        var first = 1
        var second = 1
        for _ in 3...n {
            second = first + second
            first = second - first
        }
        return second
    }
    
    // 滚动数组 (%2 = &1)
    func fibRollingArray(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 2 else { return 1 }
        var array = [Int](repeating: 0, count: 2)
        array[0] = 1
        array[1] = 1
        for i in 3...n {
            array[i & 1] = array[(i - 1) & 1] + array[(i - 2) & 1]
        }
        return array[n & 1]
    }
    
    // 最low的递归
    func fibLow(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 2 else { return 1 }
        return fibLow(n - 1) + fibLow(n - 2)
    }
    
    // 重复调用的时候抹掉递归调用
    func fibArray(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 2 else { return 1 }
        var array = [Int](repeating: 0, count: n + 1)
        array[1] = 1
        array[2] = 1
        return _fibArray(n - 1, &array) + _fibArray(n - 2, &array)
    }
    
    private func _fibArray(_ n: Int, _ array: inout [Int])  -> Int {
        if array[n] == 0 {
            array[n] = _fibArray(n - 1, &array) + _fibArray(n - 2, &array)
        }
        return array[n]
    }
}

func testFib() {
    let res = LeetCode.fib(10)
    print(res)
}

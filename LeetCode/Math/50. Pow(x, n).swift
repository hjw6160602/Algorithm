//
//  50. Pow(x, n).swift
//  Math
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
//  https://leetcode.com/problems/powx-n/description/

import Foundation

// -100.0 < x < 100.0
// n in range [−231, 231 − 1]

extension Solution {
    func myPow0(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        if n < 0 { return 1 / myPow0(x, -n) }
        if n % 2 == 1 {
            return x * myPow0(x, n - 1)
        }
        return myPow0(x * x, n / 2)
    }
    
    // 100% 递归写法
    func myPowP1(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        if n == -1 { return 1 / x }
        // 先算出其中的一半
        var half = myPowP1(x, n >> 1)
        half *= half
        // 是否为奇数
        return ((n & 1) == 1) ? (half * x) : half
    }
}


extension Solution {
    func myPow1(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        guard x != 0 else { return 0 }
        
        var res = _helper(abs(x), abs(n))
        
        if n < 0 {
            res = 1 / res
        }
        if n % 2 != 0 && x < 0 {
            res = -res
        }
        return res
    }
    
    private func _helper(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        guard n != 1 else { return x }
        if n % 2 == 0 { // 判断基数或者是偶数
            return _helper(x * x, n / 2)
        } else {
            return _helper(x, n - 1) * x
        }
    }
}

// MARK: - 错误写法
// 方法1：傻乘 pow参数为(0.00001, 2147483647)超时
extension Solution {
    func myPow2(_  x : Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        guard x != 0 else { return 0 }
        guard x != 1 else { return 1 }
        var res: Double = 1
        var multiplicator = x
        var power = n
        if n < 0 {
            multiplicator = 1 / x
            power = -1 * n
        }
        for _ in 1...power {
            res = res * multiplicator;
        }
        return res;
    }
}

// 递归写法 幂级大于58233报错 EXC_BAD_ACCESS (code=2,...)
extension Solution {
    func myPow3(_ x: Double, _ n: Int) -> Double {
        var res: Double = 1
        if n > 0 {
            //            print("res: " + String(res))
            //            print("n: " + String(n) )
            res = myPow3(x, n - 1) * x
        } else if n < 0 {
            res = myPow3(x, n + 1) / x
        }
        return res;
    }
}

func testMyPow() {
    print(LeetCode.myPow1(2.00000, 10))
    print(LeetCode.myPow1(2.10000, 3))
    print(LeetCode.myPow1(2.00000, -2))
    print(LeetCode.myPow1(0.44528, 0))
    print(LeetCode.myPow1(1.00001, 123456))
    print(LeetCode.myPow1(0.00001, 2147483647))
}


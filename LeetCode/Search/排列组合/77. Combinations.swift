//
//  77. Combinations.swift
//  Math
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/combinations

extension Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        var combination = [Int]()
        
        selectRecur(&result, &combination, start: 1, n: n, left: k)
        
        return result
    }
    
    private func selectRecur(_ res: inout [[Int]], _ combination: inout [Int], start: Int, n: Int, left: Int) {
        if left == 0 {
            res.append(combination)
            return
        }
        guard start <= n else {
            return
        }
        for i in start...n {
            combination.append(i)
            selectRecur(&res, &combination, start: i + 1, n: n, left: left - 1)
            combination.removeLast()
        }
    }
}

//       n
//为什么  ∑ C(n,k) = 2^n
//      k=0

// 在排列组合、二项式定理一章。
// 在（a+b)^n = a^n+C(n,1)a^(n-1) * b + C(n,2) a^(n-2) *b^2+……+C(n,n)b^n)中，令a=b=1,就会得到
// 1+C(n,1)+C(n,2)+……+C(n,n)=(1+1)^2=2^n.

func testCombine() {
//    var sum = 0, N = 5
//    for i in 0...N {
//        let res = LeetCode.combine(N, i)
//        sum += res.count
//    }
    let res = LeetCode.combine(3, 3)
    print(res)
}

//给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。
//
//示例:
//
//输入: n = 4, k = 2
//输出:
//[
//  [2,4],
//  [3,4],
//  [2,3],
//  [1,2],
//  [1,3],
//  [1,4],
//]

//let s = Solution2()
//print(s.combine(4, 2))
//for index in 1...4 {
//    let res = s.combine(4, index)
//    print(res)
//}

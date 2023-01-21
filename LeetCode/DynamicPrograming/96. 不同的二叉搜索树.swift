//
//  96. 不同的二叉搜索树.swift
//  DynamicPrograming
//
//  Created by SaiDiCaprio on 2022/7/27.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/unique-binary-search-trees

import Foundation

extension Solution {
    
    
//    0 ms 100.00%
//    13.1 MB 98.98%
    func numTrees(_ n: Int) -> Int {
        
         // 提示：我们在这里需要用 long 类型防止计算过程中的溢出
        var C = 1
        for i in 0..<n {
            C = C * 2 * (2 * i + 1) / (i + 2)
        }
        return C
    }
    
//    0 ms 100.00%
//    13.4 MB 70.41%
//    1. G(n) = F(1, n) + F(1, n) + ... + F(n, n)
//    2. F(i, n) = G(i-1) * G(n-i)
//    3. G(n) = G(0)*G(n-1) + G(1)*G(n-2) + ... + G(n-1)*G(0)
    func numTreesP1(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var G = Array(repeating: 0, count: n + 1)
        G[0] = 1
        G[1] = 1
        for i in 2...n {
            for j in 1...i {
                G[i] += G[j - 1] * G[i - j]
            }
        }
        return G[n]
    }

}

func test96NumTrees() {
    let x = LeetCode.numTreesP1(3)
    print(x)
}




//给你一个整数 n ，求恰由 n 个节点组成且节点值从 1 到 n 互不相同的 二叉搜索树
//有多少种？返回满足题意的二叉搜索树的种数。

//示例 1：
//输入：n = 3
//输出：5
//
//示例 2：
//输入：n = 1
//输出：1
//
//提示：
//1 <= n <= 19

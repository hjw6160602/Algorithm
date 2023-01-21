//
//  46. 全排列.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2021/2/25.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/permutations

import Foundation

class Permute {
    ///
    var nums: [Int] = []
    ///
    var path: [Int] = []
    ///
    var res: [[Int]] = []
    
    var isVisited = [Bool]()
    
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return [[Int]]()
        }
        self.nums = nums
        self.isVisited = [Bool](repeating: false, count: nums.count)
        dfs(idx: 0)
        return res
    }
    
    private func dfs(idx : Int) {
        // 不能再往下搜索
        if path.count == nums.count {
            res.append(path)
            return
        }
        // 枚举这一层所有可以做出的选择
        for (i, num) in nums.enumerated() where !isVisited[i] {
            path.append(num)
            isVisited[i] = true
            dfs(idx: i + 1)
            // 还原现场
            isVisited[i] = false
            path.removeLast()
        }
    }
}

//
class PermuteSwap {
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return [[Int]]()
        }
        var path: [Int] = nums
        var res: [[Int]] = []
        dfs(idx: 0, path: &path, res: &res)
        return res
    }
    
    private func dfs(idx : Int, path: inout [Int], res: inout [[Int]]) {
        // 不能再往下搜索
        if idx == path.count {
            res.append(path)
            return
        }
        
        // 枚举这一层所有可以做出的选择
        for i in idx..<path.count {
            (path[i], path[idx]) = (path[idx], path[i])
            dfs(idx: idx + 1, path: &path, res: &res);
            (path[i], path[idx]) = (path[idx], path[i])
        }
    }
}

//8 ms 99.57%
//14.2 MB 5.60%

class PermuteP1 {
    ///
    var res = [[Int]]()
    ///
    var premute = [Int]()
    ///
    var nums = [Int]()
    ///
    var visted = [Bool]()
    
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [[Int]]() }
        
        self.nums = nums
        self.visted = Array(repeating: false, count: nums.count)
        
        _dfs(idx: 0)
        
        return res
    }
    
    private func _dfs(idx : Int) {
        guard idx < nums.count else {
            res.append(premute)
            return
        }
        
        for (index, num) in nums.enumerated() {
            guard !visted[index] else {
                continue
            }
            // 添加当前的数字 并标记为已访问
            premute.append(num)
            visted[index] = true
            // 进入下一层递归
            _dfs(idx: idx + 1)
            // 移除尾部的数字 返回上层递归 并标记为未访问
            premute.removeLast()
            visted[index] = false
        }
    }
}

class PermuteP2 {
    ///
    var res = [[Int]]()
    ///
    var premute = [Int]()
    ///
    var nums = [Int]()
    ///
    var visted = [Bool]()
    
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return [[Int]]()
        }
        
        self.nums = nums
        self.visted = Array(repeating: false, count: nums.count)
        _dfs(idx: 0)
        return res
        
    }
    
    private func _dfs(idx : Int) {
        guard idx < nums.count else {
            res.append(premute)
            return
        }
        var index = 0
        for num in nums {
            guard !visted[index] else {
                index += 1
                continue
            }
            
            visted[index] = true
            premute.append(num)
            _dfs(idx: idx + 1)
            
            premute.removeLast()
            visted[index] = false
            index += 1
        }
    }
}

func test46Permute() {
    let solution = PermuteP2()
    let res = solution.permute([1,2,3])
    print(res)
}

//给定一个 没有重复 数字的序列，返回其所有可能的全排列。

//示例:
//输入: [1,2,3]
//输出:
//[
//  [1,2,3],
//  [1,3,2],
//  [2,1,3],
//  [2,3,1],
//  [3,1,2],
//  [3,2,1]
//]

//
//  47. 全排列II.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/2/25.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/permutations-ii

import Foundation

class Permute2P1 {
    var nums = [Int]()
    
    var visited = [Bool]()
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        self.nums = nums
        self.visited = Array(repeating: false, count: nums.count)
        var path = [Int](), res = [[Int]]()
        _dfs(&res, &path)
        return res
    }
    
    private func _dfs(_ res: inout [[Int]], _ path: inout [Int]) {
        // termination case
        if path.count == nums.count {
            res.append(path)
            return
        }
        
        for i in 0..<nums.count {
            if visited[i] || (i > 0 && nums[i] == nums[i - 1] && visited[i - 1]) {
                continue
            }
            
            path.append(nums[i])
            visited[i] = true
            _dfs(&res, &path)
            visited[i] = false
            path.removeLast()
        }
    }
    
//    private func _dfs(idx: Int) {
//        guard idx < nums.count else {
//            res.append(path)
//            return
//        }
//        var last = Int.min
//
//        for i in 0..<nums.count {
//            guard !visited[i] else { continue }
//
//            if last == nums[i] {
//                continue
//            }
//
//            path.append(nums[i])
//            visited[i] = true
//            _dfs(idx: idx + 1)
//
//            last = path.removeLast()
//            visited[i] = false
//
//        }
//    }
}

class PermuteII {
//    136 ms 7.94%
//    14.2 MB 32.54%
    
    var nums = [Int]()
    
    var visited = [Bool]()
    
    var path = [Int]()
    
    var res = Set<[Int]>()
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        self.nums = nums
        self.visited = Array(repeating: false, count: nums.count)
        _dfs(idx: 0)
        return [[Int]](res)
    }
    
    private func _dfs(idx: Int) {
        guard idx < nums.count else {
            res.insert(path)
            return
        }

        for i in 0..<nums.count {
            guard !visited[i] else { continue }
            path.append(nums[i])
            visited[i] = true
            _dfs(idx: idx + 1)
            
            
            path.removeLast()
            visited[i] = false
        }
    }
}

func test47PermuteUnique() {
    let x = Permute2P1().permuteUnique([1,1,3])
    print(x)
}

//给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。
//
//示例 1：
//输入：nums = [1,1,2]
//输出：
//[[1,1,2],
// [1,2,1],
// [2,1,1]]
//
//示例 2：
//输入：nums = [1,2,3]
//输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
//
//
//提示：
//1 <= nums.length <= 8
//-10 <= nums[i] <= 10
//通过次数347,854提交次数535,395



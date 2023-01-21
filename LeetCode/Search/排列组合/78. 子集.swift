//
//  78. 子集.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/7/26.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/subsets

import Foundation

extension Solution {

//    4 ms 97.79%
//    13.9 MB 72.79%
//    10 / 10
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = [[]]
        for num in nums {
            for item in res {
                var subSet = item
                subSet.append(num)
                res.append(subSet)
            }
        }
        return res
    }
    
//    4 ms 97.79%
//    14.1 MB 36.03%
    
    func subsetsP1(nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        
        let nums = nums.sorted()
        
        _dfs(&res, &path, nums, 0)
        
        return res
    }
    
    private func _dfs(_ res: inout [[Int]], _ path: inout [Int],
                      _ nums: [Int], _ index: Int) {
        res.append(path)
        
        for i in index..<nums.count {
            path.append(nums[i])
            _dfs(&res, &path, nums, i + 1)
            path.removeLast()
        }
    }
}

func test78Subsets() {
    testCase4()
//    let nums = [1,2,3]
//    let x = LeetCode.subsets(nums)
//    print(x)
}

func testCase4() {
    let nums = [1,2,3,4]
    let x = LeetCode.subsets(nums)
    print(x)
// [[],
//  [1],
//  [2], [1,2],
//  [3], [1,3], [2,3], [1,2,3],
//  [4], [1,4], [2,4], [1,2,4], [3,4],[1,3,4],[2,3,4],[1,2,3,4]]
}

//给你一个整数 数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。
//解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。

//示例 1：
//输入：nums = [1,2,3]
//输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

//示例 2：
//输入：nums = [0]
//输出：[[],[0]]

//提示：
//1 <= nums.length <= 10
//-10 <= nums[i] <= 10
//nums 中的所有元素 互不相同


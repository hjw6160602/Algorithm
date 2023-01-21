//
//  56. 合并区间.swift
//  Sort
//
//  Created by SaiDiCaprio on 2022/7/20.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/merge-intervals

import Foundation

extension Solution {

//    104 ms 97.31%
//    14.9 MB 98.92%
//    169 / 169
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }
        let intervals = intervals.sorted { $0[0] < $1[0] }
        
        var res = [[Int]]()
        res.append(intervals[0])
        
        var leftIndex = 0
        for i in 1..<intervals.count {
            // 取到当前的区间
            let interval = intervals[i]
            // 通过leftIndex 拿到当前需要判断的区间
            let last = res[leftIndex]
            
            if last[1] >= interval[0] {
                let merged = [last[0], max(last[1], interval[1])]
                res[leftIndex] = merged
            } else {
                res.append(interval)
                leftIndex += 1
            }
        }
        return res
    }
    
//    104 ms 97.31%
//    15.1 MB 83.87%
    func mergeSwift(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        let intervals = intervals.sorted {
            if $0[0] != $1[0] {
                return $0[0] < $1[0]
            } else {
                return $0[1] < $1[1]
            }
        }
        
        for interval in intervals {
            // 第一次进来先将interval 入队
            guard var last = result.last else {
                result.append(interval)
                continue
            }
            if last[1] < interval[0] {
                result.append(interval)
            } else {
                last[1] = max(last[1], interval[1])
                result[result.count - 1] = last
            }
        }
        
        return result
    }
}

func test56Merge() {
    let intervals = [[1,4],[2,3]]
    let x = LeetCode.mergeSwift(intervals)
    print(x)
}

//以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。

//示例 1：
//输入：[[1,3],[2,6],[8,10],[15,18]]
//输出：[[1,6],[8,10],[15,18]]
//解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].

//示例 2：
//输入：intervals = [[1,4],[4,5]]
//输出：[[1,5]]

//解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。
//提示：
//1 <= intervals.length <= 104
//intervals[i].length == 2
//0 <= starti <= endi <= 104

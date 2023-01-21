//
//  39. 组合总和.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/8/11.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/combination-sum

import Foundation

extension Solution {
//https://leetcode.cn/problems/combination-sum/solution/hui-su-suan-fa-jian-zhi-python-dai-ma-java-dai-m-2/
    
//    16 ms 57.92%
//    14.2 MB 18.04%
    
//    Time Complexity: O(n^n), Space Complexity: O(2^n - 1)
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combination = [Int](), combinations = [[Int]]()
//        以 target = 7 为 根结点 ，创建一个分支的时 做减法
        dfs(candidates.sorted(), target, 0, &combinations, &combination)
        
        return combinations
    }
    // 这道题的精髓在于 用target - candidate作为根节点的值 回溯枝剪求解
    private func dfs(_ candidates: [Int], _ target: Int, _ begin: Int,
                     _ combinations: inout [[Int]], _ combination: inout [Int]) {
        if target == 0 {
            // 如果 找到一种选择 那么将该结果返回 结果数组
            combinations.append(combination)
            return
        }
        // 从每一层的第 2 个结点开始，都不能再搜索产生同一层结点已经使用过的 的元素
        // 这里用begin来做 树减
        for i in begin..<candidates.count {
            guard candidates[i] <= target else {
                break
            }
            
            combination.append(candidates[i])
            // 当前target - candidates[i]作为根节点 去下一层进行选择
            dfs(candidates, target - candidates[i], i, &combinations, &combination)
            // 这里需要回溯 把最后一个加进来的元素删掉先
            combination.removeLast()
        }
    }
}

func test39CombinationSum() {
    let candidates = [2,3,6,7], target = 7
    let x = LeetCode.combinationSum(candidates, target)
    print(x)
    
}

//给你一个 无重复元素 的整数数组 candidates 和一个目标整数 target ，找出 candidates 中可以使数字和为目标数 target 的 所有 不同组合 ，并以列表形式返回。你可以按 任意顺序 返回这些组合。
//candidates 中的 同一个 数字可以 无限制重复被选取 。如果至少一个数字的被选数量不同，则两种组合是不同的。
//
//对于给定的输入，保证和为 target 的不同组合数少于 150 个。

//示例 1：
//输入：candidates = [2,3,6,7], target = 7
//输出：[[2,2,3],[7]]
//解释：
//2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。
//7 也是一个候选， 7 = 7 。
//仅有这两种组合。

//示例 2：
//输入: candidates = [2,3,5], target = 8
//输出: [[2,2,2,2],[2,3,3],[3,5]]

//示例 3：
//输入: candidates = [2], target = 1
//输出: []

//提示：
//1 <= candidates.length <= 30
//1 <= candidates[i] <= 200
//candidate 中的每个元素都 互不相同
//1 <= target <= 500

//
//  124. 二叉树中的最大路径和.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2022/7/21.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/binary-tree-maximum-path-sum

import Foundation

extension Solution {
    
//    76 ms 78.90%
//    15.9 MB 21.10%
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        var res = Int.min
        _ = _dfs(root, res: &res)
        return res
    }
    
    private func _dfs(_ root: TreeNode?, res: inout Int) -> Int {
        guard let node = root else {
            return 0
        }
        
        // 关键点就在这个0上面
        let left = max(0, _dfs(node.left, res: &res))
        let right = max(0, _dfs(node.right, res: &res))
        
        let cur = max(left, right) + node.val
        res = max(res, left + right + node.val)
        
        return cur
        
    }
}

func test124MaxPathSum() {
    
    var root = "[-10,9,20,null,null,15,7]"
    root = "[2,-1]"
    let t1 = BinaryTree().initWithInput(root)
    let x = LeetCode.maxPathSum(t1)
    print(x)
}


//   2
//  /
// -1

//路径 被定义为一条从树中任意节点出发，沿父节点-子节点连接，达到任意节点的序列。
// 同一个节点在一条路径序列中 至多出现一次 。该路径 至少包含一个 节点，且不一定经过根节点。
//路径和 是路径中各节点值的总和。
//给你一个二叉树的根节点 root ，返回其 最大路径和 。

//示例 1：
//输入：root = [1,2,3]
//输出：6
//解释：最优路径是 2 -> 1 -> 3 ，路径和为 2 + 1 + 3 = 6

//示例 2：
//输入：root = [-10,9,20,null,null,15,7]
//输出：42
//解释：最优路径是 15 -> 20 -> 7 ，路径和为 15 + 20 + 7 = 42

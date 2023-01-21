//
//  938. 二叉搜索树的范围和.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2022/7/13.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/range-sum-of-bst

import Foundation

extension Solution {
    
//    412 ms 67.57%
//    15.5 MB 97.30%
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        _dsf(root, low, high, sum: &sum)
        return sum
    }
    
    private func _dsf(_ root: TreeNode?, _ low: Int, _ high: Int, sum: inout Int) {
        guard let node = root else {
            return
        }
        
        _dsf(node.left, low, high, sum: &sum)
        
        if node.val >= low && node.val <= high {
            sum += node.val
        }
        
        _dsf(node.right, low, high, sum: &sum)
    }
}

func test783rangeSumBST() {
    let root = BinaryTree().initWithInput("[10,5,15,3,7,null,18]")
    let low = 7, high = 15
    let x = LeetCode.rangeSumBST(root, low, high)
    print(x)
}

//给定二叉搜索树的根结点 root，返回值位于范围 [low, high] 之间的所有结点的值的和。
//
//示例 1：
//输入：root = [10,5,15,3,7,null,18], low = 7, high = 15
//输出：32
//
//示例 2：
//输入：root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
//输出：23
//
//提示：
//树中节点数目在范围 [1, 2 * 104] 内
//1 <= Node.val <= 105
//1 <= low <= high <= 105
//所有 Node.val 互不相同




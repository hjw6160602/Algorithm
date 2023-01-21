//
//  94. 二叉树的中序遍历.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2022/7/14.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/binary-tree-inorder-traversal

import Foundation

extension Solution {
    
//    4 ms  80.00%
//    13.9 MB 29.01%
//    70 / 70
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        _dfs(root, &res)
        return res
    }
    
    private func _dfs(_ root: TreeNode?, _ nums: inout [Int]) {
        guard let node = root else {
            return
        }
        
        _dfs(node.left, &nums)
        nums.append(node.val)
        _dfs(node.right, &nums)
        
    }
}


func test94InorderTraversal() {
    let root = BinaryTree().initWithInput("[1,null,2,3]")
    let x = LeetCode.inorderTraversal(root)
    print(x)
}

//给定一个二叉树的根节点 root ，返回 它的 中序 遍历 。
//
//示例 1：
//输入：root = [1,null,2,3]
//输出：[1,3,2]
//
//示例 2：
//输入：root = []
//输出：[]
//
//示例 3：
//输入：root = [1]
//输出：[1]

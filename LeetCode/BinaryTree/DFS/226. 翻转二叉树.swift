//
//  226. 翻转二叉树.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2022/7/19.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/invert-binary-tree

import Foundation

extension Solution {
//    0 ms 100.00%
//    13.8 MB 77.51%
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        _dfsInvert(root)
        return root
    }
    
    private func _dfsInvert(_ root: TreeNode?) {
        guard let node = root else {
            return
        }
        let leftChild = node.left
        let righChild = node.right
        node.left = righChild
        node.right = leftChild
        
        _dfsInvert(node.left)
        _dfsInvert(node.right)
        
    }
}

func test226InvertTree() {
    let root = BinaryTree().initWithInput("[]")
    let x = LeetCode.invertTree(root)
    print(x)
}

//给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。
//
//示例 1：
//输入：root = [4,2,7,1,3,6,9]
//输出：[4,7,2,9,6,3,1]
//
//示例 2：
//输入：root = [2,1,3]
//输出：[2,3,1]
//
//示例 3：
//输入：root = []
//输出：[]

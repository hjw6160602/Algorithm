//
//  100. 相同的树.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2022/7/14.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/same-tree

import Foundation

extension Solution {
    
//    4 ms 81.65%
//    13.9 MB 43.12%
//    60 / 60
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return _check(p, q)
    }
    
    private func _check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil || q?.val != p?.val {
            return false
        }
        
        return _check(p?.left, q?.left) && _check(p?.right, q?.right)
    }
}

func test100IsSameTree() {
    let root1 = BinaryTree().initWithInput("[1,2]")
    let root2 = BinaryTree().initWithInput("[1,null,2]")
    let x = LeetCode.isSameTree(root1, root2)
    print(x)
}


//给你两棵二叉树的根节点 p 和 q ，编写一个函数来检验这两棵树是否相同。
//如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

//示例 1：
//输入：p = [1,2,3], q = [1,2,3]
//输出：true
//
//示例 2：
//输入：p = [1,2], q = [1,null,2]
//输出：false
//
//示例 3：
//输入：p = [1,2,1], q = [1,1,2]
//输出：false

//提示：
//两棵树上的节点数目都在范围 [0, 100] 内
//-104 <= Node.val <= 104

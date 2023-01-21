//
//  572. 另一棵树的子树.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2022/7/13.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/subtree-of-another-tree

import Foundation

extension Solution {
    
//    148 ms 5.36%
//    13.8 MB 80.36%
    
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        return _dfs(root, subRoot)
    }
    
    private func _dfs(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard let s = s else {
            return false
        }
        // 优先check 如果发现是子树 那么久return了 如果不是才会去 遍历左子树和右子树
        return _check(s, t) || _dfs(s.left, t) || _dfs(s.right, t)
    }
    

//    88 ms 78.57%
//    13.6 MB 98.21%
    func isSubtreeP1(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let s = root else {
            return false
        }
        return _check(s, subRoot) || isSubtreeP1(s.left, subRoot) || isSubtreeP1(s.right, subRoot)
    }
    
    private func _check(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            // 如果都为空 那么证明当前节点 相同
            return true
        }
        if s == nil || t == nil || s?.val != t?.val {
            // 如果有一个 不为空 或者 连个节点的值不相等 那么 不同
            return false
        }
        return _check(s?.left, t?.left) && _check(s?.right, t?.right)
    }
}

func test572rangeSumBST() {
//    let root = BinaryTree().initWithInput("[3,4,5,1,2,null,null,null,null,0]")
//    let subRoot = BinaryTree().initWithInput("[4,1,2]")
    
    let root = BinaryTree().initWithInput("[3,4,5,1,2]")
    let subRoot = BinaryTree().initWithInput("[4,1,2]")
    let x = LeetCode.isSubtree(root, subRoot)
    print(x)
}

//给你两棵二叉树 root 和 subRoot 。检验 root 中是否包含和 subRoot 具有相同结构和节点值的子树。
//如果存在，返回 true ；否则，返回 false 。
//二叉树 tree 的一棵子树包括 tree 的某个节点和这个节点的所有后代节点。tree 也可以看做它自身的一棵子树。
//
//示例 1：
//输入：root = [3,4,5,1,2], subRoot = [4,1,2]
//输出：true
//
//示例 2：
//输入：root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
//输出：false
//
//提示：
//root 树上的节点数量范围是 [1, 2000]
//subRoot 树上的节点数量范围是 [1, 1000]
//-104 <= root.val <= 104
//-104 <= subRoot.val <= 104


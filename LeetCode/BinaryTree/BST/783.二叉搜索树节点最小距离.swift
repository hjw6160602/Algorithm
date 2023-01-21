//
//  783.二叉搜索树节点最小距离.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2022/7/13.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/minimum-distance-between-bst-nodes

import Foundation



extension Solution {
    
//    4 ms 100.00%
//    14 MB 12.50%
//    48 / 48
    // 利用BST的特点 中序遍历后的结果是一个有序数组 那么只需要记住上一个数就好
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var min = Int.max, pre = -1
        _dsfMinDiff(root, pre: &pre, minValue: &min)
        return min
    }
    
    private func _dsfMinDiff(_ root: TreeNode?, pre: inout Int, minValue: inout Int) {
        guard let node = root else {
            return
        }
        _dsfMinDiff(node.left, pre: &pre, minValue: &minValue)
        if pre == -1 {
            pre = node.val
        } else {
            minValue = min(minValue, node.val - pre)
            print("pre: \(pre), node->\(node.val), minVal:\(minValue)")
            pre = node.val
        }
        _dsfMinDiff(node.right, pre: &pre, minValue: &minValue)
    }
}

func test783MinDiffInBST() {
    let root = BinaryTree().initWithInput("[90,69,null,49,89,null,52]")
    let x = LeetCode.minDiffInBST(root)
    print(x)
}


//给你一个二叉搜索树的根节点 root ，返回 树中任意两不同节点值之间的最小差值 。
//差值是一个正数，其数值等于两值之差的绝对值。
//
//示例 1：
//输入：root = [4,2,6,1,3]
//输出：1
//
//示例 2：
//输入：root = [1,0,48,null,null,12,49]
//输出：1
//
//
//提示：
//树中节点的数目范围是 [2, 100]
//0 <= Node.val <= 105


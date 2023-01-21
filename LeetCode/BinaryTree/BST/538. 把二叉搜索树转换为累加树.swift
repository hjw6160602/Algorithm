//
//  538. 把二叉搜索树转换为累加树.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2022/7/14.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/convert-bst-to-greater-tree

import Foundation

extension Solution {

//    64 ms  84.31%
//    14.9 MB 98.04%
//    215 / 215
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        _dfs(root, &sum)
        return root
    }
    
    private func _dfs(_ root: TreeNode?,_ sum: inout Int) {
        guard let node = root else {
            return
        }
        
        _dfs(node.right, &sum)
        
        sum += node.val
        node.val = sum
        
        _dfs(node.left, &sum)
    }
}

func test538ConvertBST() {
    let root = BinaryTree().initWithInput("[4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]")
    let x = LeetCode.convertBST(root)
    print(x!.val)
}


//给出二叉 搜索 树的根节点，该树的节点值各不相同，请你将其转换为累加树（Greater Sum Tree），使每个节点 node 的新值等于原树中大于或等于 node.val 的值之和。

//提醒一下，二叉搜索树满足下列约束条件：
//节点的左子树仅包含键 小于 节点键的节点。
//节点的右子树仅包含键 大于 节点键的节点。
//左右子树也必须是二叉搜索树。

//示例 1：
//输入：[4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
//输出：[30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]

//示例 2：
//输入：root = [0,null,1]
//输出：[1,null,1]

//示例 3：
//输入：root = [1,0,2]
//输出：[3,3,2]

//示例 4：
//输入：root = [3,2,4,1]
//输出：[7,9,4,10]

//注意：本题和 1038: https://leetcode-cn.com/problems/binary-search-tree-to-greater-sum-tree/ 相同

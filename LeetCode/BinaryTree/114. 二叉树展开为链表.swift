//
//  114. 二叉树展开为链表.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2022/8/16.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/flatten-binary-tree-to-linked-list

import Foundation


extension Solution {
//    12 ms 58.06%
//    14.1 MB 64.52%
//    Time Complexity: O(n), Space Complexity: O(1)
    func flattenSoap(_ root: TreeNode?) {
        helper(root)
    }
    
    @discardableResult
    private func helper(_ node: TreeNode?) -> TreeNode? {
        var node = node
        if node == nil {
            return node
        }
        if node!.left == nil && node!.right == nil {
            return node
        }
        
        let left = node!.left, right = node!.right
        node!.left = nil
        
        if let left = left {
            node!.right = left
            node = helper(left)
        }
        if let right = right {
            node!.right = right
            node = helper(right)
        }
        
        return node
    }
    
//    8 ms 98.92%
//    13.9 MB 87.10%
    func flattenJava(_ root: TreeNode?) {
        var node = root
        while (node != nil) {
            //左子树为 nil，直接考虑下一个节点
            guard var pre = node!.left else {
                node = node!.right
                continue
            }
            // 找左子树最右边的节点
            while (pre.right != nil) {
                pre = pre.right!
            }
            //将原来的右子树接到左子树的最右边节点
            pre.right = node!.right
            // 将左子树插入到右子树的地方
            node!.right = node!.left
            node!.left = nil
            // 考虑下一个节点
            node = node!.right
        }
    }
    
//    12 ms 58.06%
//    14.4 MB 8.60%
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        var path = [Int]()
        _dfs(root, &path)
        
        var node = root
        for i in 1..<path.count {
            node.left = nil
            node.right = TreeNode(path[i])
            node = node.right!
        }
    }
    
    private func _dfs(_ root: TreeNode?, _ path: inout [Int]) {
        guard let node = root else {
            return
        }
        path.append(node.val)
        _dfs(node.left, &path)
        _dfs(node.right, &path)
    }
}

func test114Flatten() {
    let root = BinaryTree().initWithInput("[1]")
    LeetCode.flatten(root)
}

//给你二叉树的根结点 root ，请你将它展开为一个单链表：
//展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
//展开后的单链表应该与二叉树 先序遍历 顺序相同。
//
//示例 1：
//输入：root = [1,2,5,3,4,null,6]
//输出：[1,null,2,null,3,null,4,null,5,null,6]
//
//示例 2：
//输入：root = []
//输出：[]
//
//示例 3：
//输入：root = [0]
//输出：[0]
//
//提示：
//树中结点数在范围 [0, 2000] 内
//-100 <= Node.val <= 100
//
//进阶：你可以使用原地算法（O(1) 额外空间）展开这棵树吗？

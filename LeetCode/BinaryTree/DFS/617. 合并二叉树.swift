//
//  617. 合并二叉树.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2022/7/14.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/merge-two-binary-trees

import Foundation

extension Solution {
//    72 ms 99.32%
//    14.2 MB 75.67%
//    182 / 182
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        return _merge(root1, root2)
    }
    
    private func _merge(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else {
            return root2
        }
        guard let root2 = root2 else {
            return root1
        }

        let node = TreeNode()
        node.val = root1.val + root2.val
        
        node.left = _merge(root1.left, root2.left)
        node.right = _merge(root1.right, root2.right)
        
        return node
    }
}

func test617MergeTrees() {
    let root1 = "[1,3,2,5]", root2 = "[2,1,3,null,4,null,7]"
    let t1 = BinaryTree().initWithInput(root1)
    let t2 = BinaryTree().initWithInput(root2)
    let x = LeetCode.mergeTrees(t1, t2)
    print(x!.val)
}


//给你两棵二叉树： root1 和 root2 。
//想象一下，当你将其中一棵覆盖到另一棵之上时，两棵树上的一些节点将会重叠（而另一些不会）。你需要将这两棵树合并成一棵新二叉树。合并的规则是：如果两个节点重叠，那么将这两个节点的值相加作为合并后节点的新值；否则，不为 null 的节点将直接作为新二叉树的节点。
//返回合并后的二叉树。
//注意: 合并过程必须从两个树的根节点开始。

//示例 1：
//输入：root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
//输出：[3,4,5,5,4,null,7]

//示例 2：
//输入：root1 = [1], root2 = [1,2]
//输出：[2,2]

//提示：
//两棵树中的节点数目在范围 [0, 2000] 内
//-104 <= Node.val <= 104



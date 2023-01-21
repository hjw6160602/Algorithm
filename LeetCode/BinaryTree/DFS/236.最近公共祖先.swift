//
//  236.最近公共祖先.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/2/24.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/

import Foundation

extension Solution {
    
    /**
     * 如果p、q 同事存在于这颗二叉树中，就成共返回它们的最近公共祖先
     * 如果p、q 都不存在与这颗二叉树中，就返回nil
     * 如果只有p存在于这棵二叉树中就返回p
     * 如果只有q存在于这棵二叉树中就返回q
     */
    // 去以root为根节点的二叉树中查找p、去的公共祖先
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || root?.val == p?.val || root?.val == q?.val {
            return root
        }
        // 去以root左半部分为根节点的二叉树中查找p、去的公共祖先
        let left = lowestCommonAncestor(root?.left, p, q) //5
        
        // 去以root右半部分为根节点的二叉树中查找p、去的公共祖先
        let right = lowestCommonAncestor(root?.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        
        return (left != nil) ? left : right
    }
    
//    52 ms 99.47%
//    16.1 MB 21.92%
//    31 / 31
    func lowestCommonAncestorP1(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil ||
            root?.val == p?.val ||
            root?.val == q?.val {
            return root
        }
        
        let left = lowestCommonAncestorP1(root?.left, p, q)
        let right = lowestCommonAncestorP1(root?.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        return left != nil ? left : right
    }
}

func testlowesTCommonAncestor() {
    let tree = BinaryTree()
    let root = tree.initWithArray(["3", "5", "1", "6", "2", "0", "8", "null", "null", "7", "4"])
    let node = LeetCode.lowestCommonAncestorP1(root, root?.left, root?.right)
    print(node?.val ?? "nil")
}

// 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
//
// 对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，
// 满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）

// 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
// 输出：3
// 解释：节点 5 和节点 1 的最近公共祖先是节点 3 。

// 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
// 输出：5
// 解释：节点 5 和节点 4 的最近公共祖先是节点 5
// 因为根据定义最近公共祖先节点可以为节点本身。

// 输入：root = [1,2], p = 1, q = 2
// 输出：1
 
// 提示：
// 树中节点数目在范围 [2, 105] 内。
// -109 <= Node.val <= 109
// 所有 Node.val 互不相同 。
// p != q
// p 和 q 均存在于给定的二叉树中
//


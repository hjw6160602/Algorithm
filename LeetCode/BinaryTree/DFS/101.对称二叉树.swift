//
//  101.对称二叉树.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/3/11.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/symmetric-tree

import Foundation


extension Solution {
    /// 给定一个二叉树，检查它是否是镜像对称的
    //         1
    //       /   \
    //     2       2
    //    / \     / \
    //   3   4   4   3
    //  / \ / \ / \ / \
    //  6 5 5 6 6 5 5 6
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return isSymmetricHelper(root.left, root.right)
    }
    
    private func isSymmetricHelper(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        
        if let left = left, let right = right, left.val == right.val {
            return isSymmetricHelper(left.left, right.right) && isSymmetricHelper(left.right, right.left)
        } else {
            return false
        }
    }
}

#warning("错误的解答")
class SymmetricTree {
    /// 妄图用中序遍历判断对称失败
    var vals: [Int] = []
    /// 给定一个二叉树，检查它是否是镜像对称的
    func isSymmetric(_ root: TreeNode?) -> Bool {
        _inorderTraversal(root: root)
        let maxIndex = vals.count - 1
        let mid = vals.count >> 1
        for i in 0..<mid {
            guard vals[i] == vals[maxIndex - i] else {
                return false
            }
        }
        return true
    }
    // 中序遍历对称
    private func _inorderTraversal(root node: TreeNode?) {
        guard node != nil else {
            return
        }
        _inorderTraversal(root: node!.left)
        vals.append(node!.val)
        _inorderTraversal(root: node!.right)
    }
}

func testIsSymmetric() {
    let tree = BinaryTree()
    let array = tree.initializeInput("[1,2,2,2,null,2]")
    let root = tree.initWithArray(array)
    let x = LeetCode.isSymmetric(root)
    
    print(x)
}


// 例如，二叉树 [1,2,2,3,4,4,3] 是对称的
//     1
//    / \
//   2   2
//  / \ / \
// 3  4 4  3

// 二叉树 [1,2,2,2,null,2] 不是镜像对称的
//     1
//    / \
//   2   2
//  /   /
// 2   2
 
// 下面这个 [1,2,2,null,3,null,3] 不是镜像对称的
//     1
//    / \
//   2   2
//    \   \
//    3    3

//进阶：
//你可以运用递归和迭代两种方法解决这个问题吗？

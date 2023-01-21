//
//  112.路径总和.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/3/17.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/path-sum

import Foundation


extension Solution {
    // 判断该树中是否存在 根节点到叶子节点 的路径
    // 这条路径上所有节点值相加等于目标和 targetSum
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        // 是叶子节点
        if targetSum == root.val && root.left == nil && root.right == nil {
            return true
        }
        
        // 判断左子树中是否有路径和
        if hasPathSum(root.left, targetSum - root.val) {
            return true
        }
        // 判断右子树种是否有路径和
        return hasPathSum(root.right, targetSum - root.val)
    }
    
    func hasPathSumSoap(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        
        if sum == root.val && root.left == nil && root.right == nil {
            return true
        }
        
        return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val)
    }
    
    func hasPathSumOrigin(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        // 是叶子节点
        if targetSum == root.val && root.left == nil && root.right == nil {
            return true
        }
        
        // 判断左子树中是否有路径和
        var leftHas = false, rightHas = false
        if let left = root.left {
            leftHas = hasPathSum(left, targetSum - root.val)
        }
        if leftHas { return true }
        
        // 判断右子树种是否有路径和
        if let right = root.right {
            rightHas = hasPathSum(right, targetSum - root.val)
        }
        return rightHas
    }
    
    // 第一次 尝试 没有考虑到叶子节点 算出了 二叉树中的路径存在和
    func hasPathSumWrong(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root,
              targetSum >= root.val else {
            return false
        }
        
        if targetSum == root.val { return true }
        
        var leftHas = false, rightHas = false
        if let left = root.left {
            leftHas = hasPathSum(left, targetSum - root.val)
        }
        if leftHas { return true }
        
        if let right = root.right {
            rightHas = hasPathSum(right, targetSum - root.val)
        }
        return rightHas
    }
}

//        5
//      /   \
//     4     8
//    /     / \
//   11   13   4
//  / \         \
// 7   2         1

func testhasPathSum() {
    let tree = BinaryTree()
    let array = tree.initializeInput("[5,4,8,11,null,13,4,7,2,null,null,null,1]")
//    let array = tree.initializeInput("[-2,null,-3]")
//    let array = tree.initializeInput("[1,2,3]")
    let root = tree.initWithArray(array)
    let x = LeetCode.hasPathSum(root, 22) //true
    print(x)
    
}




// 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum
// 判断该树中是否存在 根节点到叶子节点 的路径
// 这条路径上所有节点值相加等于目标和 targetSum

// 示例 1：
// 输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
// 输出：true
 
// 示例 2：
// 输入：root = [1,2,3], targetSum = 5
// 输出：false
 
// 示例 3：
// 输入：root = [1,2], targetSum = 0
// 输出：false

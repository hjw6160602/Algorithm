//
//  104.二叉树的最大深度.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/3/19.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/maximum-depth-of-binary-tree
 
import Foundation

extension Solution {
    //  dp[root] = max(dp[root.left] + 1 ，dp[root.right] + 1)
    func maxDepth104(_ root: TreeNode?) -> Int {
        let max = dfs(root)
        return max
    }
    
    private func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let lm = dfs(root.left) + 1
        let rm = dfs(root.right) + 1
        
        return max(lm, rm)
    }
    
//    执行用时：28 ms 在所有 Swift 提交中击败了 53.40% 的用户
//    内存消耗：14.2 MB 在所有 Swift 提交中击败了 53.06% 的用户
//    通过测试用例：39 / 39
    
    func maxDepthPractice(_ root: TreeNode?) -> Int {
        return dfs(node: root)
    }

    func dfs(node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        let depthL = dfs(node: node.left) + 1
        let depthR = dfs(node: node.right) + 1
        
        return max(depthL, depthR)
    }
    
}

func test104MaxDepth() {
    let bt = BinaryTree()
    let head = bt.initWithArray(["3","9","20","null","null","15","7"])
    let depth = LeetCode.maxDepth104(head)
    print(depth)
}





// 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
// 说明: 叶子节点是指没有子节点的节点。
 
// 示例：
// 给定二叉树 [3,9,20,null,null,15,7]
//     3
//    / \
//   9  20
//     /  \
//    15   7
// 返回它的最大深度 3 。
 

//
//  Offer55. 二叉树的深度.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/2/25.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof

import Foundation

extension Solution {
    //  dp[root] = max(dp[root.left] + 1 ，dp[root.right] + 1)
    func maxDepth(_ root: TreeNode?) -> Int {
        let max = dfs(root)
        return max
    }
    //    3
    //   / \
    //  9  20
    //    /  \
    //   15   7
    //     \
    //      1
    private func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let lm = dfs(root.left) + 1
        let rm = dfs(root.right) + 1
        
        return max(lm, rm)
    }
}

func testMaxDepth() {
    let bt = BinaryTree()
    let head = bt.initWithArray(["3","9","20","null","null","15","7","null","1"])
    let depth = LeetCode.maxDepth(head)
    print(depth)
}

//所以dp[二叉树的节点n] = 第n个结构构成的树的深度。
//也就是说二叉树的节点就是“状态”

//
//状态就是dp[二叉树的节点n] = 第n个结构构成的树的深度。
//
//base case 就是 dp[节点为Null] = 0（或者 dp[叶子节点] = 1）；
//
//选项就是 选项1=( dp[左子节点] +1 )。选项2 = (dp[右子节点] + 1)
//
//择优策略就简单了，看哪个选项大就选哪个。
//
//状态转移方程最终就是长这个样子：
//dp[root] = max( dp[左子节点] + 1 ，dp[右子节点] + 1) , if  节点== null， return 0;

//代码如下：
// int maxDepth( TreeNode node ) {
//    if(node == null) {
//        return 0;
//    }
//    int leftDepth = maxDepth(node.left);
//    int rightDepth = maxDepth(node.right) ;
//    return  Math.max(leftDepth + 1 , rightDepth + 1 );
// }
//
//- 和上面的算法比起来，其实就是一个后续遍理的回溯的过程。
//- 我们的第一种解法采用的是，前序遍理，然后再递推的过程累计节点长度。
//- 而第二种揭发是采用后续遍理，在回溯的过程累计节点长度。
//- 理论上我们并没有真正的用动态规划算法（我们用的是递归的回溯算法，因为我们并没有记录dp表。），但是思想上是动态规划的思想。
//- 不管如何这道题目后续和前需遍理都可以求解。
//- 前序遍理有利于我们对算法进行剪支，减少不必要的遍理（我们这里没有可以用剪支的场景）。
//- 而后续遍理可以用回溯计算，减少函数局部变量的开销。但是无法剪支。

//输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

//例如：
//给定二叉树 [3,9,20,null,null,15,7]，
//    3
//   / \
//  9  20
//    /  \
//   15   7
//返回它的最大深度 3 。

//提示：
//节点总数 <= 10000

//
//  113.路径总和.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/2/25.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/path-sum-ii

import Foundation

extension Solution {
    

//    20 ms 97.53%
//    14.2 MB 44.44%
//    115 / 115
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }
        
        var res = [[Int]]()
        var path = [Int]()
        
        _dfs(root: root, left: targetSum, path: &path, res: &res)
        return res
    }
    
    private func _dfs(root: TreeNode, left: Int, path: inout [Int], res: inout [[Int]]) {
        if root.left == nil && root.right == nil && left == root.val {
            path.append(root.val)
            res.append(path)
            path.removeLast()
            return
        }
        
        if let lChild = root.left {
            path.append(root.val)
            _dfs(root: lChild, left: left - root.val, path: &path, res: &res)
            path.removeLast()
        }
        
        if let rChild = root.right {
            path.append(root.val)
            _dfs(root: rChild, left: left - root.val, path: &path, res: &res)
            path.removeLast()
        }
    }
    
    //    20 ms 97.65%
    //    18.9 MB  5.88%
    //    115 / 115
    func pathSumSoap(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var paths = [[Int]](), path = [Int]()
        
        dfs(root, targetSum, &paths, &path)
        
        return paths
    }
    
    fileprivate func dfs(_ root: TreeNode?, _ sum: Int, _ paths: inout [[Int]], _ path: inout [Int]) {
        guard let root = root else { return }
        
        path.append(root.val)
        
        if root.val == sum &&
            root.left == nil &&
            root.right == nil {
            paths.append(path)
            return
        }
        
        var pathLeft = path, pathRight = path
        
        dfs(root.left, sum - root.val, &paths, &pathLeft)
        dfs(root.right, sum - root.val, &paths, &pathRight)
    }
}

func testPathSum() {
    let tree = BinaryTree()
    let root = tree.initWithInput("[5,4,8,11,null,13,4,7,2,null,null,5,1]")
//    let root = tree.initWithInput("[1,2]")
//    let root = tree.initWithInput("[-2,null,-3]")
    
    let res = Solution.shared.pathSum(root, 22)
    print(res)
}

//给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。
//说明: 叶子节点是指没有子节点的节点。

//示例:
//给定如下二叉树，以及目标和 sum = 22，

//        5
//       / \
//      4   8
//     /   / \
//    11  13  4
//   /  \    / \
//  7    2  5   1

//[
//   [5,4,11,2],
//   [5,8,4,5]
//]


//    通过测试用例：
//    92 / 115
//    输入：
//    [1,2]
//    1
//    输出：
//    [[1]]
//    预期结果：
//    []
    
    
//    [-2,null,-3]
//    -5
//    输出：
//    []
//    预期结果：
//    [[-2,-3]]

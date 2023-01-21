//
//  102.二叉树的层序遍历.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2022/7/14.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
//    8 ms 96.10%
//    14 MB 54.22%
//    34 / 34
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }

        var res = [[Int]]()
        var queue: [TreeNode] = [root]
        _bfs(&queue, &res)
        return res
    }
    
    private func _bfs(_ queue: inout [TreeNode], _ res: inout [[Int]]) {
        guard queue.count > 0 else {
            return
        }
        var currentLevel = [Int]()
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            currentLevel.append(node.val)
            if let leftNode = node.left {
                queue.append(leftNode)
            }
            if let rightNode = node.right {
                queue.append(rightNode)
            }
        }
        res.append(currentLevel)
        _bfs(&queue, &res)
    }
    
    func levelOrderP1(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue: [TreeNode] = [root]
        _bfs1(&queue, &res)
        return res
    }
    
    private func _bfs1(_ queue: inout [TreeNode], _ res: inout [[Int]]) {
        while !queue.isEmpty {
            var currentLevel = [Int]()
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                currentLevel.append(node.val)
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
            res.append(currentLevel)
        }
    }
    
//    8 ms 96.10%
//    13.9 MB 77.60%
//    34 / 34
    func levelOrderP2(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            var currentLevel = [Int]()
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                currentLevel.append(node.val)
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
            res.append(currentLevel)
        }
        
        return res
    }
}



func test102levelOrder() {
    let root = BinaryTree().initWithInput("[3,9,20,null,null,15,7]")
    let x = LeetCode.levelOrderP2(root)
    print(x)
}

//示例 1：
//输入：root = [3,9,20,null,null,15,7]
//输出：[[3],[9,20],[15,7]]
//
//示例 2：
//输入：root = [1]
//输出：[[1]]
//
//示例 3：
//输入：root = []
//输出：[]
//提示：
//树中节点数目在范围 [0, 2000] 内
//-1000 <= Node.val <= 1000



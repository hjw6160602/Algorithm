//
//  103. 二叉树的锯齿形层序遍历.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2023/2/27.
//  Copyright © 2023 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/binary-tree-zigzag-level-order-traversal/
 
import Foundation


extension Solution {
//    4 ms 100%
//    14 MB 42
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        guard let node = root else {
            return res
        }
        
        var isLeft2Right = true
        var queue: [TreeNode] = [node]
        res.append([node.val])
        while !queue.isEmpty {
            // 每一层进来后都调转方向
            isLeft2Right = !isLeft2Right
            var path = [TreeNode]()
            for _ in 0..<queue.count {
                let head = queue.removeFirst()
                if let left = head.left {
                    path.append(left)
                }
                if let right = head.right {
                    path.append(right)
                }
            }
            if path.count > 0 {
                queue.append(contentsOf: path)
                if !isLeft2Right {
                    path = path.reversed()
                }
                res.append(path.map{$0.val})
            }
        }
        return res
    }
}

func test103zigzagLevelOrder() {
    let root = BinaryTree().initWithInput("[1,2,3,4,null,null,5]")
//    let root = BinaryTree().initWithInput("[]")
    let x = LeetCode.zigzagLevelOrder(root)
    print(x)
}

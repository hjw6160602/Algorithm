//
//  107. 二叉树的层序遍历 II.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2022/7/6.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    执行用时：
//    8 ms
//    , 在所有 Swift 提交中击败了
//    95.31%
//    的用户
//    内存消耗：
//    14 MB
//    , 在所有 Swift 提交中击败了
//    53.13%
//    的用户
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        guard let root = root else { return res }

        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var curLevel = [Int]()
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                curLevel.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.insert(curLevel, at: 0)
        }
        
        return res
    }
}

func test107LevelOrderBottom() {
    let root = BinaryTree().initWithInput("[3,9,20,null,null,15,7]")
    let x = LeetCode.levelOrderBottom(root)
    print(x)
}

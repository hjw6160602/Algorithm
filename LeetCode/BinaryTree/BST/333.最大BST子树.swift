//
//  333.最大BST子树.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2021/2/24.
//  Copyright © 2021 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    func largestBSTSubtree(root: TreeNode?) -> Int {
        guard let node = root,
              let info = getInfo(root: node) else {
            return 0
        }
        return info.size
    }
    
    /// 返回以root为根节点的二叉树的最大BST子树信息
    private func getInfo(root: TreeNode?) -> Info? {
        guard let root = root else {
            return nil
        }
        var li = getInfo(root: root.left)
        var ri = getInfo(root: root.right)
        
        /**
         * 有4种情况 以root为根节点的二叉树就是一颗BST 最大BST子树就是其本身
         * ① li != nil && ri != nil
         *   && li!.root == node.left && node.val > li!.max
         *   && ri!.root == node.right && node.val < ri.max
         * ② li != nil && ri == nil
         *    && li.root == root.left && root.val > li.max
         * ③ ri != nil && li == nil
         *    && ri.root == root.right && root.val < ri.min
         * ④ ri == nil && li == nil
         */
        
        var leftBSTSize = -1, rightBSTSize = -1, max = 0, min = 0
        if li == nil {
            leftBSTSize = 0
        }
//        else if li!.root == root.left && root.val > li!.max {
//            // 左边就是bst
//            leftBSTSize = li!.size
//            min = li!.min
//        }
        
        if ri == nil {
            rightBSTSize = 0
        }
//        else if ri!.root == root.right && root.val < ri!.min {
//            rightBSTSize = ri!.size
//            max = ri!.min
//        }
        
        if leftBSTSize >= 0 && rightBSTSize >= 0 {
            return Info(root, size: 1 + leftBSTSize + rightBSTSize, max: max, min: min)
        }
        
        return nil
    }
    
    class Info {
        /// 根节点
        var root: TreeNode?
        /// 总结点数
        var size: Int = 0
        /// 最大值
        var max: Int = 0
        /// 最小值
        var min: Int = 0
        
        init() { }
        
        init(_ root: TreeNode?, size: Int, max: Int, min: Int) {
            self.root = root
            self.size = size
            self.max = max
            self.min = min
        }
    }
}

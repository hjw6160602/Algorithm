//
//  99. 恢复二叉搜索树.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/2/24.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/recover-binary-search-tree

import Foundation

class RecoverBinarySearchTree {
    /// 上一次中序遍历的节点
    var prev: TreeNode?
    /// 第1个错误节点
    var first: TreeNode?
    /// 第2个错误节点
    var second: TreeNode?
    
    // 这道题的关键点是 BST用中序遍历 是一个有序数组
    // 然后利用有序数组去交换节点的val
    func recoverTree(_ root: TreeNode?) {
        // 发现了逆序对
        _findWrongNodes(root)
        // 交换两个逆序对的值
        (first!.val, second!.val) = (second!.val, first!.val)
    }
    
    private func _findWrongNodes(_ root: TreeNode?) {
        guard root != nil else {
            return
        }
        _findWrongNodes(root?.left)
        // 处理逻辑 出现了逆序对
        if prev != nil && prev!.val > root!.val {
            // 第2个错误节点是 第2个逆序对中较小的那个节点
            second = root
            if first != nil {
                return
            }
            first = prev
        }
        prev = root
        _findWrongNodes(root?.right)
    }
    
//    40 ms 95.83%：
//    14.1 MB 14.58%
//    1919 / 1919 Space: O(n)  T: O(h)
    func recoverTreeP1(_ root: TreeNode?) {
        // 发现了逆序对
        _findWrongNodesP1(root)
        // 交换两个逆序对的值
        (first!.val, second!.val) = (second!.val, first!.val)
    }
    
    private func _findWrongNodesP1(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        _findWrongNodesP1(root.left)
        
        if prev != nil && prev!.val > root.val {
            second = root
            // 找到了第二个位置 并且第一个位置不为空
            if first != nil {
                return
            }
            first = prev
        }
        
        prev = root
        _findWrongNodesP1(root.right)
    }
    
    // 利用Morris遍历 实现空间复杂度为O(1)
    func recoverTreeP2(_ root: TreeNode?) {
        // 发现了逆序对
        _findWrongNodesP1(root)
        // 交换两个逆序对的值
        (first!.val, second!.val) = (second!.val, first!.val)
    }
}

func testRecoverTree() {
    let re = RecoverBinarySearchTree()
    let bt = BinaryTree()
    let root = bt.initWithArray(["3","1","4","null","null","2"])
    
    re.recoverTreeP1(root)
    bt.inorderTraversal(root: bt.head)
    let res = bt.traversalResult.map{$0.val}
    print(res)
    
}

// 给你二叉搜索树的根节点 root ，该树中的两个节点被错误地交换。
// 请在不改变其结构的情况下，恢复这棵树
// 进阶：使用 O(n) 空间复杂度的解法很容易实现。你能想出一个只使用常数空间的解决方案吗？

// 输入：root = [1,3,null,null,2]
// 输出：[3,1,null,null,2]
// 解释：3 不能是 1 左孩子，因为 3 > 1 。交换 1 和 3 使二叉搜索树有效。

// 输入：root = [3,1,4,null,null,2]
// 输出：[2,1,4,null,null,3]
// 解释：2 不能在 3 的右子树中，因为 2 < 3 。交换 2 和 3 使二叉搜索树有效。

// 提示：
// 树上节点的数目在范围 [2, 1000] 内
// -231 <= Node.val <= 231 - 1

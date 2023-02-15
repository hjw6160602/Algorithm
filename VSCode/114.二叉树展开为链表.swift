/*
 * @lc app=leetcode.cn id=114 lang=swift
 *
 * [114] 二叉树展开为链表
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func flatten(_ root: TreeNode?) {
        guard var node = root else {
            return
        }

        flatten(node.left)
        flatten(node.right)
        /**** 后序遍历位置 ****/
        // 1、左右子树已经被拉平成一条链表
        let left = node.left
        let right = node.right

        node.left = nil
        node.right = left

        var rightLeaf = node
        while rightLeaf.right != nil {
            rightLeaf = rightLeaf.right!
        }

        rightLeaf.right = right
    }


    // private func traverse(_ root: TreeNode?) {
    //     guard var node = root else {
    //         return
    //     }
        
    //     traverse(node.left)
    //     traverse(node.right)
    //     if let leftNode = node.left {
    //         leftNode.right = node.right
    //         node.right = leftNode
    //     }
    // }
}
// @lc code=end

